require 'httparty'
require 'active_support/core_ext/string/multibyte'

class Rzdtc::Base
  include HTTParty

  base_uri 'https://pass.rzd.ru'
  default_timeout 5

  def base_url
    "/timetable/public/ru?STRUCTURE_ID=735&layer_id=5371&tfl=3&dir=0&checkSeats=1"
  end

  def base_path
  end

  def get_city_id(city)
    city = city.mb_chars.upcase.to_s
    url = "http://rzd.ru/suggester?stationNamePart=#{URI.escape(city)}\
          &lang=ru&lat=0&compactMode=y"

    suggestions = self.class.get(url)
    for suggestion in suggestions
      if suggestion["n"] == city
        return suggestion["c"]
      end
    end
    nil
  end

  def check_tickets(from, to, date)
    code0 = get_city_id(from)
    code1 = get_city_id(to)
    begin
      date = Date.parse(date).strftime('%d.%m.%Y')
    rescue ArgumentError
      print "invalid date"
      return
    end

    # from station
    station0 = "&st0=#{URI.escape(from)}"
    station_code0 = "&code0=#{code0}"
    date0 = "&dt0=#{date}"

    # to station
    station1 = "&st1=#{URI.escape(to)}"
    station_code1 = "&code1=#{code1}"

    # first request to get rid and JSESSIONID
    url1 = "#{base_url}#{station0}#{station_code0}#{date0}
    #{station1}#{station_code1}".gsub(" ", "")

    begin
      resp = self.class.get(url1)
    rescue URI::InvalidURIError
      print "URI must be ascii only"
      return
    end
    session_id = resp.headers["set-cookie"].split(",")[2].match('\JSESSIONID=(.*);')[1]
    rid = JSON.parse(resp.body)['rid']

    # add rid to first url and set session cookie
    url2 = url1 + "&rid=#{rid}"
    sleep(1)
    result = self.class.get(url2, headers: {"Cookie" => "JSESSIONID=#{session_id}"})
    data = JSON.parse(result.body)
    if data['result'] == "Error"
      []
    else
      data["tp"][0]["list"]
    end
  end
end

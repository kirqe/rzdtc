require "rzdtc/version"
require "rzdtc/base"

module Rzdtc
  def self.check_tickets(from, to, from_date, return_date = nil)
    Rzdtc::Base.new.check_tickets(from, to, from_date, return_date = nil)
  end
end

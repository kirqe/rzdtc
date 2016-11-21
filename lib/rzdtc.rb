require "rzdtc/version"
require "rzdtc/base"

module Rzdtc
  def self.check_tickets(from, to, date)
    Rzdtc::Base.new.check_tickets(from, to, date)
  end
end

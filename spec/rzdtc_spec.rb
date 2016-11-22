require 'spec_helper'
require 'active_support'
RSpec.describe Rzdtc::Base do
  describe "get_city_id(city)" do
    context "when city is found" do
      it "returns a city id" do
        id = Rzdtc::Base.new.get_city_id("МОСКВА")
        expect(id).to eq(2000000)
      end
    end

    context "when city is not found" do
      it "returns nil" do
        id = Rzdtc::Base.new.get_city_id("МСКА")
        expect(id).to eq(nil)
      end
    end
  end

  describe "def check_tickets(from, to, date)" do
    context "when date is valid" do
      it "returns a list of trains" do
        data = Rzdtc::Base.new.check_tickets("МОСКВА", "РОСТОВ", Date.today + 3)
        expect(data).to be_kind_of Array
      end
    end

    context "when date is not valid" do
      it "returns an empty list" do
        data = Rzdtc::Base.new.check_tickets("МОСКВА", "РОСТОВ", "")
        expect(data).to be nil
      end
    end

    context "when cities are invalid" do
      it "returns an empty list" do
        data = Rzdtc::Base.new.check_tickets("МОСКВА", "РОСВ", Date.today + 3)
        expect(data).to eq []
      end
    end
  end
end

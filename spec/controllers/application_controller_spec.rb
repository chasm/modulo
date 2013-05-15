require 'spec_helper'

describe ApplicationController do
  describe "get_uuids(num)" do
    it "returns multiple uuids in an array" do
      ctr = ApplicationController.new
      uuid_match = /([a-f0-9]{8})-([a-f0-9]{4})-([a-f0-9]{4})-([a-f0-9]{4})-([a-f0-9]{12})/i
      uuids = ctr.get_uuids(2)
      expect(uuids[0]).to match uuid_match
      expect(uuids[1]).to match uuid_match
    end
  end
end
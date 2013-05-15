require 'spec_helper'

describe "GET /uuids" do
  it "returns a JSON array with one UUID", :js => true do
    uuid_match = /([a-f0-9]{8})-([a-f0-9]{4})-([a-f0-9]{4})-([a-f0-9]{4})-([a-f0-9]{12})/i
    visit uuids_path
    body = JSON.parse(last_response.body)
    expect(body[0]).to match uuid_match
  end
end

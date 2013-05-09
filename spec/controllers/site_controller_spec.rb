require 'spec_helper'

describe SiteController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'uuids'" do
    it "returns http success" do
      get 'uuids'
      response.should be_success
    end
  end

end

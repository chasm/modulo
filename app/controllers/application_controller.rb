class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def get_uuids(num)
    (0...num).to_a.map do |i|
      SecureRandom.uuid
    end
  end
  helper_method :get_uuids
end

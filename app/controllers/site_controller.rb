class SiteController < ApplicationController
  def index
  end

  def uuids
    num = params[:num] || 1
    
    render :json => get_uuids(num.to_i)
  end
end

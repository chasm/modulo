class UsersController < ApplicationController
  def index
    sleep 1.5
    @users = User.all.to_a
  end

  def show
    begin
      @user = User.find params[:id]
    rescue
      head :not_found
    end
  end

  def update
    begin
      @user = User.find(params[:id])
      
      if @user.update_attributes(params[:user])
        head :no_content
      else
        render :errors, status: :unprocessable_entity 
      end
    rescue
      @user = User.new(params[:user])
      @user.id = params[:id]
      
      if @user.save
        render :show
      else
        render :errors, status: :unprocessable_entity 
      end
    end
  end

  def destroy
    begin
      User.find(params[:id]).destroy
      head :no_content
    rescue
      head :not_found
    end
  end
end

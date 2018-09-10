class UsersController < ApplicationController
  def index
    # render plain: "I'm in the index action!"
    render json: User.all
  end
  
  def create
    user = User.new(user_params)
    if user.save!
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    render json: User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id]).update(user_params)
    render json: User.find(params[:id])
  end
  
  def destroy
    # User.find(params[:id]).delete
    user = User.find_by(name: params[:name]).delete
    render json: User.all
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
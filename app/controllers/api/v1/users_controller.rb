class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :set_user, except:[:index, :create]

  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end

  def show
    render json: @user, serializer: UserSerializer
  end

  def update
    if @user.update(user_params)
      render status: 200, json: @user, serializer: UserSerializer
    else
      render status: 400, json: { data: @user.errors }
    end
  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:email, :name)
  end
end

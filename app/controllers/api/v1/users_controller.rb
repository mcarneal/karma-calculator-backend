class Api::V1::UsersController < ApplicationController


  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
      @user = User.create(user_params)
      if @user.valid?
        token = JWT.encode({user_id: @user.id}, ENV['SECRET_WORD'])
        render json: { username: @user.username, token: token, id: @user.id}, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end

  def update
  end

  def destroy
  end

  def login

    @user = User.find_by(username: user_params['username'])
    enc = @user.password_digest
    sec = employee_params['password']
    if BCrypt::Password.new(enc) == sec
      token = JWT.encode({user_id: @user.id}, ENV['SECRET_WORD'])
      render json: { username: @user.username, token: token, id: @user.id}, status: :created
    else
        render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  private

  def user_params
  params.require(:user).permit(:username, :password, :id)
end

end

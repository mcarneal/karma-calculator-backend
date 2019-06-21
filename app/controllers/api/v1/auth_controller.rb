class Api::V1::AuthController < ApplicationController
  skip_before_action :puts_hi_100_times, only: [:login], raise: false

  def create
      @user = User.create(user_login_params)
      if @user.valid?
        token = JWT.encode({user_id: @user.id}, ENV['SECRET_WORD'])
        render json: { username: @user.username, token: token, id: @user.id}, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end

  def login
    @user = User.find_by(username: user_login_params['username'])
    enc = @user.password_digest
    sec = user_login_params['password']
    if BCrypt::Password.new(enc) == sec
      token = JWT.encode({user_id: @user.id}, ENV['SECRET_WORD'])
      render json: { username: @user.username, token: token, id: @user.id}, status: :created
    else
        render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def auto_login
    token = request.headers["authorization"]
    id = JWT.decode(token, ENV['SECRET_WORD'])[0]["user_id"]
    @user = User.find(id)
    if @user.valid?
      token = JWT.encode({user_id: @user.id}, ENV['SECRET_WORD'])
      render json: { username: @user.username, id: @user.id}, status: :created
    end
  end

  private

  def user_login_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.require(:user).permit(:username, :password)
  end
end

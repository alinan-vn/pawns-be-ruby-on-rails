class AuthController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    # byebug
    if user && user.authenticate(params[:password_digest])
      payload = { id: user.id }
      hmac_secret = 'secret'
      token = JWT.encode(payload, hmac_secret, 'HS256')
      render json: { id: user.id, username: user.username, token: token }
    else
      render json: { error: 'invalid username or password' }
    end
  end

  def show
    token = request.headers['Authorization'].split(' ')[1]
    decoded_token = JWT.decode(token, 'secret', true, { algorithm: 'HS256' })
    user_id = decoded_token[0]['id']
    user = User.find_by(id: user_id)
    if user
      render json: { 
        id: user.id, 
        username: user.username, 
        elo: user.elo, 
        profile_pic: user.profile_pic, 
        profile_background: user.profile_background, 
        bio: user.bio, 
        token: token 
      }
    else
      render json: { error: 'invalid token' }
    end



  end
end
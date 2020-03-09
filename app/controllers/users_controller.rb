class UsersController < ApplicationController
    wrap_parameters format: :json
    wrap_parameters :user, include: [:username, :password, :elo, :bio, :profile_pic, :profile_background]

    def index
        render json: User.all
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user, except: :password_digest
    end

    def new
    end

    def create
        user = User.new(strong_params)

        if user.valid?
            user.save
            
            payload = { id: user.id }
            hmac_secret = 'secret'
            token = JWT.encode(payload, hmac_secret, 'HS256')

            render json: { id: user.id, username: user.username, token: token }
            # redirect_to :controller => 'AuthController', :action => 'create', params
        else
            render json: { error: 'failed to create user: invalid username or password', user: user }
        end
    end

    def edit
    end

    def update
        user = User.find_by(id: params[:id])
        user.update(strong_params)

        render json: user
    end

    def destroy
        user = User.delete(params[:id])
        render json: user
    end

    private

    def strong_params
        params.require(:user).permit(:username, :password, :elo, :bio, :profile_pic, :profile_background)
    end
end
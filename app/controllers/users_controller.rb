class UsersController < ApplicationController
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
        user = User.new(
            username: params[:username], 
            password: params[:password], 
            elo: params[:elo], 
            bio: params[:bio], 
            profile_pic: params[:profile_pic], 
            profile_background: params[:profile_background]
            )
        if user.valid?
            user.save
            render json: user
        else
            # byebug
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
        params.require(:user).permit(:username, :password, :elo, :profile_pic, :profile_background, :bio)
    end
end
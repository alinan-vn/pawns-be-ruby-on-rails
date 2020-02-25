class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user
    end

    def new
    end

    def create
        user = User.new(strong_params(:username, :password, :elo, :profile_pic, :profile_background, :bio))
        if user.valid?
            user.save
            render json: user
        else
            render json: { error: 'failed to create user: invalid username or password' }
        end
    end

    def edit
    end

    def update
        user = User.find_by(id: params[:id])
        user.update(strong_params(:elo, :profile_pic, :profile_background, :bio))
        render json: user
    end

    def destroy
        user = User.delete(params[:id])
        render json: user
    end

    private

    def strong_params(*args)
        params.require(:user).permit(*args)
    end
end
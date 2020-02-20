class RepliesController < ApplicationController
    def index
        render json: Reply.all
    end

    def show
        reply = Reply.find_by(id: params[:id])
        render json: reply
    end

    def new
    end

    def create
        reply = Reply.create(strong_params(:content, :comment_id, :user_id))
        render json: reply
    end

    def edit
    end

    def update
        reply = Reply.find_by(id: params[:id])
        reply.update(strong_params(:content))
        render json: reply
    end

    def destroy
        reply = Reply.delete(params[:id])
        render json: reply
    end

    private

    def strong_params(*args)
        params.require(:reply).permit(*args)
    end

end
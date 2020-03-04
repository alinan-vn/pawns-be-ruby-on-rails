class CommentsController < ApplicationController
    def index
        render json: Comment.all
    end

    def show
        comment = Comment.find_by(id: params[:id])
        render json: comment
    end

    def get_comments
        id_num = params[:user_id].to_i
        comments = Comment.all.find_all{|comment| comment.user_id == id_num}  
        # byebug  
        render json: comments
    end

    def create
        comment = Comment.create(strong_params(:content, :article_id, :user_id))
        render json: comment
    end

    def update
        comment = Comment.find_by(id: params[:id])
        comment.update(strong_params(:content))
        render json: comment
    end

    def destroy
        comment = Comment.delete(params[:id])
        render json: comment
    end

    private

    def strong_params(*args)
        params.require(:comment).permit(*args)
    end

end
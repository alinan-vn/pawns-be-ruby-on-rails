class ArticlesController < ApplicationController
    def index
        render json: Article.all
    end

    # def show
    #     avote = AVote.find_by(id: params[:id])
    #     render json: avote
    # end

    # def new
    # end

    def get_votes_and_comments
        article_num = params[:article_id].to_i
        votes = AVote.all.find_all{|vote| vote.article_id == article_num}
        comments = Comment.all.find_all{|comment| comment.article_id == article_num}
        # byebug

        render json: {votes: votes, comments: comments}
    end

    # def create
    #     avote = AVote.create(strong_params(:user_id, :article_id))
    #     render json: avote
    # end

    # def destroy
    #     avote = AVote.delete(params[:id])
    #     render json: avote
    # end

    private

    def strong_params(*args)
        params.require(:article).permit(*args)
    end

end
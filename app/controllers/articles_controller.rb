class ArticlesController < ApplicationController
    def index
        render json: Article.all
    end

    def show
        article = Article.find_by(id: params[:id])
        render json: article
    end

    def post_article
        article = Article.new(
            title: params[:article][:title],
            content: params[:article][:content],
            date: params[:article][:date],
            author: params[:article][:author]
        )

        if article.valid?
            article.save
            render json: article
        end
    end

    def edit
    end

    def update
        article = Article.find_by(id: params[:article][:id])
        test_article = Article.new(strong_params, author: article.author)
        if test_article.valid?
            article.update(strong_params)
            render json: article
        end

    end

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

    def strong_params
        params.require(:article).permit(:title, :content, :date)
    end

end
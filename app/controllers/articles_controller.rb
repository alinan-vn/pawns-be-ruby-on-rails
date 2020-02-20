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
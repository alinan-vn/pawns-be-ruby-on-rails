class AVotesController < ApplicationController
    def index
        render json: AVote.all
    end

    def show
        avote = AVote.find_by(id: params[:id])
        render json: avote
    end

    def new
    end

    def create
        avote = AVote.create(strong_params(:user_id, :article_id))
        render json: avote
    end

    def destroy
        avote = AVote.delete(params[:id])
        render json: avote
    end

    private

    def strong_params(*args)
        params.require(:avote).permit(*args)
    end

end

####################################################
# def show
#     note = Note.find_by(id: params[:id])
#     render json: JSON.pretty_generate(NoteSerializer.new(note).serializable_hash)
# end


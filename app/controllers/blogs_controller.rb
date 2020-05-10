class BlogsController < ApplicationController
    def index
        render json: Blog.all
    end

    def show
        blog = Blog.find_by(id: params[:id])
        render json: blog
    end

    def post_blog
        blog = Blog.new(
            title: params[:blog][:title],
            content: params[:blog][:content],
            date: params[:blog][:date],
            author: params[:blog][:author]
        )

        if blog.valid?
            blog.save
            render json: blog
        end
    end

    def update
        blog = Blog.find_by(id: params[:id])
        blog.update(strong_params)

        render json: blog
    end

    def destroy
        blog = Blog.delete(params[:id])
        render json: blog
    end

    private

    def strong_params
        params.require(:blog).permit(:title, :content, :date)
    end

end
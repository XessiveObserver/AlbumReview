class CommentsController < ApplicationController
    skip_before_action :authenticate_user!, :only => [:create]

    def create
        @album = Album.find(params[:album_id])
        @comment = @album.comments.create(comment_params)
        redirect_to album_path(@album)
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :comment)
        end
end

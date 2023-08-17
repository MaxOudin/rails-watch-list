class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(set_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def delete
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to 'lists/index', status: :see_other
  end

  private

  def set_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

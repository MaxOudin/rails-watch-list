class ListsController < ApplicationController
  before_action :set_list, only: %i[show]
  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(set_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def set_params
    params.require(:list).permit(:name)
    params.require(:movie).permit(:title, :overview, :rating, :poster_url)
    params.require(:bookmark).permit(:comment)
  end
end

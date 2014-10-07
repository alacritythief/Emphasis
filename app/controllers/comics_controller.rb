class ComicsController < ApplicationController
  def index
    @comics = Comic.all.order(created_at: :desc)
  end

  def show
    @comic = Comic.where(name: params[:id]).first
    @pages = @comic.pages.order(number: :asc)
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new(comic_params)

    if @comic.save
      flash[:notice] = "Comic added successfully."
      redirect_to comics_path
    else
      flash[:alert] = "Warning: We couldn't post your comic!"
      render :new
    end
  end

  def edit
    # Edit goes here
  end

  def destroy
    # Deletion goes here
  end

  private

  def comic_params
    params.require(:comic).permit(:name, :description, :creators)
  end
end

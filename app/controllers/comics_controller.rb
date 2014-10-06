class ComicsController < ApplicationController
  def index
    @comics = Comic.all.order(created_at: :desc)
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
  end

  def destroy
  end

  private

  def comic_params
    params.require(:comic).permit(:name, :description, :creators)
  end
end

class ComicsController < ApplicationController
  def index
    @comics = Comic.all.order(created_at: :desc)
  end

  def show
    @comic = Comic.includes(:pages).find(params[:id])
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
    @comic = Comic.find(params[:id])
  end


  def update
    @comic = Comic.find(params[:id])

    if @comic.update(comic_params)
      flash[:notice] = "Your comic has been updated."
      redirect_to comics_path
    else
      flash[:alert] = "Warning: Comic was not updated!"
      render :edit
    end
  end

  def destroy
    @comic = Comic.find(params[:id])

    if @comic.destroy
      flash[:notice] = "Comic deleted."
      redirect_to comics_path
    else
      flash[:alert] = "Warning: Comic was not deleted."
      render :edit
    end
  end

  private

  def comic_params
    params.require(:comic).permit(:name, :description, :creators)
  end
end

class ComicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @comics = Comic.includes(:user).order(updated_at: :desc)
  end

  def show
    @comic = Comic.includes(:pages).find(params[:id])
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new(comic_params)
    @comic.user = current_user

    if @comic.save
      flash[:notice] = "Comic added successfully."
      redirect_to comic_path(@comic)
    else
      flash[:alert] = "Warning: We couldn't post your comic!"
      render :new
    end
  end

  def edit
    @comic = Comic.authorized_find(current_user, params[:id])
  end


  def update
    @comic = Comic.authorized_find(current_user, params[:id])

    if @comic.update(comic_params)
      flash[:notice] = "Your comic has been updated."
      redirect_to comic_path(@comic)
    else
      flash[:alert] = "Warning: Comic was not updated!"
      render :edit
    end
  end

  def destroy
    @comic = Comic.authorized_find(current_user, params[:id])

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
    params.require(:comic).permit(:cover_img_url, :name, :description, :creators)
  end
end

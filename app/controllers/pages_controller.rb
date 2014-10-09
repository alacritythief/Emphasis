class PagesController < ApplicationController
  COMIC_PAGE = 1

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @comic = Comic.includes(:user, :pages).find(params[:comic_id])
    @pagination = @comic.chapter_pages.page(params[:page]).per(COMIC_PAGE)
  end

  def show
    @comic = Comic.includes(:user, :pages).find(params[:comic_id])
    @page = @comic.pages.find(params[:id])
    @pagination = @comic.chapter_pages.page(params[:page]).per(COMIC_PAGE)
  end

  def new
    @comic = Comic.authorized_find(current_user, params[:comic_id])
    @page = Page.new
  end

  def create
    @comic = Comic.authorized_find(current_user, params[:comic_id])
    @page = Page.new(page_params)
    @page.comic_id = @comic.id
    @page.user = current_user

    if @page.save
      flash[:notice] = "Page successfully created!"
      redirect_to comic_path(@comic)
    else
      flash[:alert] = "Warning: Page not created."
      render :new
    end
  end

  def edit
    @comic = Comic.authorized_find(current_user, params[:comic_id])
    @page = Page.authorized_find(current_user, params[:id])
  end

  def update
    @comic = Comic.authorized_find(current_user, params[:comic_id])
    @page = Page.authorized_find(current_user, params[:id])

    if @page.update(page_params)
      flash[:notice] = "Your page has been updated."
      redirect_to comic_path(@comic)
    else
      flash[:alert] = "Warning: Page was not updated!"
      render :edit
    end
  end

  def destroy
    @comic = Comic.authorized_find(current_user, params[:comic_id])
    @page = Page.authorized_find(current_user, params[:id])

    if @page.destroy
      flash[:notice] = "Page deleted."
      redirect_to comic_path(@comic)
    else
      flash[:alert] = "Warning: Page was not deleted."
      render :edit
    end
  end

  private

  def page_params
    params.require(:page).permit(:chapter, :name, :number, :page_type, :comic_id)
  end
end

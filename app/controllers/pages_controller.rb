class PagesController < ApplicationController
  def show
    @comic = Comic.includes(:pages).find(params[:comic_id])
    @page = @comic.pages.find(params[:id])
  end

  def new
    @comic = Comic.find(params[:comic_id])
    @page = Page.new
  end

  def create
    @comic = Comic.find(params[:comic_id])
    @page = Page.new(page_params)
    @page.comic_id = @comic.id

    if @page.save
      flash[:notice] = "Page successfully created"
      redirect_to comic_path(@comic)
    else
      flash[:alert] = "Warning: Page not created"
      render :new
    end
  end

  def edit
    @comic = Comic.find(params[:comic_id])
    @page = Page.find(params[:id])
  end

  def update
    @comic = Comic.find(params[:comic_id])
    @page = Page.find(params[:id])

    if @page.update(page_params)
      flash[:notice] = "Your page has been updated."
      redirect_to comic_page_path(@comic, @page)
    else
      flash[:alert] = "Warning: Page was not updated!"
      render :edit
    end
  end

  def destroy
    @comic = Comic.find(params[:comic_id])
    @page = Page.find(params[:id])

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

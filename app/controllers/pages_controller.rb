class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
    @comic = Comic.find(@page.comic_id)
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
    # Edit goes here
  end

  def destroy
    # Delete goes here
  end

  private

  def page_params
    params.require(:page).permit(:chapter, :name, :number, :page_type, :comic_id)
  end
end

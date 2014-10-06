class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
    @comic = Comic.find(@page.comic_id)
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  private

  def page_params
  end
end

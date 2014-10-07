class ElementsController < ApplicationController
  def new
    @element = Element.new
    @comic = Comic.includes(:pages).where(name: params[:comic_id]).first
    @page = Page.includes(:elements).where(comic_id: @comic.id, number: params[:page])
  end

  def create
    @comic = Comic.find(params[:comic_id])
    @page = Page.find(params[:page])
    @element = Element.new(element_params)
    @element.page_id = @page.id

    if @element.save
      flash[:notice] = "Element successfully created"
      redirect_to comic_page_path(@comic.name, @page.number)
    else
      flash[:alert] = "Warning: Element not created"
      render :new
    end  end

  private

  def element_params
    params.require(:element).permit(:image_url, :id_name, :x, :y, :z, :animation_type)
  end
end

class ElementsController < ApplicationController
  def new
    @element = Element.new
    @comic = Comic.find(params[:comic_id])
    @page = Page.find(params[:page_id])
  end

  def create
    @comic = Comic.find(params[:comic_id])
    @page = Page.find(params[:page_id])
    @element = Element.new(element_params)
    @element.page_id = @page.id

    if @element.save
      flash[:notice] = "Element successfully created"
      redirect_to comic_page_path(@comic, @page.number)
    else
      flash[:alert] = "Warning: Element not created"
      render :new
    end  end

  private

  def element_params
    params.require(:element).permit(:image_url, :id_name, :x, :y, :z, :animation_type)
  end
end

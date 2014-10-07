class ElementsController < ApplicationController
  def index
    @comic = Comic.find(params[:comic_id])
    @page = Page.includes(:elements).find(params[:page_id])
    @elements = @page.elements
  end

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
      redirect_to comic_page_path(@comic, @page)
    else
      flash[:alert] = "Warning: Element not created"
      render :new
    end
  end

  def edit
    @comic = Comic.find(params[:comic_id])
    @page = Page.find(params[:page_id])
    @element = Element.find(params[:id])
  end

  def update
    @comic = Comic.find(params[:comic_id])
    @page = Page.find(params[:page_id])
    @element = Element.find(params[:id])

    if @element.update(element_params)
      flash[:notice] = "Your Element has been updated."
      redirect_to comic_page_path(@comic, @page)
    else
      flash[:alert] = "Warning: Element was not updated!"
      render :edit
    end
  end

  def destroy
    @comic = Comic.find(params[:comic_id])
    @page = Page.find(params[:page_id])
    @element = Element.find(params[:id])

    if @element.destroy
      flash[:notice] = "Element deleted."
      redirect_to comic_page_path(@comic, @page)
    else
      flash[:alert] = "Warning: Element was not deleted."
      render :edit
    end
  end

  private

  def element_params
    params.require(:element).permit(:image_url, :id_name, :x, :y, :z, :animation_type)
  end
end

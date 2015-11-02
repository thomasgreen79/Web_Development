class ImageElementsController < ApplicationController
  before_action :correct_user, only: :destroy

  def new
    @image_element = ImageElement.new
  end

  def create
    @image_element = working_page.image_elements.build(image_element_params)
    @image_element.num = session[:working_image_element]
    @image_element.page_id = working_page.id
    if @image_element.save
      flash[:success] = "Image saved"
      increment_working_image_element
      redirect_to pages_new_path
    else
      flash[:danger] = "Image not saved"
    end
  end

  def edit
    @image_element = ImageElement.find(params[:id])
  end

  def update
    @image_element = ImageElement.find(params[:id])
    if @image_element.update_attributes(image_element_params)
        redirect_to pages_new_path
    else
        render 'edit'
    end
  end
  
  def destroy
    @image_element.destroy
    decrement_working_image_element
    redirect_to pages_new_path
  end

  private

    def image_element_params
      params.require(:image_element).permit(:num, :path)
    end
    
    def correct_user
      @image_element = ImageElement.find_by(id: params[:id])
    end
end

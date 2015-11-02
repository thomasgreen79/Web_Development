class TextElementsController < ApplicationController
  before_action :correct_user, only: :destroy

  def new
    @text_element = TextElement.new
  end

  def create
    @text_element = working_page.text_elements.build(text_element_params)
    @text_element.num = session[:working_text_element]
    @text_element.page_id = working_page.id
    if @text_element.save
      flash[:success] = "Text saved"
      increment_working_text_element
      redirect_to pages_new_path
    else
      flash[:danger] = "Text not saved"
    end
#    @text_element = TextElement.new(text_element_params)
  end

  def edit
    @text_element = TextElement.find(params[:id])
  end

  def update
    @text_element = TextElement.find(params[:id])
    if @text_element.update_attributes(text_element_params)
        redirect_to pages_new_path
    else
        render 'edit'
    end
  end

  def destroy
    @text_element.destroy
    decrement_working_text_element
    redirect_to pages_new_path
  end

  private

    def text_element_params
      params.require(:text_element).permit(:num, :content)
    end

    def correct_user
      @text_element = TextElement.find_by(id: params[:id])
    end
end

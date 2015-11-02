class PagesController < ApplicationController
  def new
    if working_story == nil
      redirect_to static_pages_create_path #not working...
    end
    page = Page.find_by_num_and_story_id(session[:working_page], session[:working_story])
    if page.nil?
      @page = working_story.pages.build
      @page.story_id = working_story.id
      @page.num = session[:working_page]
      @page.layout = 'none'
      if @page.save
        flash[:success] = "Page saved"
      else
        flash[:danger] = "Page not saved"
      end
    else
      @page = page
    end
  end

#  def create
#    @page = working_story.pages.build
#    @page.story_id = working_story.id
#    @page.num = session[:working_page]
#    @page.layout = 'none'
#    if @page.save
#      flash[:success] = "Page saved"
#      render new
#    else
#      render new
#    end
    #@page = Page.new(pages_params)
    #story = Story.find(session[:working_story])
    #@page = story.pages.build(pages_params)
#  end

  def edit
#only concerned with changing a page's layout
  end

  def update

  end

  def show
    @page = Page.find(params[:id])
    @story = Story.find(@page.story_id)
    @pages = Page.where(story_id: @story.id)
    hash = Hash[@pages.map.with_index.to_a]
    index = hash[@page]
    if index-1 >= 0
      @prev_page = @pages[index - 1]
    else 
      @prev_page = nil
    end
    @next_page = @pages[index + 1]

    @text_elements = TextElement.where(page_id: @page.id)
    @image_elements = ImageElement.where(page_id: @page.id)
  end

  def destroy
    
  end

  def prev
    decrement_working_page
    redirect_to pages_new_path
  end

  def next
    increment_working_page
    redirect_to pages_new_path
  end

  private

    def pages_params
      params.require(:page).permit(:num, :layout)
    end

end

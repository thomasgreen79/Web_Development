class StoriesController < ApplicationController
  def new
    @story = Story.new
  end

  def create
    @story = current_user.stories.build(story_params)
    @story.user_id = current_user.id
    @story.status = "Draft"
    if @story.save
      start_working_story(@story)
      redirect_to pages_new_path
    else
      redirect_to static_pages_browse_path
    end
  end

  def edit
    session[:working_story] = params[:id]
    session[:working_page] = 1
    set_story_to_working
    redirect_to pages_new_path
  end

  def update
    story = Story.find(params[:id])
    user = User.find(story.user_id)
    if story.status == 'Draft'
      story.update_attributes(:status => 'Published')
    else
      story.update_attributes(:status => 'Draft')
    end
    redirect_to user
  end

#  def show
#    story = Story.find(params[:id])
#    pages = story.pages.where(story_id: story.id)
#    first_page = pages.first
#    redirect_to first_page
#  end

  def destroy
    story = Story.find(params[:id])
    user = User.find(story.user_id)
    story.destroy
    redirect_to user
  end

  def done
    pages = Page.where(story_id: working_story.id)
    pages.each do |page|
      text_elements = TextElement.where(page_id: page.id)
      image_elements = ImageElement.where(page_id: page.id)
      if text_elements.length + image_elements.length == 0
        page.destroy
      end
    end
    user = User.find(working_story.user_id)
    remove_working_story_from_session
    redirect_to user
  end

  private
  
    def story_params
      params.require(:story).permit(:name, :location, :travelStyle, :storyType, :status)
    end
end

module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    session.delete(:working_story)
    session.delete(:working_page)
    session.delete(:story_type)
    session.delete(:working_text_element)
    session.delete(:working_image_element)
    @current_user = nil
    @working_story = nil
    @working_page = nil
  end



  def start_working_story(story)
    session[:working_story] = story.id
    session[:working_page] = 1
    set_story_to_working
  end

  def set_story_to_working
    session[:story_type] = 'working'
  end

  def set_story_to_viewing
    session[:story_type] = 'viewing'
  end

  def working_story
    @working_story ||= Story.find_by(id: session[:working_story])
  end

  def working_story?
    if session[:working_story] != nil
      return true
    else
      return false
    end
  end

  def remove_working_story_from_session
    session.delete(:working_story)
    session.delete(:working_page)
    session.delete(:working_text_element)
    session.delete(:working_image_element)
  end



  def increment_working_page
    session[:working_page] = session[:working_page] + 1
  end

  def decrement_working_page
    if session[:working_page] > 1
      session[:working_page] = session[:working_page] - 1
    end
  end

  def working_page
    @working_page ||= Page.find_by_num_and_story_id(session[:working_page], session[:working_story])
  end

  def new_page
    session[:working_text_element] = 1
    session[:working_image_element] = 1
  end



  def increment_working_text_element
    session[:working_text_element] = session[:working_text_element] + 1
  end

  def decrement_working_text_element
    session[:working_text_element] = session[:working_text_element] - 1
  end

  def set_working_text_element(num)
    session[:working_text_element] = num
  end

  def get_text_elements_for_page
    TextElement.where(page_id: working_page.id)
  end



  def increment_working_image_element
    session[:working_image_element] = session[:working_image_element] + 1
  end

  def decrement_working_image_element
    session[:working_image_element] = session[:working_image_element] - 1
  end

  def set_working_image_element(num)
    session[:working_image_element] = num
  end

  def get_image_elements_for_page
    ImageElement.where(page_id: working_page.id)
  end

end

class StaticPagesController < ApplicationController
  def home
  end

  def browse
  end

  def search
    @searchLinks = SearchLink.new
  end

  def login
  end

  def create
    if working_story?
      redirect_to pages_new_path
    else
      @story = current_user.stories.build
    end
  end

  def about
  end
end

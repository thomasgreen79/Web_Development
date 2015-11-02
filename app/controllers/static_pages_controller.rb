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
    if params[:commit] == "Submit Search"
      lastName == searchLink[:lastName]
      firstName == searchLink[:firstName]
      location == searchLink[:location]
      travelStyle == searchLink[:travelStyle]
      storyType == searchLink[:storyType]
      if lastName == nil
        lastName = '%'
      end
      if firstName == nil
        firstName = '%'
      end
      if location == nil
        location = '%'
      end
      if travelStyle == nil
        travelStyle = '%'
      end
      if storyType == nil
        storyType = '%'
      end
      lastName = '%' + lastName + '%'
      firstName = '%' + firstName + '%'
      location = '%' + location + '%'
      travelStyle = '%' + travelStyle + '%'
      storyType = '%' + storyType + '%'
      @searchLinks = Story.find_by_sql["SELECT Name, Id, User, Location FROM Story A, (SELECT Id as UserID FROM User WHERE LastName LIKE :last AND FirstName LIKE :first) B WHERE A.User = B.UserID AND A.Location LIKE :location AND A.TravelStyle LIKE :travelStyle AND A.StoryType LIKE :storyType AND A.Name LIKE :name AND A.Status = 'Published' ORDER BY Name;", {:last => lastName, :first => firstName, :location => location, :travelStyle => travelStyle, :storyType => storyType}]
      redirect_to { controller: 'display_story_links', action: 'bySearch', links: @searchLinks }
    else
      if working_story?
        redirect_to pages_new_path
      else
        @story = current_user.stories.build
      end
    end
  end

  def about
  end
end

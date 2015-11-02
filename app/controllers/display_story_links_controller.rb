class DisplayStoryLinksController < ApplicationController
  def byName
    @stories = Story.where(status: "Published").order(:name)
  end

  def byAuthor
    @stories = Story.where(status: "Published").order(:user_id)
  end

  def byLocation
    @stories = Story.where(status: "Published").order(:location)
  end

  def byTravelCategory
    @stories = Story.where(status: "Published").order(:travelStyle)
  end

  def byStoryType
    @stories = Story.where(status: "Published").order(:storyType)
  end
end

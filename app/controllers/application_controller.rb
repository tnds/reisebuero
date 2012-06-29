class ApplicationController < ActionController::Base
  protect_from_forgery
  def orga?
    @event = Event.find(params[:event_id])
    EventHelper.where(:event_id => @event , :user_id => current_user, :orga => true).exists?
  end 
end

class ApplicationController < ActionController::Base
  protect_from_forgery
#  def orga?
#    if params[:event_id]
#      @event = Event.find(params[:event_id])
#    else
#      @event = Event.find(params[:id])
#    end
#    return EventHelper.where(:event_id => @event , :user_id => current_user, :orga => true).exists?
#  end 
#   
#  def orga_filter
#    unless orga?
#      flash[:error] = t('must_be_orga')
#      redirect_to event_url(@event)
#    end
#  end
end

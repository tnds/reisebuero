module EventHelpersHelper
  def self?
    @event_helper = EventHelper.find(params[:id])
    unless @event_helper.user_id = current_user.id
      flash[:error] = t('cannot_edit_other_event_helper')
      redirect_to event_url(@event_helper.event)
    end

  end
end

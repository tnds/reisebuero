class MyPageController < ApplicationController
  def index
    @month_now = (Time.zone || Time).now.month.to_i
    @year_now = (Time.zone || Time).now.year.to_i
    if @month_now >1 then
      @last_month_start = Date.new(@year_now, @month_now-1).to_time
    else
      @last_month_start = Date.new(@year_now-1, 12).to_time
    end
    
    @user = current_user
    @contacts = @user.contacts
#    @event_helpers = EventHelper.find_all_by_user_id(@user.id)
    @event_helpers = EventHelper.joins(:event).where("end_at >= :month_start OR start_at >= :month_start", {:month_start => @last_month_start}).find_all_by_user_id(@user.id)
    @lodgings = Lodging.find_all_by_user_id_and_request(@user.id, false)
    @lodging_requests = Lodging.find_all_by_user_id_and_request(@user.id, true)
    @helper_candidates = @user.helper_candidates
  end
end

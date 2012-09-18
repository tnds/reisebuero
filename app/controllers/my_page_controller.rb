class MyPageController < ApplicationController
  def index
    @user = current_user
    @contacts = @user.contacts
    @event_helpers = EventHelper.find_all_by_user_id(@user.id)
    @lodgings = Lodging.find_all_by_user_id_and_request(@user.id, false)
    @lodging_requests = Lodging.find_all_by_user_id_and_request(@user.id, true)
    @helper_candidates = @user.helper_candidates
  end
end

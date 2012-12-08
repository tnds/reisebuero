class CalendarController < ApplicationController
  
  def index
    @first_day_of_week = 1
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    if params[:day]
      redirect_to :controller => "events", :action => "index", :year => @year, :month => @month, :day => params[:day]
    end

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month, @first_day_of_week)
  end
end

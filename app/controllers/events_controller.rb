class EventsController < ApplicationController
#  before_filter :authenticate_user!, :except => [:show, :index]
#  before_filter :orga_filter, :except => [:show,:index,:new,:create]
  load_and_authorize_resource
  
  # GET /events
  # GET /events.json
  def index
    @month_now = (Time.zone || Time).now.month.to_i
    @year_now = (Time.zone || Time).now.year.to_i
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @day = params[:day].to_i || 0
    @last_month_start = Date.new(@year_now, @month_now-1).to_time
    @month_start = Date.new(@year, @month).to_time
    if @month < 12 then
      @month_end = Date.new(@year, @month+1).to_time
    else
      @month_end = Date.new(@year+1, 1).to_time
    end
    if @day > 0 then
      @day_start = Date.new(@year, @month, @day).to_time
      @day_end = Date.new(@year, @month, @day+1).to_time
      @shown_day = Date.civil(@year, @month, @day)
    end
    @next_year_end = Date.new(@year_now+2, 1).to_time

    @shown_month = Date.civil(@year, @month)

    if @day > 0 then
      @events_day = Event.where("end_at BETWEEN :day_start AND :day_end OR start_at BETWEEN :day_start AND :day_end", {:day_start => @day_start, :day_end => @day_end})
    else
      @events = Event.where("end_at BETWEEN :month_start AND :month_end OR start_at BETWEEN :month_start AND :month_end", {:month_start => @month_start, :month_end => @month_end})
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
	  	format.ics do
				send_data(	export_ical_range(@last_month_start,@next_year_end).export,
										:filename=>"reisebuero_events.ics",
										:disposition=>"inline; filename=reisebuero_events.ics",
										:type=>"text/calendar")
			end
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @helpers = @event.event_helpers.find_all_by_orga(false,nil)
    @orgas = @event.event_helpers.find_all_by_orga(true)
#    @user_is_orga = orga?
    @user_is_helper = EventHelper.where(:event_id => @event , :user_id => current_user).exists?
    @lodgings = @event.lodgings.find_all_by_request(false,nil)
    @lodging_requests = @event.lodgings.find_all_by_request(true)
    @contacts = Contact.find_all_by_user_id_and_public(@orgas.first.user_id, true)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
	  	format.ics do
				send_data(	export_ical(@event).export,
										:filename=>"reisebuero_event.ics",
										:disposition=>"inline; filename=reisebuero_event.ics",
										:type=>"text/calendar")
			end
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
		@event_helper = @event.event_helpers.build
    @event_helper.user = current_user   # current_user not available in model
    @event_helper.orga = true
    @event_helper.save

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

	def export_ical_range(start_date, end_date)
		ical = RiCal.Calendar do
			events = Event.where("end_at BETWEEN :month_start AND :month_end OR start_at BETWEEN :month_start AND :month_end", {:month_start => start_date, :month_end => end_date})
			events.each do |the_event|
        event do
          summary the_event.name
          uid the_event.uid
          description the_event.description
          dtstart the_event.start_at.to_datetime
          dtend the_event.end_at.to_datetime
          location the_event.location
          the_event.event_helpers.each do |event_helper|
            add_attendee event_helper.user.username
          end
        end
			end
		end
	end
  
  def export_ical(event)
		ical = RiCal.Calendar do
      event do
        summary event.name
        uid event.uid
        description event.description
        dtstart event.start_at.to_datetime
        dtend event.end_at.to_datetime
        location event.location
        event.event_helpers.each do |event_helper|
          add_attendee event_helper.user.username
        end
      end
    end
  end
end

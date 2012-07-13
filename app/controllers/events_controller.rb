class EventsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :orga_filter, :except => [:show,:index,:new,:create]
  
  # GET /events
  # GET /events.json
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @day = (params[:day] || (Time.zone || Time).now.day).to_i
    @month_start = Date.new(@year, @month).to_time
    @month_end = Date.new(@year, @month+1).to_time

    @shown_month = Date.civil(@year, @month)

    @events = Event.where("end_at BETWEEN :month_start AND :month_end OR start_at BETWEEN :month_start AND :month_end", {:month_start => @month_start, :month_end => @month_end})

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
	  	format.ics do
				send_data(	export_ical(@month_start,@month_end).export,
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
    @user_is_orga = orga?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
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

	def export_ical(start_date, end_date)
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
end

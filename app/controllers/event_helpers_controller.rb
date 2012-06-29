class EventHelpersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  # GET /event_helpers
  # GET /event_helpers.json
  def index
    @event_helpers = EventHelper.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_helpers }
    end
  end

  # GET /event_helpers/1
  # GET /event_helpers/1.json
  def show
    @event_helper = EventHelper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_helper }
    end
  end

  # GET /event_helpers/new
  # GET /event_helpers/new.json
  def new
    @event_helper = EventHelper.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_helper }
    end
  end

  # GET /event_helpers/1/edit
  def edit
    @event_helper = EventHelper.find(params[:id])
  end

  # POST /event_helpers
  # POST /event_helpers.json
  def create
    @event = Event.find(params[:event_id])
    @event_helper = @event.event_helpers.create(params[:event_helper])
    @event_helper.user = current_user
    @event_helper.save
    redirect_to event_path(@event)

#    respond_to do |format|
#      if @event_helper.save
#        format.html { redirect_to @event_helper, notice: 'Event helper was successfully created.' }
#        format.json { render json: @event_helper, status: :created, location: @event_helper }
#      else
#        format.html { render action: "new" }
#        format.json { render json: @event_helper.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PUT /event_helpers/1
  # PUT /event_helpers/1.json
  def update
    @event_helper = EventHelper.find(params[:id])

    respond_to do |format|
      if @event_helper.update_attributes(params[:event_helper])
        format.html { redirect_to @event_helper, notice: 'Event helper was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_helper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_helpers/1
  # DELETE /event_helpers/1.json
  def destroy
    @event_helper = EventHelper.find(params[:id])
    @event_helper.destroy

    respond_to do |format|
      format.html { redirect_to event_helpers_url }
      format.json { head :no_content }
    end
  end
  
  def promote
     @event_helper = EventHelper.find(params[:id])
     @event_helper.orga = true
     @event_helper.save
     redirect_to event_path(@event)
 end
end

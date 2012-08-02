class EventHelpersController < ApplicationController
#  before_filter :authenticate_user!, :except => [:show, :index]
#  before_filter :orga_filter, :only => [:promote, :demote]
  #before_filter :self_filter, :except => [:show, :index, :promote, :create, :new]
  before_filter :keep_last_orga, :only => [:demote, :destroy]
  load_and_authorize_resource
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
    if @event_helper.valid?
      @event_helper.save
    else
      flash[:error] = t('user_already_helper')
      @event_helper.destroy
    end
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
      format.html { redirect_to event_url(@event_helper.event) }
      format.json { head :no_content }
    end
  end
  
  def promote
     @event_helper = EventHelper.find(params[:id])
     authorize! :promote, @event_helper
     @event_helper.orga = true
     @event_helper.save
     redirect_to event_path(@event_helper.event)
 end

 def demote
     @event_helper = EventHelper.find(params[:id])
     @event_helper.orga = false
     @event_helper.save
     redirect_to event_path(@event_helper.event)
 end
#
#  def self_filter
#    @event_helper = EventHelper.find(params[:id])
#    unless @event_helper.user_id = current_user.id
#      flash[:error] = t('cannot_edit_other_event_helper')
#      redirect_to event_url(@event_helper.event)
#    end
#  end
  
  def keep_last_orga
    @event_helper = EventHelper.find(params[:id])
    unless @event_helper.orga == false || EventHelper.where(:event_id => @event_helper.event, :orga => true).count() > 1
      flash[:error] = t('must_have_orga')
      redirect_to event_url(@event_helper.event)
    end
  end
end

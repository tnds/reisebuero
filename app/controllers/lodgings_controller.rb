class LodgingsController < ApplicationController
  load_and_authorize_resource
  # GET /lodgings
  def index
    @lodgings = Lodging.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /lodgings/1
  def show
    @lodging = Lodging.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /lodgings/new
  def new
    @lodging = Lodging.new
    @lodging.event_id = Event.find(params[:event]).id unless params[:event].nil?
    @lodging.request = params[:request] || false

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /lodgings/1/edit
  def edit
    @lodging = Lodging.find(params[:id])
  end

  # POST /lodgings
  def create
    @lodging = Lodging.create(params[:lodging])
    @lodging.user_id = current_user.id

    respond_to do |format|
      if @lodging.save
        format.html { redirect_to @lodging, notice: t('lodging_created') }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /lodgings/1
  def update
    @event = Event.find(params[:event_id])
    @lodging = Lodging.find(params[:id])

    respond_to do |format|
      if @lodging.update_attributes(params[:lodging])
        format.html { redirect_to @lodging, notice: t('lodging_updated') }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /lodgings/1
  def destroy
    @lodging = Lodging.find(params[:id])
    @lodging.destroy

    respond_to do |format|
      format.html { redirect_to lodgings_url }
    end
  end
end

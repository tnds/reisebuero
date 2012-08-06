class LodgingsController < ApplicationController
  # GET /lodgings
  # GET /lodgings.json
  def index
    @lodgings = Lodging.all
    @event = Event.find(params[:event_id]) unless params[:event_id].nil?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lodgings }
    end
  end

  # GET /lodgings/1
  # GET /lodgings/1.json
  def show
    @lodging = Lodging.find(params[:id])
    @event = Event.find(@lodging.event_id) unless @lodging.event_id.nil?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lodging }
    end
  end

  # GET /lodgings/new
  # GET /lodgings/new.json
  def new
    @lodging = Lodging.new
    @event = Event.find(params[:event_id]) unless params[:event_id].nil?

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
    @event = Event.find(params[:event_id])
    @lodging = @event.lodgings.create(params[:lodging])
    @lodging.user = current_user

    respond_to do |format|
      if @lodging.save
        format.html { redirect_to @lodging, notice: 'Lodging was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /lodgings/1
  # PUT /lodgings/1.json
  def update
    @lodging = Lodging.find(params[:id])

    respond_to do |format|
      if @lodging.update_attributes(params[:lodging])
        format.html { redirect_to @lodging, notice: 'Lodging was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lodgings/1
  # DELETE /lodgings/1.json
  def destroy
    @lodging = Lodging.find(params[:id])
    @lodging.destroy

    respond_to do |format|
      format.html { redirect_to lodgings_url }
      format.json { head :no_content }
    end
  end
end

class EventOrgasController < ApplicationController
  # GET /event_orgas
  # GET /event_orgas.json
  def index
    @event_orgas = EventOrga.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_orgas }
    end
  end

  # GET /event_orgas/1
  # GET /event_orgas/1.json
  def show
    @event_orga = EventOrga.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_orga }
    end
  end

  # GET /event_orgas/new
  # GET /event_orgas/new.json
  def new
    @event_orga = EventOrga.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_orga }
    end
  end

  # GET /event_orgas/1/edit
  def edit
    @event_orga = EventOrga.find(params[:id])
  end

  # POST /event_orgas
  # POST /event_orgas.json
  def create
    @event_orga = EventOrga.new(params[:event_orga])

    respond_to do |format|
      if @event_orga.save
        format.html { redirect_to @event_orga, notice: 'Event orga was successfully created.' }
        format.json { render json: @event_orga, status: :created, location: @event_orga }
      else
        format.html { render action: "new" }
        format.json { render json: @event_orga.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_orgas/1
  # PUT /event_orgas/1.json
  def update
    @event_orga = EventOrga.find(params[:id])

    respond_to do |format|
      if @event_orga.update_attributes(params[:event_orga])
        format.html { redirect_to @event_orga, notice: 'Event orga was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_orga.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_orgas/1
  # DELETE /event_orgas/1.json
  def destroy
    @event_orga = EventOrga.find(params[:id])
    @event_orga.destroy

    respond_to do |format|
      format.html { redirect_to event_orgas_url }
      format.json { head :no_content }
    end
  end
end

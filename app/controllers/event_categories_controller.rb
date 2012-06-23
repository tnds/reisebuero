class EventCategoriesController < ApplicationController
  # GET /event_categories
  # GET /event_categories.json
  def index
    @event_categories = EventCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_categories }
    end
  end

  # GET /event_categories/1
  # GET /event_categories/1.json
  def show
    @event_category = EventCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_category }
    end
  end

  # GET /event_categories/new
  # GET /event_categories/new.json
  def new
    @event_category = EventCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_category }
    end
  end

  # GET /event_categories/1/edit
  def edit
    @event_category = EventCategory.find(params[:id])
  end

  # POST /event_categories
  # POST /event_categories.json
  def create
    @event_category = EventCategory.new(params[:event_category])

    respond_to do |format|
      if @event_category.save
        format.html { redirect_to @event_category, notice: 'Event category was successfully created.' }
        format.json { render json: @event_category, status: :created, location: @event_category }
      else
        format.html { render action: "new" }
        format.json { render json: @event_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_categories/1
  # PUT /event_categories/1.json
  def update
    @event_category = EventCategory.find(params[:id])

    respond_to do |format|
      if @event_category.update_attributes(params[:event_category])
        format.html { redirect_to @event_category, notice: 'Event category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_categories/1
  # DELETE /event_categories/1.json
  def destroy
    @event_category = EventCategory.find(params[:id])
    @event_category.destroy

    respond_to do |format|
      format.html { redirect_to event_categories_url }
      format.json { head :no_content }
    end
  end
end

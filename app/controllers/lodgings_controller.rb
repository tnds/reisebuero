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
    @contacts = Contact.find_all_by_user_id_and_public(@lodging.user_id, true)

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /lodgings/new
  def new
    @lodging = Lodging.new
    @lodging.event_id = Event.find(params[:event]).id unless params[:event].nil?
    @lodging.request = params[:request] || false
    @lodging.start_at = params[:start_at] unless params[:start_at].nil?
    @lodging.end_at = params[:end_at] unless params[:end_at].nil?

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
    @anon = User.find_by_username("anon")
    if @lodging.anonymous and can? :manage, Lodging
      @lodging.user_id = @anon.id
    else
      @lodging.user_id = current_user.id
    end

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
    @lodging = Lodging.find(params[:id])
    @anon = User.find_by_username("anon")
    if @lodging.anonymous and can? :manage, Lodging
      @lodging.user_id = @anon.id
    else
      @lodging.user_id = current_user.id
    end

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
      format.html { redirect_to :controller => 'my_page', :action => 'index' }
    end
  end
end

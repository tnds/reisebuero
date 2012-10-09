class BookingsController < ApplicationController
  load_and_authorize_resource
  # GET /bookings
  # GET /bookings.json
  def index
    @lodging = Lodging.find(params[:lodging_id])
    @bookings = @lodging.bookings.all
    @anon = User.find_by_username('anon')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bookings }
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @lodging = Lodging.find(params[:lodging_id])
    @booking = @lodging.bookings.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @booking }
    end
  end

  # GET /bookings/new
  # GET /bookings/new.json
  def new
    @lodging = Lodging.find(params[:lodging_id])
    @booking = Booking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @booking }
    end
  end

  # GET /bookings/1/edit
  def edit
    @lodging = Lodging.find(params[:lodging_id])
    @booking = Booking.find(params[:id])
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @lodging = Lodging.find(params[:lodging_id])
    @booking = @lodging.bookings.create(params[:booking])
    @booking.user_id = current_user.id
    
    if @booking.valid?
      @booking.save
    else
      flash[:error] = t('lodging_overbooked')
      @booking.destroy
    end
    redirect_to @lodging
    
#    respond_to do |format|
#      if @booking.valid? and @booking.save
#        format.html { redirect_to @lodging, notice: 'Booking was successfully created.' }
#        format.json { render json: @booking, status: :created, location: @booking }
#      else
#        format.html { render action: "new" }
#        format.json { render json: @booking.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PUT /bookings/1
  # PUT /bookings/1.json
  def update
    @lodging = Lodging.find(params[:lodging_id])
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.update_attributes(params[:booking])
        format.html { redirect_to @lodging, notice: 'Booking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @lodging = Lodging.find(params[:lodging_id])
    @booking = Booking.find(params[:id])
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to @lodging, notice: t('booking_destroyed') }
      format.json { head :no_content }
    end
  end
end

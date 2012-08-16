class ContacttypesController < ApplicationController
  # GET /contacttypes
  # GET /contacttypes.json
  def index
    @contacttypes = Contacttype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacttypes }
    end
  end

  # GET /contacttypes/1
  # GET /contacttypes/1.json
  def show
    @contacttype = Contacttype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contacttype }
    end
  end

  # GET /contacttypes/new
  # GET /contacttypes/new.json
  def new
    @contacttype = Contacttype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contacttype }
    end
  end

  # GET /contacttypes/1/edit
  def edit
    @contacttype = Contacttype.find(params[:id])
  end

  # POST /contacttypes
  # POST /contacttypes.json
  def create
    @contacttype = Contacttype.new(params[:contacttype])

    respond_to do |format|
      if @contacttype.save
        format.html { redirect_to @contacttype, notice: 'Contacttype was successfully created.' }
        format.json { render json: @contacttype, status: :created, location: @contacttype }
      else
        format.html { render action: "new" }
        format.json { render json: @contacttype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contacttypes/1
  # PUT /contacttypes/1.json
  def update
    @contacttype = Contacttype.find(params[:id])

    respond_to do |format|
      if @contacttype.update_attributes(params[:contacttype])
        format.html { redirect_to @contacttype, notice: 'Contacttype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contacttype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacttypes/1
  # DELETE /contacttypes/1.json
  def destroy
    @contacttype = Contacttype.find(params[:id])
    @contacttype.destroy

    respond_to do |format|
      format.html { redirect_to contacttypes_url }
      format.json { head :no_content }
    end
  end
end

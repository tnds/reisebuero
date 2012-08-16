class ContactsController < ApplicationController
  load_and_authorize_resource
  # GET /contacts
  # GET /contacts.json
#  def index
#    @user = User.find(params[:user_id])
#    @contacts = Contact.find_all_by_user_id(@user.id)
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @contacts }
#    end
#  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @user = User.find(params[:user_id])
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @user = User.find(params[:user_id])
    @contact = Contact.new
    @contacttypes = Contacttype.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @user = User.find(params[:user_id])
    @contact = Contact.find(params[:id])
    @contacttypes = Contacttype.all
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @user = User.find(params[:user_id])
    @contact = @user.contacts.build(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @user, notice: 'Contact was successfully created.' }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @user = User.find(params[:user_id])
    @contact = Contact.find(params[:id])
    @contacttypes = Contacttype.all

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to @user, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @user = User.find(params[:user_id])
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to @user }
      format.json { head :no_content }
    end
  end
end

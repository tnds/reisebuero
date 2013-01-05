class HelperCandidatesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /helper_candidates
  # GET /helper_candidates.json
  def index
    @helper_candidates = HelperCandidate.all
    @anon = User.find_by_username("anon")
    
    @helper_candidates.each do |helper_candidate|
      if cannot? :manage, helper_candidate
        if helper_candidate.anonymous
          helper_candidate.user_id = @anon.id
        end
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @helper_candidates }
    end
  end

  # GET /helper_candidates/1
  # GET /helper_candidates/1.json
  def show
    @helper_candidate = HelperCandidate.find(params[:id])
    @anon = User.find_by_username("anon")

    if @helper_candidate.anonymous and cannot? :manage, @helper_candidate
      @helper_candidate.user_id = @anon.id
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @helper_candidate }
    end
  end

  # GET /helper_candidates/new
  # GET /helper_candidates/new.json
  def new
    @helper_candidate = HelperCandidate.new
    @helper_candidate.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @helper_candidate }
    end
  end

  # GET /helper_candidates/1/edit
  def edit
    @helper_candidate = HelperCandidate.find(params[:id])
  end

  # POST /helper_candidates
  # POST /helper_candidates.json
  def create
    @helper_candidate = HelperCandidate.create(params[:helper_candidate])
    @helper_candidate.user_id = current_user.id

    respond_to do |format|
      if @helper_candidate.save
        format.html { redirect_to :controller => 'my_page', :action => 'index', notice: 'Helper candidate was successfully updated.' }
        format.json { render json: @helper_candidate, status: :created, location: @helper_candidate }
      else
        format.html { render action: "new" }
        format.json { render json: @helper_candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /helper_candidates/1
  # PUT /helper_candidates/1.json
  def update
    @helper_candidate = HelperCandidate.find(params[:id])

    respond_to do |format|
      if @helper_candidate.update_attributes(params[:helper_candidate])
        format.html { redirect_to :controller => 'my_page', :action => 'index', notice: 'Helper candidate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @helper_candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /helper_candidates/1
  # DELETE /helper_candidates/1.json
  def destroy
    @helper_candidate = HelperCandidate.find(params[:id])
    @helper_candidate.destroy

    respond_to do |format|
      format.html { redirect_to helper_candidates_url }
      format.json { head :no_content }
    end
  end
end

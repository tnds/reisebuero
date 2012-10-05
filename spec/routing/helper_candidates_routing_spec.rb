require "spec_helper"

describe HelperCandidatesController do
  describe "routing" do

    it "routes to #index" do
      get("/helper_candidates").should route_to("helper_candidates#index")
    end

    it "routes to #new" do
      get("/helper_candidates/new").should route_to("helper_candidates#new")
    end

    it "routes to #show" do
      get("/helper_candidates/1").should route_to("helper_candidates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/helper_candidates/1/edit").should route_to("helper_candidates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/helper_candidates").should route_to("helper_candidates#create")
    end

    it "routes to #update" do
      put("/helper_candidates/1").should route_to("helper_candidates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/helper_candidates/1").should route_to("helper_candidates#destroy", :id => "1")
    end

  end
end

require "spec_helper"

describe ContacttypesController do
  describe "routing" do

    it "routes to #index" do
      get("/contacttypes").should route_to("contacttypes#index")
    end

    it "routes to #new" do
      get("/contacttypes/new").should route_to("contacttypes#new")
    end

    it "routes to #show" do
      get("/contacttypes/1").should route_to("contacttypes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/contacttypes/1/edit").should route_to("contacttypes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/contacttypes").should route_to("contacttypes#create")
    end

    it "routes to #update" do
      put("/contacttypes/1").should route_to("contacttypes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/contacttypes/1").should route_to("contacttypes#destroy", :id => "1")
    end

  end
end

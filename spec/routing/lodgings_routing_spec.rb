require "spec_helper"

describe LodgingsController do
  describe "routing" do

    it "routes to #index" do
      get("/lodgings").should route_to("lodgings#index")
    end

    it "routes to #new" do
      get("/lodgings/new").should route_to("lodgings#new")
    end

    it "routes to #show" do
      get("/lodgings/1").should route_to("lodgings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lodgings/1/edit").should route_to("lodgings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lodgings").should route_to("lodgings#create")
    end

    it "routes to #update" do
      put("/lodgings/1").should route_to("lodgings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lodgings/1").should route_to("lodgings#destroy", :id => "1")
    end

  end
end

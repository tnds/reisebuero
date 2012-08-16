require "spec_helper"

describe BookingsController do
  describe "routing" do

    it "routes to #index" do
      get("/bookings").should route_to("bookings#index")
    end

    it "routes to #new" do
      get("/bookings/new").should route_to("bookings#new")
    end

    it "routes to #show" do
      get("/bookings/1").should route_to("bookings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bookings/1/edit").should route_to("bookings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bookings").should route_to("bookings#create")
    end

    it "routes to #update" do
      put("/bookings/1").should route_to("bookings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bookings/1").should route_to("bookings#destroy", :id => "1")
    end

  end
end

require "spec_helper"

describe WelcomesController do
  describe "routing" do

    it "routes to #index" do
      get("/welcomes").should route_to("welcomes#index")
    end

    it "routes to #new" do
      get("/welcomes/new").should route_to("welcomes#new")
    end

    it "routes to #show" do
      get("/welcomes/1").should route_to("welcomes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/welcomes/1/edit").should route_to("welcomes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/welcomes").should route_to("welcomes#create")
    end

    it "routes to #update" do
      put("/welcomes/1").should route_to("welcomes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/welcomes/1").should route_to("welcomes#destroy", :id => "1")
    end

  end
end

require "rails_helper"

RSpec.describe StandUpsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/stand_ups").to route_to("stand_ups#index")
    end

    it "routes to #new" do
      expect(get: "/stand_ups/new").to route_to("stand_ups#new")
    end

    it "routes to #show" do
      expect(get: "/stand_ups/1").to route_to("stand_ups#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/stand_ups/1/edit").to route_to("stand_ups#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/stand_ups").to route_to("stand_ups#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/stand_ups/1").to route_to("stand_ups#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/stand_ups/1").to route_to("stand_ups#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/stand_ups/1").to route_to("stand_ups#destroy", id: "1")
    end
  end
end

require "rails_helper"

RSpec.describe SpendsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/spends").to route_to("spends#index")
    end

    it "routes to #new" do
      expect(get: "/spends/new").to route_to("spends#new")
    end

    it "routes to #show" do
      expect(get: "/spends/1").to route_to("spends#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/spends/1/edit").to route_to("spends#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/spends").to route_to("spends#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/spends/1").to route_to("spends#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/spends/1").to route_to("spends#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/spends/1").to route_to("spends#destroy", id: "1")
    end
  end
end

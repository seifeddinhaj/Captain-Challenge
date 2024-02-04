# spec/controllers/battles_controller_spec.rb
require 'rails_helper'

RSpec.describe BattlesController, type: :controller do
  describe "GET #index" do
    it "assigns @battles and renders the index template" do
      battle = FactoryBot.create(:battle)
      get :index
      expect(assigns(:battles)).to eq([battle])
      expect(response).to render_template("index")
    end
  end

  describe "GET #new" do
    it "assigns a new Battle to @battle" do
      get :new
      expect(assigns(:battle)).to be_a_new(Battle)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before do
        @character1 = create(:character)
        @character2 = create(:character)
      end
      it "creates a new battle" do
        expect {
          post :create, params: { battle: { character1_id: @character1.id, character2_id: @character2.id }}
        }.to change(Battle, :count).by(1)
      end

      it "redirects to the new battle" do
        post :create, params: { battle: { character1_id: @character1.id, character2_id: @character2.id }}
        expect(response).to redirect_to Battle.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new battle" do
        expect {
          post :create, params: { battle: FactoryBot.attributes_for(:battle, character1_id: nil) } # Assuming character1_id is required
        }.to_not change(Battle, :count)
      end

      it "re-renders the new method" do
        post :create, params: { battle: FactoryBot.attributes_for(:battle, character1_id: nil) }
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #show" do
    it "assigns the requested battle to @battle" do
      battle = FactoryBot.create(:battle)
      get :show, params: { id: battle.id }
      expect(assigns(:battle)).to eq(battle)
    end
  end
end

require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  describe 'GET #index' do
    it 'assigns @characters and renders the index template' do
      character = create(:character)
      get :index
      expect(assigns(:characters)).to eq([character])
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'assigns a new Character to @character' do
      get :new
      expect(assigns(:character)).to be_a_new(Character)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new Character' do
        expect {
          post :create, params: { character: attributes_for(:character) }
        }.to change(Character, :count).by(1)
      end

      it 'redirects to the characters index' do
        post :create, params: { character: attributes_for(:character) }
        expect(response).to redirect_to characters_url
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new Character' do
        expect {
          post :create, params: { character: attributes_for(:character, life_points: 0) }
        }.not_to change(Character, :count)
      end

      it 're-renders the new template' do
        post :create, params: { character: attributes_for(:character, life_points: 0) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested character to @character' do
      character = create(:character)
      get :show, params: { id: character.id }
      expect(assigns(:character)).to eq(character)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested character to @character for editing' do
      character = create(:character)
      get :edit, params: { id: character.id }
      expect(assigns(:character)).to eq(character)
    end
  end

  describe 'PATCH #update' do
    before do
      @character = create(:character)
    end

    context 'with valid attributes' do
      it 'updates the character and redirects' do
        patch :update, params: { id: @character, character: attributes_for(:character, name: 'Updated Name') }
        @character.reload
        expect(@character.name).to eq('Updated Name')
        expect(response).to redirect_to character_url(@character)
      end
    end

    context 'with invalid attributes' do
      it 'does not update the character and re-renders the edit template' do
        patch :update, params: { id: @character, character: attributes_for(:character, life_points: 0) }
        expect(@character.name).not_to be_nil
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @character = create(:character)
    end

    it 'deletes the character and redirects to index' do
      expect {
        delete :destroy, params: { id: @character }
      }.to change(Character, :count).by(-1)
      expect(response).to redirect_to characters_path
    end
  end
end

require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

  let (:new_advertisement) { Advertisement.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 599) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [new_advertisement] to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([new_advertisement])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: new_advertisement.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: new_advertisement.id}
      expect(response).to render_template :show
    end

    it "assigns new_advertisement to @advertisement" do
      get :show, {id: new_advertisement.id}
      expect(assigns(:advertisement)).to eq(new_advertisement)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "Advertisement create" do

    it "increases the number of Advertisement by 1" do
      expect{post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 599}}.to change(Advertisement,:count).by(1)
    end

    it "assigns the new Advertisement to @advertisement" do
      post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 599}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it "redirects to the new Advertisement" do
      post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 599}
      expect(response).to redirect_to Advertisement.last
    end
  end
end

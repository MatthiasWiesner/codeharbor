require 'rails_helper'

RSpec.describe "exercises", type: :request do
  context 'logged in' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @exercise = FactoryGirl.create(:only_meta_data, authors: [@user])
      @exercise_params = FactoryGirl.attributes_for(:only_meta_data)
      post_via_redirect login_path, :email => @user.email, :password => @user.password
    end

    describe "GET /exercises" do
      it "works! (now write some real specs)" do
        get exercises_path
        expect(response).to have_http_status(200)
      end
    end
    describe 'POST /exercises' do
      it 'has http 302' do
        post exercises_path,{exercise: @exercise_params}
        expect(response).to have_http_status(302)
      end
    end
    describe 'GET /exercises/new' do
      it 'has http 200' do
        get new_exercise_path
        expect(response).to have_http_status(200)
      end
    end
    describe 'GET /exercises/:id/edit' do
      it 'has http 200' do
        get edit_exercise_path(@exercise)
        expect(response).to have_http_status(200)
      end
    end
    describe 'GET /exercise/:id' do
      it 'has http 200' do
        get exercise_path(@exercise)
        expect(response).to have_http_status(200)
      end
    end
    describe 'PATCH /exercise/:id' do
      it 'has http 302' do
        patch exercise_path(@exercise, exercise: @exercise_params)
        expect(response).to have_http_status(302)
      end
    end
    describe 'PUT /exercise/:id' do
      it 'has http 302' do
        put exercise_path(@exercise, exercise: @exercise_params)
        expect(response).to have_http_status(302)
      end
    end
    describe 'DELETE /exercise/:id' do
      it 'has http 302' do
        delete exercise_path(@exercise)
        expect(response).to have_http_status(302)
      end
    end
  end
end

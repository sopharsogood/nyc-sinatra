class LandmarksController < ApplicationController
  
  get '/landmarks/new' do 
    erb :"/landmarks/new"
  end
  
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :"/landmarks/edit"
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :"/landmarks/show"
  end
  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect_to "/landmarks/#{@landmark.id}"
  end

  patch "/landmarks/:id" do
    # binding.pry
    @landmark = Landmark.find_by(id: params[:id])
    @landmark.update(params[:landmark])
    redirect_to "/landmarks/#{@landmark.id}"
  end
end

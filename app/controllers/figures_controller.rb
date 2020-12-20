class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end
  
  
  get '/figures/new' do
    
    erb :"/figures/new"
  end

  post '/figures' do 
    # binding.pry
    @figure = Figure.new(params[:figure])
    if params[:figure][:title_ids]
      @figure.title_ids << params[:figure][:title_ids]
    else
      @figure.titles.build(params[:title])
    end
    if params[:figure][:landmark_ids]
      @figure.landmark_ids << params[:figure][:landmark_ids]
    else
      @figure.landmarks.build(params[:landmark])
    end
    
    # binding.pry
    @figure.save
    redirect_to "/figures"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do 
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    # binding.pry
    @figure = Figure.find_by(params[:id])
    @figure.update(params[:figure])
    redirect_to "/figures"
  end
end

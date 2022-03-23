class ScoresController < ApplicationController
  def index
  end

  def new
    @score = Score.new
  end

  def create
    @score = Score.new(
      'name' => params[:name],
      'description' => params[:description]
    )
    if @score.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
  end
end

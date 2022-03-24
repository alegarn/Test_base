class ScoresController < ApplicationController
  def index
  end

  def new
    @score = Score.new
  end

  def create
    
    @score = Score.new(
      'startup_id' => current_user.startup.id
    )
    if @score.save
      redirect_to root_path
    else
      flash[:score_delay] = "Problème"
      render 'new'
    end
  end

  def update
  end
end

class AnswerHumenController < ApplicationController

    def index
    end

    def new
      @answer_human = AnswerHuman.new
    end

    def create
      @answer_human = AnswerHuman.new(
        'answer_1' => params[:answer_1],
        'answer_2' => params[:answer_2],
        'category_humen_id' => params[:category_humen_id]
      )

    if  @answer_human.save
      redirect_to root_path
    else
      puts @answer_human.errors.full_messages
      render 'new'
    end

    end

    def update
    end


end

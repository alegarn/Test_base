class AnswerFinancesController < ApplicationController
  def index
  end

  def new
    @answer_finance = AnswerFinance.new
  end

  def create
    @answer_finance = AnswerFinance.new(
      'answer_1' => params[:answer_1],
      'answer_2' => params[:answer_2],
      'category_finance_id' => params[:category_finance_id]
    )

    if  @answer_finance.save
      redirect_to root_path
    else
      puts @answer_finance.errors.full_messages
      render 'new'
    end

  end

  def update
  end
end

class AnswerFinancesController < ApplicationController
  #les routes

  def new
    puts "là"*80
    @answer_finance = AnswerFinance.new
  end

  def create
    puts "ici"*200
    @answer_finance = AnswerFinance.new(answer_finance_params)
    if  @answer_finance.save
      redirect_to root_path
    else
      puts @answer_finance.errors.full_messages
      render 'new'
    end

  end

  private



  def answer_finance_params
    params.permit(:answer_1, :answer_2, :category_finance_id)
  end
  #les routes
end

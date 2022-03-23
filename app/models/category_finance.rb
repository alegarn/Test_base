class CategoryFinance < ApplicationRecord
  belongs_to :score
  has_one :answer_finance, dependent: :destroy

  validates :score_id, uniqueness: true

  after_update :scoring_total

  def scoring_total
    @human = CategoryHuman.find_by(score_id:self.score_id)
    @finance = CategoryFinance.find_by(score_id:self.score_id)
    @score = Score.find(self.score_id)


    if !@human.total_notation_human.nil? && !@finance.total_notation_finance.nil?
      @total = @human.total_notation_human + @finance.total_notation_finance
      @total_max = @human.max_notation_human + @finance.max_notation_finance

      @total_100 = (@total.to_i*100)/@total_max.to_i

      @score.update(total:@total, total_max:@total_max, total_100:@total_100,name:DateTime.current.to_date)


    end

  end

end

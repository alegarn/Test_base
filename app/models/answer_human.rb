class AnswerHuman < ApplicationRecord
  belongs_to :category_human , optional: true

validates :category_humen_id, uniqueness: true

  after_create :scoring

  def scoring
    @total = 0
    if self.answer_1 == 2
      @total = @total +1
    end

    case self.answer_2

    when 1
      @total = @total +1

    when 2
      @total = @total +2

    end


    @total_max = 3

    puts "18"*200

    @total_100 = (@total.to_i*100)/@total_max.to_i


    @category = CategoryHuman.find(self.category_humen_id)
    @category.update(total_notation_human:@total, max_notation_human:@total_max, total_100_human:@total_100.floor)

  end

end

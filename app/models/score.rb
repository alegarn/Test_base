class Score < ApplicationRecord
  belongs_to :startup

  has_one :category_human, dependent: :destroy
  has_one :answer_human, through: :category_human

  has_one :category_finance, dependent: :destroy
  has_one :answer_finance, through: :category_finance

  after_create :create_category_human
  after_create :create_category_finance

  def create_category_human
    @category_human = CategoryHuman.new(
      'score_id' => self.id
    )
    @category_human.save
  end

  def create_category_finance
    @category_finance = CategoryFinance.new(
      'score_id' => self.id
    )
    @category_finance.save
  end
end

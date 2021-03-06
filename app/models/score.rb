class Score < ApplicationRecord
  belongs_to :startup

  has_one :category_human, dependent: :destroy
  has_one :answer_human, through: :category_human

  has_one :category_finance, dependent: :destroy
  has_one :answer_finance, through: :category_finance

  validate :score_exist?, on: :create
  validate :delay_score, on: :create




  after_create :create_category_human
  after_create :create_category_finance



  #si la ligne existe et vide, pas de nouveau score

  def score_exist?

    @score_exist = Score.where(startup_id: self.startup_id).last

    if !@score_exist.nil? && @score_exist.name.nil?
      errors.add(:score_exist?, "Error, not empty.")
      return false
    end

  end

  #si la ligne existe et là, délai!
  def delay_score

    @score = Score.where(startup_id: self.startup_id)

    if !@score.last.nil? && !@score.last.name.nil?

      @last_score = @score.last.name

      @now_90 =  @last_score.to_date + 1
      puts @now_90
      if @now_90 < Date.today
        puts "ok"
        return true

      else
      puts  errors.add(:score_delay, "Error, not enough delay. The delay should be 90 days.")

      end

    else

      return true
    end

  end

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

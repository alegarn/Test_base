class Startup < ApplicationRecord
  belongs_to :user
  has_many :scores, dependent: :destroy #delete_all if there is no method destroy

  validates :user_id, uniqueness: true


  after_create :do_score

  def do_score
    @score = Score.new(
      'startup_id' => self.id
    )
    @score.save
  end
end

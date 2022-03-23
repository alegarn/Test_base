class CreateAnswerHumen < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_humen do |t|
      t.integer :answer_1
      t.integer :answer_2
      t.timestamps
    end
  end
end

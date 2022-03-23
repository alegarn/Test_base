class AddForeignKeyEverywhere < ActiveRecord::Migration[5.2]
  def change
    add_reference :startups, :user, foreign_key:true, on_delete: :cascade
    add_reference :scores, :startup, foreign_key:true, on_delete: :cascade
    add_reference :category_humen, :score, foreign_key:true, on_delete: :cascade
    add_reference :answer_humen, :category_humen, foreign_key:true, on_delete: :cascade #human!!!

  end
end

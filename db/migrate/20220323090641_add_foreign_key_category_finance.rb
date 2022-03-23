class AddForeignKeyCategoryFinance < ActiveRecord::Migration[5.2]
  def change
    add_reference :answer_finances, :category_finance, foreign_key:true, on_delete: :cascade
    add_reference :category_finances, :score, foreign_key:true, on_delete: :cascade

  end
end

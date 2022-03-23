class CreateCategoryHumen < ActiveRecord::Migration[5.2]
  def change
    create_table :category_humen do |t|
      t.integer :total_notation_human
      t.integer :max_notation_human
      t.integer :total_100_human

      t.timestamps
    end
  end
end

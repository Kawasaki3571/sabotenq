class CreateAnswears < ActiveRecord::Migration[5.1]
  def change
    create_table :answears do |t|
      t.text :answear_text
      t.string :final_answear
      t.integer :user_id

      t.timestamps
    end
  end
end

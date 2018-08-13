class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :explain
      t.string :image_name
      t.text :comment
      t.integer :evaluation

      t.timestamps
    end
  end
end

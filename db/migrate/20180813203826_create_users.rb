class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.text :pass_question
      t.text :user_image_name
      t.integer :user_point

      t.timestamps
    end
  end
end

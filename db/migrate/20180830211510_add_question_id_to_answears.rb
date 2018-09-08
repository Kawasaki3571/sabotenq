class AddQuestionIdToAnswears < ActiveRecord::Migration[5.1]
  def change
    add_column :answears, :question_id, :integer
  end
end

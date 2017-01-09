class AddDescriptionToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :description, :text, null: false
  end
end

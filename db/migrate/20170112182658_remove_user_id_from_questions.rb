class RemoveUserIdFromQuestions < ActiveRecord::Migration[5.0]
  def up
    remove_column :questions, :user_id
  end

  def down
    add_column :questions, :user_id, :integer, null: false
  end
end

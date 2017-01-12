class RemoveUserIdFromAnswers < ActiveRecord::Migration[5.0]
  def up
    remove_column :answers, :user_id
  end

  def down
    add_column :answers, :user_id, :integer, null: false
  end
end

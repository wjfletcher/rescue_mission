class RemoveUsers < ActiveRecord::Migration[5.0]
  def up
    drop_table :users
  end

  def down
    create_table :users do |t|
      t.string :username, null: false

      t.timestamps
    end
  end
end

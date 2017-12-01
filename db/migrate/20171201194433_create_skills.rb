class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.column :user_id, :integer
      t.column :skill, :string

      t.timestamps
    end
  end
end

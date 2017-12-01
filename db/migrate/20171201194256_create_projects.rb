class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.column :user_id, :integer
      t.column :name, :string
      t.column :description, :text
    end
  end
end

class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :goal_in_cents
      t.datetime :start_date
      t.datetime :finish_date
      t.integer :owner_id
      t.datetime :public_date

      t.timestamps
    end
  end
end

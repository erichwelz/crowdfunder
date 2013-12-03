class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :amount_in_dollars

      t.timestamps
    end
  end
end

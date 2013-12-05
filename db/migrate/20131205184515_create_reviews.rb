class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :project_id
      t.string :user_id_integer

      t.timestamps
    end
  end
end

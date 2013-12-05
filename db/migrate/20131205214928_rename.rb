class Rename < ActiveRecord::Migration
  def change
    remove_column :reviews, :user_id_integer
    add_column :reviews, :user_id, :integer
  end
end

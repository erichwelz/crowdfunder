class Drop < ActiveRecord::Migration
  def change
    add_column :projects, :category_id, :integer
    remove_column :categories, :project_id
  end
end

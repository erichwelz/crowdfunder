class ChangeDatetimetoDateinProjects < ActiveRecord::Migration
  def change
  	change_column :projects, :start_date, :date
  	change_column :projects, :finish_date, :date
  	change_column :projects, :goal_in_cents, :bigint


  end
end


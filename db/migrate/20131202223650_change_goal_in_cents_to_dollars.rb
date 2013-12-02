class ChangeGoalInCentsToDollars < ActiveRecord::Migration
  def change
  	rename_column :projects, :goal_in_cents, :goal_in_dollars
  end
end

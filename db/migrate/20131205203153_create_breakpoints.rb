class CreateBreakpoints < ActiveRecord::Migration
  def change
    create_table :breakpoints do |t|
      t.integer :project_id
      t.integer :breakpoint_amount
      t.string :breakpoint_name

      t.timestamps
    end
  end
end

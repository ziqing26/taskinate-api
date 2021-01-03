class ChangeColumnNull < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :done, :boolean, :default => false

  end
end

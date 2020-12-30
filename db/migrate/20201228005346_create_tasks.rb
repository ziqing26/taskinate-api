class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :done
      t.datetime :due_time
      t.text :desciption

      t.timestamps
    end
  end
end

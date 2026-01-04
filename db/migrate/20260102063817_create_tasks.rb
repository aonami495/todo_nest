class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due_on
      t.integer :status
      t.integer :priority

      t.timestamps
    end
  end
end

class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.references :course, foreign_key: true, null: false
      t.datetime :start_date
      t.integer :students_count, null: false, default: 0

      t.timestamps
    end
  end
end

class CreateStudentsGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :students_groups do |t|
      t.references :student, foreign_key: true, null: false
      t.references :group, foreign_key: true, null: false

      t.timestamps
    end

    add_index :students_groups, [:student_id, :group_id], unique: true
  end
end

class CreateGradeSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :grade_schools do |t|
      t.string  :name
      t.integer :grade
      t.integer :is_graduated, default: 0
      t.integer :enrolled, default: 0
      t.timestamps
    end
    add_index :grade_schools, :is_graduated
    add_index :grade_schools, :grade
    add_index :grade_schools, :enrolled
  end
end

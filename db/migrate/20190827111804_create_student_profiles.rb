class CreateStudentProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :student_profiles do |t|
      t.string :nickname
      t.text :introduction
      t.integer :student_id, foreign_key: true

      t.timestamps
    end
  end
end

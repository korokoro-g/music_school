class CreateTeacherProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_profiles do |t|
      t.string :nickname
      t.string :instrument
      t.string :level
      t.integer :lesson_fee
      t.text :introduction
      t.references :teacher_id, foreign_key: true

      t.timestamps
    end
  end
end

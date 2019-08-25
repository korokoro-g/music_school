class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.date :birthday
      t.string :address
      t.string :password_digest

      t.timestamps
    end
  end
end

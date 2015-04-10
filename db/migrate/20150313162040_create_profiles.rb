class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.string :phone_number
      t.string :email
      t.string :position
      t.string :years_of_experiance
      t.text :cover_letter
      t.text :resume
      t.text :reference

      t.timestamps
    end
  end
end

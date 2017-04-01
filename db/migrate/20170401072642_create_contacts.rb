class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :company
      t.string :position
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end

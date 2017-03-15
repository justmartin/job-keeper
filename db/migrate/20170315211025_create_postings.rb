class CreatePostings < ActiveRecord::Migration[5.0]
  def change
    create_table :postings do |t|
      t.string :company
      t.string :position
      t.date :date

      t.timestamps
    end
  end
end

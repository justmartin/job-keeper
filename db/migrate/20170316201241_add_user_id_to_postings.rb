class AddUserIdToPostings < ActiveRecord::Migration[5.0]
  def change
    add_column :postings, :user_id, :integer
    add_index :postings, :user_id
  end
end

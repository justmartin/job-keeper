class AddResponseToPostings < ActiveRecord::Migration[5.0]
  def change
    add_column :postings, :response, :boolean, default: false
  end
end

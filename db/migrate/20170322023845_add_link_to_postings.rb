class AddLinkToPostings < ActiveRecord::Migration[5.0]
  def change
    add_column :postings, :link, :string
  end
end

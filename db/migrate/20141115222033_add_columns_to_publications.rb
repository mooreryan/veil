class AddColumnsToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :authors, :text
    add_column :publications, :title, :text
    add_column :publications, :journal, :string
    add_column :publications, :date, :string
    add_column :publications, :doi, :string
    add_column :publications, :pmid, :string
  end
end

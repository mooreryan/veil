class ChangeFormatsInPublications < ActiveRecord::Migration
  def change
    [:link, :journal, :date, :doi, :pmid].each do |column|
      change_column :publications, column, :text
    end
  end
end

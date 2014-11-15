class ChangeCitationFormatInPublications < ActiveRecord::Migration
  def change
    change_column :publications, :citation, :text
  end
end

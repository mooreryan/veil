class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :citation
      t.string :link
      t.text :info

      t.timestamps
    end
  end
end

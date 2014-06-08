class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :people, :type, :p_type
  end
end

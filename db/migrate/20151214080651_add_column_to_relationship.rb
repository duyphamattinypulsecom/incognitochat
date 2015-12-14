class AddColumnToRelationship < ActiveRecord::Migration
  def change
    add_column :relationships, :new_message, :boolean, :default => false
  end
end

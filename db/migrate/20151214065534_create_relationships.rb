class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :from_id
      t.integer :to_id
      t.string :rs_type, :default => 'friend'

      t.timestamps null: false
    end
  end
end

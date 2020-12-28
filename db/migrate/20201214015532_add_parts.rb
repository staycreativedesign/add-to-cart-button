class AddParts < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_parts do |t|
      t.string :variant_id
      t.string :type
      t.boolean :availalbe, default: true
      t.timestamps
    end
  end
end

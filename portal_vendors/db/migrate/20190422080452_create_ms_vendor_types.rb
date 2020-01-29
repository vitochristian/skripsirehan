# frozen_string_literal: true

class CreateMsVendorTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :ms_vendor_types do |t|
      t.string :type_name
      t.string :type_desc
      t.boolean :is_active
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
  end
end

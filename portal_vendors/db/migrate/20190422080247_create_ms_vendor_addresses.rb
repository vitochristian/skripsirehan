# frozen_string_literal: true

class CreateMsVendorAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :ms_vendor_addresses do |t|
      t.bigint :ms_vendor_id
      t.string :address_name
      t.string :address
      t.string :city
      t.string :province
      t.string :country
      t.string :postal_code
      t.boolean :is_active
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
  end
end

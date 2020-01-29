class CreateTrRfqs < ActiveRecord::Migration[5.2]
  def change
    create_table :tr_rfqs do |t|
      t.integer :ms_vendor_type_id
      t.text :item_name
      t.text :delivery_site
      t.text :note
      t.text :description
      t.date :need_by_date
      t.integer :term_of_payment
      t.boolean :is_active
      t.integer :created_by
      t.integer :updated_by
      t.string :status

      t.timestamps
    end
  end
end

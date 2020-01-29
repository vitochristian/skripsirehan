class CreateMsVendorDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :ms_vendor_documents do |t|
      t.integer   :ms_vendor_id
      t.string    :document
      t.string    :document_name
      t.boolean   :is_active
      t.integer   :created_by
      t.datetime  :created_at

      t.timestamps
    end
  end
end

class AddAccountDocumentToMsVendor < ActiveRecord::Migration[5.2]
  def change
    add_column :ms_vendors, :account_document, :string
  end
end

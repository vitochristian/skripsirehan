class AddAdditionalColumsToMsVendors < ActiveRecord::Migration[5.2]
  def change
    unless ActiveRecord::Base.connection.column_exists?(:ms_vendors, :office_location)
      add_column :ms_vendors, :office_location, :string
    end
    unless ActiveRecord::Base.connection.column_exists?(:ms_vendors, :entity)
      add_column :ms_vendors, :entity, :string
    end
    unless ActiveRecord::Base.connection.column_exists?(:ms_vendors, :doc_ktp)
      add_column :ms_vendors, :doc_ktp, :string
    end
    unless ActiveRecord::Base.connection.column_exists?(:ms_vendors, :doc_catalog)
      add_column :ms_vendors, :doc_catalog, :string
    end
    unless ActiveRecord::Base.connection.column_exists?(:ms_vendors, :doc_psp)
      add_column :ms_vendors, :doc_psp, :string
    end
    unless ActiveRecord::Base.connection.column_exists?(:ms_vendors, :catalog_status)
      add_column :ms_vendors, :catalog_status, :boolean
    end
  end
end

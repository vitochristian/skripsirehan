class AddCurrencyToMsVendor < ActiveRecord::Migration[5.2]
  def change
    unless ActiveRecord::Base.connection.column_exists?(:ms_vendors, :currency)
      add_column :ms_vendors, :currency, :string
    end
  end
end

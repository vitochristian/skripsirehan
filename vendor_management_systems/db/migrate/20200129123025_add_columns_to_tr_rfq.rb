class AddColumnsToTrRfq < ActiveRecord::Migration[5.2]
  def change
    add_column :tr_rfqs, :expiration_date, :date
    add_column :tr_rfqs, :qty, :integer
    add_column :tr_rfqs, :uom, :string
  end
end

class AddNoRfqToTrRfq < ActiveRecord::Migration[5.2]
  def change
    add_column :tr_rfqs, :no_rfq, :string
  end
end

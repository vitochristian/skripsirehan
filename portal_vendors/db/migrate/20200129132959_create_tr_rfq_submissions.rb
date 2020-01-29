class CreateTrRfqSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :tr_rfq_submissions do |t|
      t.string :bidding_types
      t.text :description
      t.datetime :need_by_date
      t.integer :term_of_payment
      t.string :no_quotation
      t.string :incoterms
      t.text :note
      t.boolean :is_active
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
  end
end

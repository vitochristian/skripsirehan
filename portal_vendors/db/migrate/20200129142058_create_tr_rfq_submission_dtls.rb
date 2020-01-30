class CreateTrRfqSubmissionDtls < ActiveRecord::Migration[5.2]
  def change
    create_table :tr_rfq_submission_dtls do |t|
      t.integer :offered_qty
      t.integer :price
      t.integer :tr_rfq_submission_id

      t.timestamps
    end
  end
end

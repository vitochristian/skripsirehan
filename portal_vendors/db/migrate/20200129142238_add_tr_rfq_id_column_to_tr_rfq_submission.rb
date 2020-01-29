class AddTrRfqIdColumnToTrRfqSubmission < ActiveRecord::Migration[5.2]
  def change
    add_column :tr_rfq_submissions, :tr_rfq_id, :integer
  end
end

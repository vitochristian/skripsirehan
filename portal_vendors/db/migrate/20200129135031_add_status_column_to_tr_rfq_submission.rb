class AddStatusColumnToTrRfqSubmission < ActiveRecord::Migration[5.2]
  def change
    add_column :tr_rfq_submissions, :status, :string
  end
end

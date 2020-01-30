class TrRfqSubmission < ApplicationRecord
	has_many :tr_rfq_submission_dtls
	accepts_nested_attributes_for :tr_rfq_submission_dtls, reject_if: :all_blank, allow_destroy: true
end

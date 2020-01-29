class MsVendorDocument < ApplicationRecord

  mount_uploader :document, DocumentUploader

  belongs_to :ms_vendor

  validates_presence_of :document_name, if: :legal_aspect_company


  def legal_aspect_company
    ms_vendor.entity == 'company' && !document.blank?
  end
end

# frozen_string_literal: true

class MsVendorAddress < ApplicationRecord
  belongs_to :ms_vendor

  validates_presence_of :address_name, if: :company_address
  validates_presence_of :address, if: :company_address
  validates_presence_of :city, if: :company_address
  validates_presence_of :province, if: :company_address
  validates_presence_of :country, if: :company_address
  validates :postal_code, presence: true, numericality: true, if: :company_address
  validates_associated :ms_vendor, if: :company_address


  def company_address
    ms_vendor.current_step == 'company_address'
  end

end

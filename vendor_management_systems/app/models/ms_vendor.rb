class MsVendor < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  belongs_to :ms_vendor_type
  has_many :ms_vendor_addresses

  mount_uploader :doc_npwp, DocumentUploader
  mount_uploader :doc_skt_sppkp, DocumentUploader
  mount_uploader :doc_siup_iut_iui, DocumentUploader
  mount_uploader :doc_tdp, DocumentUploader

  before_save :normalize_npwp_number
  
  has_many :ms_vendor_addresses, dependent: :destroy
  has_many :ms_vendor_documents, dependent: :destroy
  accepts_nested_attributes_for :ms_vendor_addresses, allow_destroy: true
  accepts_nested_attributes_for :ms_vendor_documents, allow_destroy: true
  
  validates_uniqueness_of :username, if: :verify_only?
  validates_length_of :username, minimum: 5, maximum: 10

  # validates_presence_of :potential_status
  validates_inclusion_of :potential_status, in: [true, false]
  validates_presence_of :potential_desc
  validates_presence_of :vendor
  validates_presence_of :ms_vendor_type_id
  validates :phone_1, format: { with: /\(?\+[0-9]{9,15}/ }, allow_blank: true
  validates :phone_2, format: { with: /\(?\+[0-9]{9,15}/ }, allow_blank: true
  validates :phone_3, format: { with: /\(?\+[0-9]{9,15}/ }, allow_blank: true
  validates :fax, format: { with: /\(?\+[0-9]{9,15}/ }, allow_blank: true
  validates_presence_of :sales_tittle
  validates_presence_of :sales_name
  validates_presence_of :sales_job
  validates_presence_of :sales_phone
  validates :sales_phone, presence: true, format: { with: /\(?\+[0-9]{9,15}/ }, allow_blank: true
  validates :sales_email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates_presence_of :finance_tittle
  validates_presence_of :finance_name
  validates_presence_of :finance_job
  validates :finance_phone, presence: true, format: { with: /\(?\+[0-9]{9,15}/ }, allow_blank: true
  validates :finance_email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  validates_presence_of :tax_address, if: :legal_aspect
  validates_presence_of :tax_city, if: :legal_aspect
  validates_presence_of :tax_province, if: :legal_aspect
  validates_presence_of :tax_postal_code, if: :legal_aspect
  validates :tax_postal_code, presence: true, numericality: true, if: :legal_aspect
  validates_presence_of :npwp_name, if: :legal_aspect
  validates_presence_of :npwp_number, if: :legal_aspect

  validates_presence_of :bank_acc_type
  validates_presence_of :bank_city
  validates_presence_of :bank_name
  validates_presence_of :bank_acc_name
  validates :bank_acc_number, presence: true, numericality: true
  validates :bank_swift_code, presence: true, if: :bank_swift_code_validation
  validates :bank_swift_code, numericality: true, if: :finance_aspect_swift_code
  validate :check_file

  def check_username
    if username.size < 5
      errors.add(:username, "is too short (minimum is 5 characters)")
      return false
    elsif username.size > 10
      errors.add(:username, "is too long (maximum is 10 characters)")
      return false
    else
      return true
    end
  end

  def finance_aspect_swift_code
    currency.upcase != 'IDR'
  end

  def bank_swift_code_validation
    if currency.upcase != 'IDR'
      unless bank_swift_code.present?
        errors.add(:bank_swift_code, "can't be blank")
      end
    end
  end

  def legal_aspect
    office_location.downcase == 'indonesia'
  end

  def check_file
    if legal_aspect
      ['doc_npwp', 'doc_skt_sppkp', 'doc_siup_iut_iui', 'doc_tdp'].each do |type|
        unless ApiService::CheckFile.new(self.id, type).execute
          errors.add(type, "can't be blank")
        end  
      end
    end
  end

  def vendor_type
    self.ms_vendor_type.type_name
  end

  def verify_only?
    vendor_status == 2
  end

  def email_required?
    false
  end

  def normalize_npwp_number
    self.npwp_number = self.npwp_number.gsub(/[-,.]/, "") if self.npwp_number.present?
  end

  def city
    addresses = []
    addresses = self.ms_vendor_addresses.where(address_name: 'Head Office')
    addresses = self.ms_vendor_addresses.where(address_name: 'Factory') if addresses.empty?
    addresses = self.ms_vendor_addresses.where(address_name: 'Branch') if addresses.empty?

    addresses.first.city rescue ''
  end

  def self.search_data(location, type, status)
    data = self.where(is_active: 1, vendor_status: status)

    data = data.where(office_location: location) if location.present?
    data = data.where(ms_vendor_type_id: type) if type.present?

    return data
  end
end
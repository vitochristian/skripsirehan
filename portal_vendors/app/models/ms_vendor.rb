class MsVendor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  attr_writer :current_step
  mount_uploader :doc_npwp, DocumentUploader
  mount_uploader :doc_skt_sppkp, DocumentUploader
  mount_uploader :doc_siup_iut_iui, DocumentUploader
  mount_uploader :doc_tdp, DocumentUploader
  mount_uploader :doc_catalog, DocumentUploader
  mount_uploader :doc_psp, DocumentUploader
  mount_uploader :account_document, DocumentUploader
  mount_uploader :doc_ktp, DocumentUploader

  before_save :normalize_npwp_number
  before_create :update_mailer
  
  belongs_to :ms_vendor_type
  has_many :ms_vendor_addresses, dependent: :destroy
  has_many :ms_vendor_documents, dependent: :destroy
  accepts_nested_attributes_for :ms_vendor_addresses, allow_destroy: true
  accepts_nested_attributes_for :ms_vendor_documents, allow_destroy: true

  # validates_presence_of :username, if: :company_profile
  validates_presence_of :vendor, if: :company_profile
  validates_presence_of :ms_vendor_type_id, if: :company_profile
  validates :phone_1, format: { with: /\(?\+[0-9]{9,15}/, message: 'is invalid. Example: +6285288876001' }, allow_blank: true, if: :company_profile
  validates :phone_2, format: { with: /\(?\+[0-9]{9,15}/, message: 'is invalid. Example: +6285288876001' }, allow_blank: true, if: :company_profile
  validates :phone_3, format: { with: /\(?\+[0-9]{9,15}/, message: 'is invalid. Example: +6285288876001' }, allow_blank: true, if: :company_profile
  validates :fax, allow_blank: true, format: { with: /\(?\+[0-9]{9,15}/, message: 'is invalid. Example: +622129635700' }, if: :company_profile
  validates_presence_of :sales_tittle, if: :company_profile
  validates_presence_of :sales_name, if: :company_profile
  validates_presence_of :sales_job, if: :company_profile
  validates_presence_of :sales_phone, if: :company_profile
  validates :sales_phone, presence: true, format: { with: /\(?\+[0-9]{9,15}/, message: 'is invalid. Example: +6285288876001' }, if: :company_profile
  validates :sales_email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, if: :company_profile
  validates_presence_of :finance_tittle, if: :company_profile
  validates_presence_of :finance_name, if: :company_profile
  validates_presence_of :finance_job, if: :company_profile
  validates :finance_phone, presence: true, format: { with: /\(?\+[0-9-]{9,15}/, message: 'is invalid. Example: +6285288876001' }, if: :company_profile
  validates :finance_email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, if: :company_profile

  validates_presence_of :tax_address, if: :legal_aspect
  validates_presence_of :tax_city, if: :legal_aspect
  validates_presence_of :tax_province, if: :legal_aspect
  # validates_presence_of :tax_country, if: :legal_aspect
  validates_presence_of :tax_postal_code, if: :legal_aspect
  validates :tax_postal_code, presence: true, numericality: true, if: :legal_aspect
  validates_presence_of :npwp_name, if: :legal_aspect
  validates_presence_of :npwp_number, if: :legal_aspect
  validates_presence_of :doc_npwp, if: :legal_aspect
  validates_presence_of :doc_skt_sppkp, if: :legal_aspect_company
  validates_presence_of :doc_siup_iut_iui, if: :legal_aspect_company
  validates_presence_of :doc_tdp, if: :legal_aspect_company
  validates_presence_of :doc_ktp, if: :legal_aspect_personal

  validates_presence_of :bank_acc_type, if: :finance_aspect
  validates_presence_of :bank_city, if: :finance_aspect
  validates_presence_of :bank_name, if: :finance_aspect
  validates_presence_of :bank_acc_name, if: :finance_aspect
  validates_presence_of :currency, if: :finance_aspect
  validates :bank_acc_number, presence: true, numericality: true, if: :finance_aspect
  # validates :bank_swift_code, presence: true, if: :finance_aspect_swift_code
  validate :bank_swift_code_validation
  validates :bank_swift_code, numericality: true, if: :finance_aspect_swift_code
  
  def vendor_type
    self.ms_vendor_type.type_name
  end

  def company_profile
    current_step == 'company_profile'
  end

  def legal_aspect
    current_step == 'legal_aspect' && office_location.downcase == 'indonesia'
  end

  def legal_aspect_company
    legal_aspect && entity == 'company'
  end

  def legal_aspect_personal
    legal_aspect && entity == 'personal'
  end

  def finance_aspect
    current_step == 'finance_aspect'
  end

  def bank_swift_code_validation
    if current_step == 'finance_aspect' && currency.upcase != 'IDR'
      unless bank_swift_code.present?
        errors.add(:bank_swift_code, "can't be blank")
      end
    end
  end

  def finance_aspect_swift_code
    current_step == 'finance_aspect' && currency.upcase != 'IDR'
  end

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[company_profile company_address finance_aspect legal_aspect password]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end

  def password_required?
   new_record? ? false : super
  end

  def email_required?
    false
  end

  def normalize_npwp_number
    self.npwp_number = self.npwp_number.gsub(/[-,.]/, "") if self.npwp_number.present?
  end

  def update_mailer
    self.email = self.sales_email
  end

  def self.update_all_email
    vendors = MsVendor.all

    vendors.each do |vendor|
      vendor.update_attributes(email: vendor.sales_email)
    end
  end

end

class WorklistsController < ApplicationController
  before_action :set_vendor, only: %i[show verify decline verify_vendor decline_vendor]
  before_action :username, only: %i[verify verify_vendor]
  before_action :generate_password, only: :verify_vendor

  def index
    if params[:office_location].present? || params[:ms_vendor_type_id].present?
      office_location = params[:office_location].downcase rescue nil
      vendor_type = params[:ms_vendor_type_id] rescue nil
      @vendors = MsVendor.search_data(office_location, vendor_type, 1)
    else
      @vendors = MsVendor.where(is_active: 1, vendor_status: 1)
    end
    @ms_vendor_types = MsVendorType.vendor_type_id
    @tr_rfqs = TrRfq.all
    @tr_rfq_submissions = TrRfqSubmission.all
  end

  def show
    @vendor = MsVendor.find(params[:id])
  end

  def verify
    respond_to :js
  end

  def decline
    respond_to :js
  end

  def verify_vendor
    @vendor.assign_attributes(vendor_params)    
    if @vendor.check_username && @vendor.save(validate: false)
      NotificationMailer.verify_vendor(@vendor, @vendor.password).deliver_later
      redirect_to root_url, notice: 'Vendor has been updated.'
    else
      respond_to :js
    end
  end

  def decline_vendor
    @vendor.assign_attributes(vendor_params)
    if @vendor.save(validate: false)
      NotificationMailer.decline_vendor(@vendor).deliver_later
      redirect_to root_url, notice: 'Vendor has been updated.'
    else
      respond_to :js
    end
  end

  private

  def vendor_params
    params.require(:ms_vendor).permit(:username, :password, :reject_reason, :potential_status, :potential_desc, :vendor_status, :created_by, :updated_by)
  end

  def set_vendor
    @vendor = MsVendor.find(params[:id])
  end

  def username
    @username = @vendor.vendor.downcase.remove('pt. ', 'pt ', 'cv. ', 'cv ', ' ').to(7)
  end

  def generate_password
    @vendor.password = SecureRandom.hex(64)[0..10] unless @vendor.encrypted_password?
  end
end

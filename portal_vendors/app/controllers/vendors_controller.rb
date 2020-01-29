class VendorsController < ApplicationController
  before_action :set_ms_vendor, only: [:edit, :update, :update_password]

  def index
  end

  def edit
    step = params[:step].present? ? params[:step] : 'company_profile'
    @ms_vendor.update_attributes(current_step: step)
    
    if step == 'password'
      @path = update_password_vendor_path(@ms_vendor)
      @method = :patch
    else
      @path = vendor_path(@ms_vendor)
      @method = :put
    end
  end

  def update
    @ms_vendor.current_step = params[:ms_vendor][:step]
    
    if @ms_vendor.update_attributes(vendor_params)
      redirect_to root_url, notice: "Profile has been updated."
    else
      render :edit
    end
  end

  def update_password
    @ms_vendor = current_ms_vendor
    @path = update_password_vendor_path(@ms_vendor)
    @method = :patch

    if @ms_vendor.update_with_password(password_params)
      # Sign in the vendor by passing validation in case their password changed
      bypass_sign_in(@ms_vendor)
      redirect_to root_path, notice: "Password has been updated."
    else
      redirect_to edit_vendor_path(@ms_vendor, step: 'password'), alert: @ms_vendor.errors.full_messages.join(', ')
    end
  end

  private

    def password_params
      params.require(:ms_vendor).permit(:current_password, :password, :password_confirmation)
    end

    def set_ms_vendor
      @ms_vendor = current_ms_vendor.present? ? current_ms_vendor : MsVendor.find_by_id(params[:id])
      @ms_vendor_types = MsVendorType.vendor_type_id
    end

    def vendor_params
      params.require(:ms_vendor).permit(
        { ms_vendor_addresses_attributes: %i[id ms_vendors_id address_name address city province country postal_code is_active created_by updated_by _destroy] },
        { ms_vendor_documents_attributes: %i[id ms_vendors_id document document_name is_active created_by updated_by _destroy] }, 
        :office_location, :currency, :vendor, :email, :password, :password_confirmation, :remember_me, :website, :fax, :phone_1, :phone_2, :phone_3, 
        :ms_vendor_type_id, :sales_tittle, :sales_name, :sales_job, :sales_phone, :sales_email, :finance_tittle, :finance_name, :finance_job, :finance_phone, 
        :finance_email, :tax_address, :tax_city, :tax_province, :tax_country, :tax_postal_code, :npwp_name, :npwp_number, :doc_npwp, :doc_skt_sppkp, 
        :doc_siup_iut_iui, :doc_tdp, :bank_acc_type, :bank_city, :bank_name, :bank_acc_name, :bank_acc_number, :bank_swift_code, :bank, :vendor_status, 
        :potential_status, :potential_desc, :is_active, :created_by, :updated_by, :account_document, :entity, :doc_ktp)
    end
end

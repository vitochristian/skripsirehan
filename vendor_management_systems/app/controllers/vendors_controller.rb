class VendorsController < ApplicationController
  before_action :set_vendor, only: %i[edit update]
  before_action :vendor_types, only: %i[edit update index]
  
  def index
    if params[:office_location].present? || params[:ms_vendor_type_id].present?
      office_location = params[:office_location].downcase rescue nil
      vendor_type = params[:ms_vendor_type_id] rescue nil
      @vendors = MsVendor.search_data(office_location, vendor_type, 2)
    else
      @vendors = MsVendor.where(is_active: 1, vendor_status: 2)
    end
  end

  def edit
    @vendor = MsVendor.find(params[:id])
  end

  def update
    if @vendor.update(vendor_params)
      flash[:notice] = 'Vendor telah berhasil di ubah.'
      redirect_to vendors_url
    else
      render :edit
    end
  end

  def get_image
    if params[:format] == 'document'      
      document = MsVendorDocument.find params[:id]
      file_path = document.document.path
    else      
      vendor = MsVendor.find params[:id]    
      file_path = vendor.send(params[:format]).path
    end

    if file_path.include?('.pdf')
      send_file file_path, :disposition => 'inline', :type => 'application/pdf'
    else
      send_file file_path, :disposition => 'inline'
    end
  end

  def destroy_session
    # session.delete(:cas)
    redirect_to worklists_path
  end

  private

  def set_vendor
    @vendor = MsVendor.find(params[:id])
  end

  def vendor_types
    @ms_vendor_types = MsVendorType.vendor_type_id
  end

  def vendor_params
    params.require(:ms_vendor).permit(
      { ms_vendor_address_attributes: %i[id ms_vendors_id address_name address city province country postal_code is_active created_by updated_by _destroy] },
      { ms_vendor_documents_attributes: %i[id ms_vendors_id document document_name is_active created_by updated_by _destroy] },
      :currency, :vendor, :email, :password, :password_confirmation, :remember_me, :website, :fax, :phone_1, :phone_2, :phone_3, :ms_vendor_type_id, 
      :sales_tittle, :sales_name, :sales_job, :sales_phone, :sales_email, :finance_tittle, :finance_name, :finance_job, :finance_phone, 
      :finance_email, :tax_address, :tax_city, :tax_province, :tax_country, :tax_postal_code, :npwp_name, :npwp_number, :doc_npwp, :doc_skt_sppkp, 
      :doc_siup_iut_iui, :doc_tdp, :bank_acc_type, :bank_city, :bank_name, :bank_acc_name, :bank_acc_number, :bank_swift_code, :bank, :vendor_status, 
      :potential_status, :potential_desc, :is_active, :created_by, :updated_by)
  end
end

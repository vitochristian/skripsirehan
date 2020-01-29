class ProductsAndServicesController < ApplicationController

  def index
    @ms_vendor = current_ms_vendor
    check_product_and_service
  end

  def update
    flag = true
    @ms_vendor = current_ms_vendor.present? ? current_ms_vendor : MsVendor.find_by_id(params[:id])

    if vendor_params[:doc_psp].present? && !['.doc', '.docx'].include?(File.extname(vendor_params[:doc_psp].original_filename))
      error_message = 'Upload failed. File is not match PSP template'
      flag = false
    elsif vendor_params[:doc_psp].nil?
      flag = true
    end

    if flag && vendor_params[:doc_catalog].present?
      flag, error_message = ImportFile.new(vendor_params[:doc_catalog]).run
    else
      flash[:alert] = error_message
    end

    if flag && @ms_vendor.update_attributes(vendor_params.merge({ catalog_status: true }))
      redirect_to root_url, notice: "Profile has been updated."
    else
      flash[:alert] = error_message
      redirect_to products_and_services_path
    end
  end

  def download_template
    path = Rails.root.to_s + '/public/catalog.xlsx'
    file_type = 'application/xlsx'
    if params[:type].present? && params[:type] == 'psp'
      path = Rails.root.to_s + '/public/psp.doc'
      file_type = 'application/doc'
    end

    send_file path, :disposition => 'inline', :type => file_type
  end

  private

    def vendor_params
      params.require(:ms_vendor).permit({ ms_vendor_addresses_attributes: %i[id ms_vendors_id address_name address city province country postal_code is_active created_by updated_by _destroy] }, :vendor, :email, :password, :password_confirmation, :remember_me, :website, :fax, :phone_1, :phone_2, :phone_3, :ms_vendor_type_id, :sales_tittle, :sales_name, :sales_job, :sales_phone, :sales_email, :finance_tittle, :finance_name, :finance_job, :finance_phone, :finance_email, :tax_address, :tax_city, :tax_province, :tax_country, :tax_postal_code, :npwp_name, :npwp_number, :doc_npwp, :doc_skt_sppkp, :doc_siup_iut_iui, :doc_tdp, :bank_acc_type, :bank_city, :bank_name, :bank_acc_name, :bank_acc_number, :bank_swift_code, :bank, :vendor_status, :potential_status, :potential_desc, :is_active, :created_by, :updated_by, :account_document, :doc_catalog, :doc_psp)
    end
end

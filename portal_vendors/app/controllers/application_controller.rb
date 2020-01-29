# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_ms_vendor!
  before_action :check_product_and_service_data
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
  #   added_attrs = [ :vendor, :email, :password, :password_confirmation, :remember_me, :website, :fax, :phone_1, :phone_2, :phone_3, :ms_vendor_type_id, :sales_tittle, :sales_name, :sales_job, :sales_phone, :sales_email, :finance_tittle, :finance_name, :finance_job, :finance_phone, :tax_address, :tax_city, :tax_province, :tax_country, :tax_postal_code, :npwp_name, :npwp_number, :doc_npwp, :doc_skt_sppkp, :doc_siup_iut_iui, :doc_tdp, :bank_acc_type, :bank_city, :bank_name, :bank_acc_name, :bank_acc_number, :bank_swift_code, :doc_bank, :vendor_status, :is_active, :created_by, :updated_by]
  #   devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs, ms_vendor_address_attributes: %i[id ms_vendors_id address_name address city province country postal_code is_active created_by updated_by _destroy])
  #   devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  # end

  def check_product_and_service_data
    check_product_and_service

    if @flag && params[:controller] == 'inquiries'
      #redirect_to products_and_services_path
    end
  end

  private

    def check_product_and_service
      if current_ms_vendor.present?
        @flag = false
        @flag = true if !current_ms_vendor.doc_catalog.present?
        @flag = true if current_ms_vendor.vendor_type.downcase.include?('packaging') && !current_ms_vendor.doc_psp.present?
      end
    end
end
# ms_vendor_address_attributes: %i[id ms_vendors_id address_name address city province country postal_code is_active created_by updated_by _destroy]
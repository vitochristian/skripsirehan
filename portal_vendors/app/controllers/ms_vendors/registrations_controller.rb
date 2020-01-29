# frozen_string_literal: true

class MsVendors::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  before_action :vendor_types
  # before_action :configure_account_update_params, only: [:update]
  # GET /resource/sign_up
  def new
    @ms_vendor = MsVendor.new(session[:ms_vendor_params])
    @ms_vendor.ms_vendor_addresses.build if @ms_vendor.ms_vendor_addresses.empty?
    step
  end

  # POST /resource
  def create
    session[:ms_vendor_params].deep_merge!(params[:ms_vendor].to_unsafe_h) if params[:ms_vendor]
    @ms_vendor = MsVendor.new(session[:ms_vendor_params])
    @ms_vendor.ms_vendor_addresses.build if @ms_vendor.ms_vendor_addresses.empty?
    @ms_vendor.current_step = session[:ms_vendor_step]
    validity_step
    if @ms_vendor.new_record?
      render :new
    else
      session[:ms_vendor_params] = session[:ms_vendor_step] = nil
      redirect_to root_url, notice: "Thank you for signed up, we'll contact you once your profile is verified."
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def step
    session[:ms_vendor_params] ||= {}
    @ms_vendor.current_step = session[:ms_vendor_step]
  end

  def vendor_types
    @ms_vendor_types = MsVendorType.vendor_type_id
  end

  def validity_step
    if params[:back_button]
      @ms_vendor.previous_step
      session[:ms_vendor_step] = @ms_vendor.current_step
    elsif @ms_vendor.valid?
      # if @ms_vendor.last_step?
      if @ms_vendor.current_step == 'legal_aspect'
        @ms_vendor.save
        # @ms_vendor.update(session[:ms_vendor_params])
      else
        @ms_vendor.next_step
      end
      session[:ms_vendor_step] = @ms_vendor.current_step
    end
  end
  
  def configure_permitted_parameters
    added_attrs = [ 
      { ms_vendor_address_attributes: %i[id ms_vendors_id address_name address city province country postal_code is_active created_by updated_by _destroy] }, 
      { ms_vendor_documents_attributes: %i[id ms_vendors_id document document_name is_active created_by updated_by _destroy] },
      :office_location, :currency, :vendor, :email, :password, :password_confirmation, :remember_me, :website, :fax, :phone_1, :phone_2, :phone_3, 
      :ms_vendor_type_id, :sales_tittle, :sales_name, :sales_job, :sales_phone, :sales_email, :finance_tittle, :finance_name, :finance_job, :finance_phone, 
      :tax_address, :tax_city, :tax_province, :tax_country, :tax_postal_code, :npwp_name, :npwp_number, :doc_npwp, :doc_skt_sppkp, :doc_siup_iut_iui, :doc_tdp, 
      :bank_acc_type, :bank_city, :bank_name, :bank_acc_name, :bank_acc_number, :bank_swift_code, :bank, :vendor_status, :is_active, :created_by, :updated_by, :entity, :doc_ktp]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

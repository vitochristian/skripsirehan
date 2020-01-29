# frozen_string_literal: true

class MsVendors::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  def new
    super
  end

  # POST /resource/password
  def create
    resource = MsVendor.find_by(sales_email: params[:ms_vendor][:sales_email], is_active: true)
    
    if resource.nil?
      resource = resource_class.new
      resource.errors.add(:sales_email, 'Not found')
      self.resource = resource
      render :new
    else
      resource.send_reset_password_instructions
      yield resource if block_given?

      if successfully_sent?(resource)
        respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
      else
        respond_with(resource)
      end
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end

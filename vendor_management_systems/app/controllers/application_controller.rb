class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_action :fix_cas_session, :ensure_loggedin
  before_action :user_access

  protected
  
    def ssl_required?
      Rails.env.production?
    end
    
  private

    def fix_cas_session
      if session[:cas].respond_to?(:with_indifferent_access)
        session[:cas] = session[:cas].with_indifferent_access
      end
    end

    def ensure_loggedin
      if session[:cas].nil? || session[:cas][:user].nil?
        redirect_to(root_path, status: 401)
        # render status: 401, text: "Redirecting to SSO..."
      else
        initialize_user
      end
    end

    def initialize_user
      # condition
    end

    def user_access
      # if session[:cas].present? && params[:controller] != 'authentications' && !access_granted?
      #   redirect_to unauthorized_path
      # end
      if access_granted?
      end
    end

    def access_granted?
      # user = User.find_by_login(session[:cas][:user])
      user = User.find_by_login('admin.vms')
      if Rails.env.production?
        return (user.user_accesses.find_vms_production.vms_active rescue false)
      else
        return (user.user_accesses.find_vms_staging.vms_active rescue false)
      end
    end
end

class InquiriesController < ApplicationController
  def index
  	if current_ms_vendor.vendor == 'admin.vms'
  		redirect_to 'http://localhost:4000/worklists'
  	else
  	end
    @document = current_ms_vendor.account_document.present?
  end
end

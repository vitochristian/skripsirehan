class InquiriesController < ApplicationController
  def index
    @document = current_ms_vendor.account_document.present?
  	@tr_rfq = TrRfq.all
  end
end

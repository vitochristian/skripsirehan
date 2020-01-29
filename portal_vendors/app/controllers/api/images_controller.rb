class Api::ImagesController < ApplicationController
  before_action :authenticate_ms_vendor!, except: [:get, :check_path]
  before_action :vendor_path
  
  def show
    if @path.include?('.pdf')
      send_file @path, :disposition => 'inline', :type => 'application/pdf'
    else
      send_file @path, :disposition => 'inline'
    end
  end

  def get
    if check_api_key
      if @path.include?('.pdf')
        send_file @path, :disposition => 'inline', :type => 'application/pdf'
      else
        send_file @path, :disposition => 'inline'
      end
    else
      render json: {status: 403, error: 'access denied'}
    end
  end

  def check_path
    if @path.present?
      render json: {status: 200, success: 'data found'}
    else
      render json: {status: 404, error: 'not found'}
    end
  end

  private

    def check_api_key
      params[:api_key].present? && params[:api_key] == API_KEY
    end

    def vendor_path
      @path = nil
      unless params[:format] == 'document'
        vendor = MsVendor.find params[:id]

        if params[:format] == 'doc_npwp' && vendor.doc_npwp.present?
          @path = vendor.doc_npwp.path
        elsif params[:format] == 'doc_skt_sppkp' && vendor.doc_skt_sppkp.present?
          @path = vendor.doc_skt_sppkp.path
        elsif params[:format] == 'doc_siup_iut_iui' && vendor.doc_siup_iut_iui.present?
          @path = vendor.doc_siup_iut_iui.path
        elsif params[:format] == 'doc_tdp' && vendor.doc_tdp.present?
          @path = vendor.doc_tdp.path
        elsif params[:format] == 'account_document' && vendor.account_document.present?
          @path = vendor.account_document.path
        elsif params[:format] == 'doc_catalog' && vendor.doc_catalog.present?
          @path = vendor.doc_catalog.path
        elsif params[:format] == 'doc_psp' && vendor.doc_psp.present?
          @path = vendor.doc_psp.path   
        end
      else
        document = MsVendorDocument.find params[:id]

        @path = document.document.path if document.document.present?
      end
    end
end

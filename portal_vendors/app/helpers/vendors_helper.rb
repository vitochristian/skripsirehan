module VendorsHelper

  def get_image(vendor, type)
    file_path = vendor.send(type).path
    if (File.exist?(file_path) && !file_path.include?('tmp') rescue false)
      api_image_path(vendor, type, from: 'portal')
    else
      # "http://10.0.0.171:9100/api/images/#{@vendor.id}?type=doc_npwp"
      ''
    end
  end

  def check_currency
    @ms_vendor.currency.upcase != 'IDR' ? :disabled : false
  end
end

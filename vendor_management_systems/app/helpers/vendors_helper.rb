module VendorsHelper

  def get_image(vendor, type)
    if (File.exist?(vendor.send(type).path) rescue false)
      get_image_vendor_path(vendor, type)
    else
      "#{BASE_URL}/api/images/#{@vendor.id}?format=#{type}"
    end
  end
end

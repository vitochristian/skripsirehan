module ApplicationHelper

  def status_vendor(vendor)
    if vendor == 1
      'Registered'
    elsif vendor == 2
      'Verified'
    else
      'Declined'
    end
  end

  def check_file(vendor_id, type)
    ApiService::CheckFile.new(vendor_id, type).execute
  end
end
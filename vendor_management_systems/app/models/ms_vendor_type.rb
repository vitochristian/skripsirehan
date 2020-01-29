class MsVendorType < ApplicationRecord
  def self.vendor_type_id
    select(:type_name, :id).active_only.map { |p| [p.type_name, p.id] }
  end
end
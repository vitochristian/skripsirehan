class UserAccess < ApplicationRecord
  establish_connection AUTHEN_DB
  self.table_name = "user_accesses"

  belongs_to :user

  scope :find_vms_production, -> { find_by(module_id: 75) }
  scope :find_vms_staging, -> { find_by(module_id: 1127) }

  def vms_active
    self.is_active == true
  end
end

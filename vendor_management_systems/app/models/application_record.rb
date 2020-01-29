class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :active_only, -> { where(is_active: true) }
end

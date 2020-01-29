class User < ApplicationRecord
  establish_connection AUTHEN_DB
  self.table_name = "users"

  has_many :user_accesses
end

# frozen_string_literal: true

class DeviseCreateMsVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :ms_vendors do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      t.string :username
      t.string :vendor
      t.string :website
      t.string :fax
      t.string :phone_1
      t.string :phone_2
      t.string :phone_3
      t.bigint :ms_vendor_type_id
      t.string :sales_tittle
      t.string :sales_name
      t.string :sales_job
      t.string :sales_phone
      t.string :sales_email
      t.string :finance_tittle
      t.string :finance_name
      t.string :finance_job
      t.string :finance_phone
      t.string :finance_email
      t.string :tax_address
      t.string :tax_city
      t.string :tax_province
      t.string :tax_country
      t.string :tax_postal_code
      t.string :npwp_name
      t.string :npwp_number
      t.string :doc_npwp
      t.string :doc_skt_sppkp
      t.string :doc_siup_iut_iui
      t.string :doc_tdp
      t.string :bank_acc_type
      t.string :bank_city
      t.string :bank_name
      t.string :bank_acc_name
      t.string :bank_acc_number
      t.string :bank_swift_code
      t.string :doc_bank
      t.integer :vendor_status
      t.string :reject_reason
      t.boolean :potential_status
      t.string :potential_desc
      t.boolean :oracle_status
      t.boolean :is_active
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps null: false
    end

    add_index :ms_vendors, :email
    add_index :ms_vendors, :reset_password_token
    # add_index :ms_vendors, :confirmation_token,   unique: true
    # add_index :ms_vendors, :unlock_token,         unique: true
  end
end

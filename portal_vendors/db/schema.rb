# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_29_142238) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "ms_items", force: :cascade do |t|
    t.string "name"
    t.string "moq"
    t.string "uom"
    t.string "leadtime"
    t.string "classification"
    t.string "country"
    t.string "factory_number"
    t.string "certification"
    t.integer "tr_category_id"
    t.string "sub_category"
    t.boolean "is_active"
    t.integer "created_by"
    t.integer "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brand"
    t.string "principal"
    t.integer "ms_vendor_id"
  end

  create_table "ms_menus", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "is_active"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "updated_by"
  end

  create_table "ms_role_menus", force: :cascade do |t|
    t.integer "ms_role_id"
    t.integer "ms_menu_id"
    t.boolean "is_active"
    t.integer "created_by"
    t.integer "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ms_roles", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active"
    t.integer "created_by"
    t.integer "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ms_users", force: :cascade do |t|
    t.integer "authen_user_id"
    t.string "login"
    t.string "nik"
    t.string "name"
    t.string "email"
    t.integer "ms_role_id"
    t.boolean "is_active"
    t.integer "created_by"
    t.integer "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ms_vendor_addresses", force: :cascade do |t|
    t.bigint "ms_vendor_id"
    t.string "address_name"
    t.string "address"
    t.string "city"
    t.string "province"
    t.string "country"
    t.string "postal_code"
    t.boolean "is_active"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ms_vendor_documents", force: :cascade do |t|
    t.integer "ms_vendor_id"
    t.string "document"
    t.string "document_name"
    t.boolean "is_active"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ms_vendor_types", force: :cascade do |t|
    t.string "type_name"
    t.string "type_desc"
    t.boolean "is_active"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ms_vendors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "username"
    t.string "vendor"
    t.string "website"
    t.string "fax"
    t.string "phone_1"
    t.string "phone_2"
    t.string "phone_3"
    t.bigint "ms_vendor_type_id"
    t.string "sales_tittle"
    t.string "sales_name"
    t.string "sales_job"
    t.string "sales_phone"
    t.string "sales_email"
    t.string "finance_tittle"
    t.string "finance_name"
    t.string "finance_job"
    t.string "finance_phone"
    t.string "finance_email"
    t.string "office_location"
    t.string "entity"
    t.string "tax_address"
    t.string "tax_city"
    t.string "tax_province"
    t.string "tax_country"
    t.string "tax_postal_code"
    t.string "npwp_name"
    t.string "npwp_number"
    t.string "doc_ktp"
    t.string "doc_npwp"
    t.string "doc_skt_sppkp"
    t.string "doc_siup_iut_iui"
    t.string "doc_tdp"
    t.string "bank_acc_type"
    t.string "bank_city"
    t.string "bank_name"
    t.string "bank_acc_name"
    t.string "bank_acc_number"
    t.string "bank_swift_code"
    t.string "doc_bank"
    t.string "currency"
    t.integer "vendor_status"
    t.string "reject_reason"
    t.boolean "potential_status"
    t.string "potential_desc"
    t.boolean "oracle_status"
    t.string "doc_catalog"
    t.string "doc_psp"
    t.boolean "catalog_status"
    t.boolean "is_active"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_document"
    t.index ["email"], name: "index_ms_vendors_on_email"
    t.index ["reset_password_token"], name: "index_ms_vendors_on_reset_password_token"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.string "cas_ticket"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cas_ticket"], name: "index_sessions_on_cas_ticket"
    t.index ["session_id"], name: "index_sessions_on_session_id"
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "tr_categories", force: :cascade do |t|
    t.string "category"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tr_rfq_submission_dtls", force: :cascade do |t|
    t.integer "offered_qty"
    t.integer "price"
    t.integer "tr_rfq_submission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tr_rfq_submissions", force: :cascade do |t|
    t.string "bidding_types"
    t.text "description"
    t.datetime "need_by_date"
    t.integer "term_of_payment"
    t.string "no_quotation"
    t.string "incoterms"
    t.text "note"
    t.boolean "is_active"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.integer "tr_rfq_id"
  end

  create_table "tr_rfqs", force: :cascade do |t|
    t.integer "ms_vendor_type_id"
    t.text "item_name"
    t.text "delivery_site"
    t.text "note"
    t.text "description"
    t.date "need_by_date"
    t.integer "term_of_payment"
    t.boolean "is_active"
    t.integer "created_by"
    t.integer "updated_by"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "expiration_date"
    t.integer "qty"
    t.string "uom"
    t.string "no_rfq"
  end

  create_table "tr_vendor_categories", force: :cascade do |t|
    t.integer "ms_vendor_id"
    t.integer "tr_category_id"
    t.integer "created_by"
    t.integer "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end

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

ActiveRecord::Schema.define(version: 20180413012444) do

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "company"
    t.string "email"
    t.string "phone"
    t.string "cell"
    t.string "address"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "county"
    t.string "state"
    t.string "country"
    t.string "postal_code"
    t.text "notes"
    t.string "city"
    t.string "street_num"
    t.string "strret_name"
    t.string "title"
    t.integer "user_id"
    t.index ["group_id"], name: "index_contacts_on_group_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "contacts_users", id: false, force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "user_id", null: false
    t.index ["contact_id", "user_id"], name: "index_contacts_users_on_contact_id_and_user_id"
    t.index ["user_id", "contact_id"], name: "index_contacts_users_on_user_id_and_contact_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deals", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id", null: false
    t.index ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id"
    t.index ["user_id", "group_id"], name: "index_groups_users_on_user_id_and_group_id"
  end

  create_table "issues", force: :cascade do |t|
    t.integer "user_id"
    t.integer "property_id"
    t.string "severity"
    t.string "status", default: "REPORTED"
    t.text "comment"
    t.integer "deal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_id"], name: "index_issues_on_deal_id"
    t.index ["property_id"], name: "index_issues_on_property_id"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "property_id"
    t.integer "deal_id"
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_id"], name: "index_posts_on_deal_id"
    t.index ["property_id"], name: "index_posts_on_property_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "rental_rate"
    t.string "price"
    t.string "year_built"
    t.string "building_class"
    t.string "lease_type"
    t.string "overhead_doors"
    t.string "loading_docks"
    t.string "min_divisible"
    t.string "space_use"
    t.string "space_available"
    t.string "date_available"
    t.string "property_type"
    t.string "address"
    t.text "description"
    t.boolean "for_lease"
    t.boolean "for_sale"
    t.string "owner_name"
    t.integer "contact_id"
    t.index ["contact_id"], name: "index_properties_on_contact_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "role"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.integer "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "first_name"
    t.string "last_name"
    t.boolean "employee"
    t.boolean "customer"
    t.string "street_name"
    t.string "street_num"
    t.string "city"
    t.string "county"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

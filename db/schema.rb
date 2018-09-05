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

ActiveRecord::Schema.define(version: 2018_09_05_144501) do

  create_table "account_logins", force: :cascade do |t|
    t.string "ipAddress"
    t.string "loginTime"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_account_logins_on_user_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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

  create_table "addresses", force: :cascade do |t|
    t.string "suite"
    t.string "county"
    t.string "state"
    t.string "country"
    t.string "postal_code"
    t.string "notes"
    t.string "city"
    t.string "street_num"
    t.string "strret_name"
    t.string "zip_code_ext"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
  end

  create_table "addresses_companies", id: false, force: :cascade do |t|
    t.integer "address_id", null: false
    t.integer "company_id", null: false
    t.index ["address_id", "company_id"], name: "index_addresses_companies_on_address_id_and_company_id"
    t.index ["company_id", "address_id"], name: "index_addresses_companies_on_company_id_and_address_id"
  end

  create_table "addresses_contacts", id: false, force: :cascade do |t|
    t.integer "address_id", null: false
    t.integer "contact_id", null: false
    t.index ["address_id", "contact_id"], name: "index_addresses_contacts_on_address_id_and_contact_id"
    t.index ["contact_id", "address_id"], name: "index_addresses_contacts_on_contact_id_and_address_id"
  end

  create_table "addresses_deals", id: false, force: :cascade do |t|
    t.integer "address_id", null: false
    t.integer "deal_id", null: false
    t.index ["address_id", "deal_id"], name: "index_addresses_deals_on_address_id_and_deal_id"
    t.index ["deal_id", "address_id"], name: "index_addresses_deals_on_deal_id_and_address_id"
  end

  create_table "addresses_properties", id: false, force: :cascade do |t|
    t.integer "address_id", null: false
    t.integer "property_id", null: false
    t.index ["address_id", "property_id"], name: "index_addresses_properties_on_address_id_and_property_id"
    t.index ["property_id", "address_id"], name: "index_addresses_properties_on_property_id_and_address_id"
  end

  create_table "cancontacts", force: :cascade do |t|
    t.string "title"
    t.boolean "contacted"
    t.text "notes"
    t.string "name"
    t.string "email"
    t.string "company"
    t.string "address"
    t.string "Fulladdress"
    t.string "phone"
    t.string "cell"
  end

  create_table "cancontacts_canvas", id: false, force: :cascade do |t|
    t.integer "canva_id", null: false
    t.integer "cancontact_id", null: false
    t.index ["cancontact_id", "canva_id"], name: "index_cancontacts_canvas_on_cancontact_id_and_canva_id"
    t.index ["canva_id", "cancontact_id"], name: "index_cancontacts_canvas_on_canva_id_and_cancontact_id"
  end

  create_table "cancontacts_contacts", id: false, force: :cascade do |t|
    t.integer "cancontact_id", null: false
    t.integer "contact_id", null: false
    t.index ["cancontact_id", "contact_id"], name: "index_cancontacts_contacts_on_cancontact_id_and_contact_id"
    t.index ["contact_id", "cancontact_id"], name: "index_cancontacts_contacts_on_contact_id_and_cancontact_id"
  end

  create_table "canvas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "canvas_groups", id: false, force: :cascade do |t|
    t.integer "canva_id", null: false
    t.integer "group_id", null: false
    t.index ["canva_id", "group_id"], name: "index_canvas_groups_on_canva_id_and_group_id"
    t.index ["group_id", "canva_id"], name: "index_canvas_groups_on_group_id_and_canva_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments_mainposts", id: false, force: :cascade do |t|
    t.integer "mainpost_id", null: false
    t.integer "comment_id", null: false
    t.index ["comment_id", "mainpost_id"], name: "index_comments_mainposts_on_comment_id_and_mainpost_id"
    t.index ["mainpost_id", "comment_id"], name: "index_comments_mainposts_on_mainpost_id_and_comment_id"
  end

  create_table "comments_posts", id: false, force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "comment_id", null: false
    t.index ["comment_id", "post_id"], name: "index_comments_posts_on_comment_id_and_post_id"
    t.index ["post_id", "comment_id"], name: "index_comments_posts_on_post_id_and_comment_id"
  end

  create_table "comments_users", id: false, force: :cascade do |t|
    t.integer "comment_id", null: false
    t.integer "user_id", null: false
    t.index ["comment_id", "user_id"], name: "index_comments_users_on_comment_id_and_user_id"
    t.index ["user_id", "comment_id"], name: "index_comments_users_on_user_id_and_comment_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "addres"
    t.string "earnings"
    t.string "rent"
    t.string "sector"
    t.string "age"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "description"
  end

  create_table "companies_contacts", id: false, force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "contact_id", null: false
    t.index ["company_id", "contact_id"], name: "index_companies_contacts_on_company_id_and_contact_id"
    t.index ["contact_id", "company_id"], name: "index_companies_contacts_on_contact_id_and_company_id"
  end

  create_table "companies_deals", id: false, force: :cascade do |t|
    t.integer "deal_id", null: false
    t.integer "company_id", null: false
    t.index ["company_id", "deal_id"], name: "index_companies_deals_on_company_id_and_deal_id"
    t.index ["deal_id", "company_id"], name: "index_companies_deals_on_deal_id_and_company_id"
  end

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
    t.integer "role"
    t.boolean "verified"
    t.string "web_address"
    t.string "zip_code_ext"
    t.string "facility_size"
    t.string "latitude"
    t.string "year_of_Founding"
    t.string "owns_cents"
    t.string "primary_industry"
    t.string "sic"
    t.string "longitude"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "suffix"
    t.string "postion"
    t.string "type"
    t.string "prefix"
    t.string "total_number_of_employees"
    t.string "suite"
    t.string "Fulladdress"
    t.string "page_url"
    t.string "fax"
    t.string "personal_email"
    t.index ["group_id"], name: "index_contacts_on_group_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "contacts_deals", id: false, force: :cascade do |t|
    t.integer "deal_id", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id", "deal_id"], name: "index_contacts_deals_on_contact_id_and_deal_id"
    t.index ["deal_id", "contact_id"], name: "index_contacts_deals_on_deal_id_and_contact_id"
  end

  create_table "contacts_groups", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id", "group_id"], name: "index_contacts_groups_on_contact_id_and_group_id"
    t.index ["group_id", "contact_id"], name: "index_contacts_groups_on_group_id_and_contact_id"
  end

  create_table "contacts_leads", id: false, force: :cascade do |t|
    t.integer "lead_id", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id", "lead_id"], name: "index_contacts_leads_on_contact_id_and_lead_id"
    t.index ["lead_id", "contact_id"], name: "index_contacts_leads_on_lead_id_and_contact_id"
  end

  create_table "contacts_properties", id: false, force: :cascade do |t|
    t.integer "property_id", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id", "property_id"], name: "index_contacts_properties_on_contact_id_and_property_id"
    t.index ["property_id", "contact_id"], name: "index_contacts_properties_on_property_id_and_contact_id"
  end

  create_table "contacts_tasks", id: false, force: :cascade do |t|
    t.integer "task_id", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id", "task_id"], name: "index_contacts_tasks_on_contact_id_and_task_id"
    t.index ["task_id", "contact_id"], name: "index_contacts_tasks_on_task_id_and_contact_id"
  end

  create_table "contacts_touches", id: false, force: :cascade do |t|
    t.integer "touch_id", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id", "touch_id"], name: "index_contacts_touches_on_contact_id_and_touch_id"
    t.index ["touch_id", "contact_id"], name: "index_contacts_touches_on_touch_id_and_contact_id"
  end

  create_table "contacts_users", id: false, force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "user_id", null: false
    t.index ["contact_id", "user_id"], name: "index_contacts_users_on_contact_id_and_user_id"
    t.index ["user_id", "contact_id"], name: "index_contacts_users_on_user_id_and_contact_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "author_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_conversations_on_author_id"
    t.index ["receiver_id"], name: "index_conversations_on_receiver_id"
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
    t.boolean "active"
    t.decimal "potential_commission"
    t.integer "lead_id"
    t.string "status"
    t.index ["lead_id"], name: "index_deals_on_lead_id"
  end

  create_table "deals_likes", id: false, force: :cascade do |t|
    t.integer "deal_id", null: false
    t.integer "like_id", null: false
    t.index ["deal_id", "like_id"], name: "index_deals_likes_on_deal_id_and_like_id"
    t.index ["like_id", "deal_id"], name: "index_deals_likes_on_like_id_and_deal_id"
  end

  create_table "deals_maincomments", id: false, force: :cascade do |t|
    t.integer "deal_id", null: false
    t.integer "maincomment_id", null: false
    t.index ["deal_id", "maincomment_id"], name: "index_deals_maincomments_on_deal_id_and_maincomment_id"
    t.index ["maincomment_id", "deal_id"], name: "index_deals_maincomments_on_maincomment_id_and_deal_id"
  end

  create_table "deals_mainposts", id: false, force: :cascade do |t|
    t.integer "mainpost_id", null: false
    t.integer "deal_id", null: false
    t.index ["deal_id", "mainpost_id"], name: "index_deals_mainposts_on_deal_id_and_mainpost_id"
    t.index ["mainpost_id", "deal_id"], name: "index_deals_mainposts_on_mainpost_id_and_deal_id"
  end

  create_table "deals_tasks", id: false, force: :cascade do |t|
    t.integer "task_id", null: false
    t.integer "deal_id", null: false
    t.index ["deal_id", "task_id"], name: "index_deals_tasks_on_deal_id_and_task_id"
    t.index ["task_id", "deal_id"], name: "index_deals_tasks_on_task_id_and_deal_id"
  end

  create_table "deals_users", id: false, force: :cascade do |t|
    t.integer "deal_id", null: false
    t.integer "user_id", null: false
    t.index ["deal_id", "user_id"], name: "index_deals_users_on_deal_id_and_user_id"
    t.index ["user_id", "deal_id"], name: "index_deals_users_on_user_id_and_deal_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "notification"
    t.string "category"
    t.string "attended"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "date_range"
    t.datetime "start"
    t.datetime "end"
    t.string "color"
    t.boolean "all_day_event"
  end

  create_table "events_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.index ["event_id", "user_id"], name: "index_events_users_on_event_id_and_user_id"
    t.index ["user_id", "event_id"], name: "index_events_users_on_user_id_and_event_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "touch_ids"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "groups_tasks", id: false, force: :cascade do |t|
    t.integer "task_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id", "task_id"], name: "index_groups_tasks_on_group_id_and_task_id"
    t.index ["task_id", "group_id"], name: "index_groups_tasks_on_task_id_and_group_id"
  end

  create_table "groups_touches", id: false, force: :cascade do |t|
    t.integer "touch_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id", "touch_id"], name: "index_groups_touches_on_group_id_and_touch_id"
    t.index ["touch_id", "group_id"], name: "index_groups_touches_on_touch_id_and_group_id"
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

  create_table "leads", force: :cascade do |t|
    t.string "name"
    t.string "business"
    t.string "address"
    t.string "email"
    t.string "date"
    t.string "phone"
    t.string "number"
    t.string "size_requirement"
    t.string "location_need"
    t.string "time_requirement"
    t.text "notes"
    t.boolean "active"
    t.integer "contact_id"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.index ["contact_id"], name: "index_leads_on_contact_id"
    t.index ["property_id"], name: "index_leads_on_property_id"
  end

  create_table "leads_tasks", id: false, force: :cascade do |t|
    t.integer "task_id", null: false
    t.integer "lead_id", null: false
    t.index ["lead_id", "task_id"], name: "index_leads_tasks_on_lead_id_and_task_id"
    t.index ["task_id", "lead_id"], name: "index_leads_tasks_on_task_id_and_lead_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes_mainposts", id: false, force: :cascade do |t|
    t.integer "mainpost_id", null: false
    t.integer "like_id", null: false
    t.index ["like_id", "mainpost_id"], name: "index_likes_mainposts_on_like_id_and_mainpost_id"
    t.index ["mainpost_id", "like_id"], name: "index_likes_mainposts_on_mainpost_id_and_like_id"
  end

  create_table "likes_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "like_id", null: false
  end

  create_table "mainposts", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mainposts_users", id: false, force: :cascade do |t|
    t.integer "mainpost_id", null: false
    t.integer "user_id", null: false
    t.index ["mainpost_id", "user_id"], name: "index_mainposts_users_on_mainpost_id_and_user_id"
    t.index ["user_id", "mainpost_id"], name: "index_mainposts_users_on_user_id_and_mainpost_id"
  end

  create_table "personal_messages", force: :cascade do |t|
    t.text "body"
    t.integer "conversation_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_personal_messages_on_conversation_id"
    t.index ["user_id"], name: "index_personal_messages_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.integer "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "property_id"
    t.integer "deal_id"
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "utf8"
    t.string "authenticity_token"
    t.string "post"
    t.index ["deal_id"], name: "index_posts_on_deal_id"
    t.index ["property_id"], name: "index_posts_on_property_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "projected_start_time"
    t.datetime "projected_finish_time"
    t.datetime "actual_start_time"
    t.datetime "actual_finshed_time"
    t.string "staffing"
    t.string "resources"
    t.string "requirements"
    t.boolean "development"
    t.boolean "maintenance"
    t.boolean "technology"
    t.boolean "business"
    t.decimal "budget"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean "closed"
  end

  create_table "projects_steps", id: false, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "step_id", null: false
    t.index ["project_id", "step_id"], name: "index_projects_steps_on_project_id_and_step_id"
    t.index ["step_id", "project_id"], name: "index_projects_steps_on_step_id_and_project_id"
  end

  create_table "projects_tasks", id: false, force: :cascade do |t|
    t.integer "task_id", null: false
    t.integer "project_id", null: false
    t.index ["project_id", "task_id"], name: "index_projects_tasks_on_project_id_and_task_id"
    t.index ["task_id", "project_id"], name: "index_projects_tasks_on_task_id_and_project_id"
  end

  create_table "projects_teams", id: false, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "team_id", null: false
    t.index ["project_id", "team_id"], name: "index_projects_teams_on_project_id_and_team_id"
    t.index ["team_id", "project_id"], name: "index_projects_teams_on_team_id_and_project_id"
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
    t.string "county"
    t.string "zip_code"
    t.string "type_ofproperty"
    t.string "known_as"
    t.string "size_and_floors"
    t.text "space1"
    t.text "space2"
    t.text "space3"
    t.text "space4"
    t.text "space5"
    t.text "space6"
    t.string "rental_per_sf"
    t.string "cam_per_sf"
    t.string "cam"
    t.string "utilites_per_sf"
    t.string "taxes_per_sf"
    t.text "rental_includes"
    t.text "cleaning"
    t.text "electric"
    t.string "gross_rental_per_sf"
    t.string "escalations"
    t.string "parking"
    t.string "landlords_work"
    t.string "possession"
    t.string "lease_term"
    t.boolean "exclusive"
    t.text "add_comments"
    t.string "contact_person"
    t.text "availability"
    t.string "water_and_sewer"
    t.string "Fulladdress"
  end

  create_table "properties_tasks", id: false, force: :cascade do |t|
    t.integer "property_id", null: false
    t.integer "task_id", null: false
    t.index ["property_id", "task_id"], name: "index_properties_tasks_on_property_id_and_task_id"
    t.index ["task_id", "property_id"], name: "index_properties_tasks_on_task_id_and_property_id"
  end

  create_table "recurring_events", force: :cascade do |t|
    t.string "title"
    t.date "anchor"
    t.integer "frequency", limit: 1, default: 0
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "start_time"
    t.datetime "finsh_time"
    t.datetime "started_time"
    t.datetime "finshed_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.boolean "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "personal"
  end

  create_table "tasks_teams", id: false, force: :cascade do |t|
    t.integer "task_id", null: false
    t.integer "team_id", null: false
    t.index ["task_id", "team_id"], name: "index_tasks_teams_on_task_id_and_team_id"
    t.index ["team_id", "task_id"], name: "index_tasks_teams_on_team_id_and_task_id"
  end

  create_table "tasks_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "task_id", null: false
    t.index ["task_id", "user_id"], name: "index_tasks_users_on_task_id_and_user_id"
    t.index ["user_id", "task_id"], name: "index_tasks_users_on_user_id_and_task_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams_users", id: false, force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "user_id", null: false
    t.index ["team_id", "user_id"], name: "index_teams_users_on_team_id_and_user_id"
    t.index ["user_id", "team_id"], name: "index_teams_users_on_user_id_and_team_id"
  end

  create_table "touches", force: :cascade do |t|
    t.boolean "email"
    t.boolean "phone"
    t.boolean "postcard"
    t.boolean "social_media"
    t.boolean "in_person"
    t.boolean "letter"
    t.text "description"
    t.integer "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group_name"
    t.string "group_id"
    t.index ["contact_id"], name: "index_touches_on_contact_id"
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
    t.string "theme"
    t.datetime "last_seen_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

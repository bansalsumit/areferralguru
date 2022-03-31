# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_31_100917) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "cash_rewards", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "discount_type"
    t.integer "discount"
    t.string "program"
    t.bigint "shop_id"
    t.boolean "all_products_allowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_cash_rewards_on_shop_id"
  end

  create_table "coupon_rewards", force: :cascade do |t|
    t.integer "discount"
    t.string "discount_type"
    t.integer "coupon_expiry"
    t.string "title"
    t.string "description"
    t.bigint "shop_id"
    t.string "program"
    t.boolean "all_products_allowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_coupon_rewards_on_shop_id"
  end

  create_table "custom_rewards", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "shop_id"
    t.string "program"
    t.boolean "all_products_allowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_custom_rewards_on_shop_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "country"
    t.boolean "active"
    t.bigint "shop_id"
    t.string "source"
    t.string "source_id"
    t.string "province"
    t.string "zipcode"
    t.boolean "accept_marketing"
    t.integer "orders_count"
    t.decimal "total_spent"
    t.string "tags"
    t.boolean "referral_email_sent"
    t.datetime "referral_email_sent_at"
    t.boolean "successful_advocate"
    t.integer "total_referral"
    t.decimal "total_earnings"
    t.string "unique_link"
    t.string "marketing_opt_in_level"
    t.string "sms_marketing_consent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_customers_on_shop_id"
    t.index ["unique_link"], name: "index_customers_on_unique_link"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "product_collections", force: :cascade do |t|
    t.string "title"
    t.string "handle"
    t.bigint "shop_id"
    t.bigint "reward_eligibility_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reward_eligibility_id"], name: "index_product_collections_on_reward_eligibility_id"
    t.index ["shop_id"], name: "index_product_collections_on_shop_id"
  end

  create_table "product_collections_programs", id: false, force: :cascade do |t|
    t.bigint "product_collection_id", null: false
    t.bigint "program_id", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "advocate_programeable_type"
    t.bigint "advocate_programeable_id"
    t.string "referred_programeable_type"
    t.bigint "referred_programeable_id"
    t.bigint "reward_eligibility_id"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advocate_programeable_type", "advocate_programeable_id"], name: "index_programs_on_advocate_programeable"
    t.index ["referred_programeable_type", "referred_programeable_id"], name: "index_programs_on_referred_programeable"
    t.index ["reward_eligibility_id"], name: "index_programs_on_reward_eligibility_id"
    t.index ["shop_id"], name: "index_programs_on_shop_id"
  end

  create_table "reward_eligibilities", force: :cascade do |t|
    t.integer "minimum_spend"
    t.integer "purchase_review_period"
    t.integer "minimum_successful_conversions"
    t.integer "eligible_purchase"
    t.bigint "reward_eligiable_id"
    t.string "reward_eligiable_type"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_reward_eligibilities_on_shop_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "user_id", null: false
    t.index ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.string "name"
    t.string "domain"
    t.string "province"
    t.string "country"
    t.string "phone"
    t.string "source"
    t.string "customer_email"
    t.string "email"
    t.string "shop_owner"
    t.string "plan_name"
    t.string "plan_display_name"
    t.string "myshopify_domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "access_scopes"
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customers", "shops"
end

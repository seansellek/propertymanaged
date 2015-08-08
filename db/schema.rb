# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150808004416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "author"
    t.string   "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "author_id"
    t.string   "author_type"
  end

  add_index "comments", ["author_type", "author_id"], name: "index_comments_on_author_type_and_author_id", using: :btree
  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree

  create_table "invites", force: :cascade do |t|
    t.string   "email"
    t.integer  "property_id"
    t.integer  "landlord_id"
    t.integer  "tenant_id"
    t.string   "token"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "invites", ["landlord_id"], name: "index_invites_on_landlord_id", using: :btree
  add_index "invites", ["property_id"], name: "index_invites_on_property_id", using: :btree
  add_index "invites", ["tenant_id"], name: "index_invites_on_tenant_id", using: :btree

  create_table "landlords", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
  end

  create_table "occupancy_pictures", force: :cascade do |t|
    t.string   "caption"
    t.boolean  "before"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "property_tenant_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "caption"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "ticket_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "landlord_id"
  end

  add_index "properties", ["landlord_id"], name: "index_properties_on_landlord_id", using: :btree

  create_table "property_tenants", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "tenant_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "active",      default: true
  end

  add_index "property_tenants", ["property_id"], name: "index_property_tenants_on_property_id", using: :btree
  add_index "property_tenants", ["tenant_id"], name: "index_property_tenants_on_tenant_id", using: :btree

  create_table "tenants", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "title"
    t.text     "description"
    t.boolean  "status",             default: true
    t.integer  "property_tenant_id"
  end

  add_index "tickets", ["property_tenant_id"], name: "index_tickets_on_property_tenant_id", using: :btree

  add_foreign_key "invites", "landlords"
  add_foreign_key "invites", "properties"
  add_foreign_key "invites", "tenants"
  add_foreign_key "occupancy_pictures", "property_tenants"
  add_foreign_key "pictures", "tickets"
  add_foreign_key "properties", "landlords"
  add_foreign_key "property_tenants", "properties"
  add_foreign_key "property_tenants", "tenants"
  add_foreign_key "tickets", "property_tenants"
end

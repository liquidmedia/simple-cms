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

ActiveRecord::Schema.define(version: 2013_12_12_213051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pages_users", id: false, force: :cascade do |t|
    t.integer "page_id", null: false
    t.integer "user_id", null: false
  end

  create_table "simple_cms_files", id: :serial, force: :cascade do |t|
    t.string "upload_file_name"
    t.string "upload_content_type"
    t.bigint "upload_file_size"
    t.datetime "upload_updated_at"
    t.integer "folder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simple_cms_pages", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "content"
    t.string "url"
    t.string "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "locale"
    t.string "full_url"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

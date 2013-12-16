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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131212213051) do

  create_table "pages_users", :id => false, :force => true do |t|
    t.integer "page_id", :null => false
    t.integer "user_id", :null => false
  end

  create_table "simple_cms_files", :force => true do |t|
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.integer  "folder_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "simple_cms_pages", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.string   "url"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "locale"
    t.string   "full_url"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "admin",      :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

end

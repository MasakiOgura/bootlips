# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090401063235) do

  create_table "authorities", :force => true do |t|
    t.integer  "authority_id",   :null => false
    t.string   "authority_name", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tasks", :force => true do |t|
    t.string   "name",           :null => false
    t.string   "memo"
    t.integer  "list_id",        :null => false
    t.integer  "user_id",        :null => false
    t.integer  "tag_id"
    t.date     "due"
    t.integer  "task_status_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["user_id"], :name => "fk_task_users"

  create_table "user_statuses", :force => true do |t|
    t.integer  "status_id",   :null => false
    t.string   "status_name", :null => false
    t.string   "image_path",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.integer  "authority_id",                                             :null => false
    t.integer  "user_status_id"
  end

  add_index "users", ["authority_id"], :name => "fk_user_authorities"
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["user_status_id"], :name => "fk_user_user_statuses"

end

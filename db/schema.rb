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

ActiveRecord::Schema.define(version: 20170822040036) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "zipCode"
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "gia"
    t.string   "ibge"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean  "active"
    t.string   "cnpj"
    t.string   "company_name"
    t.string   "trade_name"
    t.integer  "company_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "address_id"
    t.index ["address_id"], name: "index_companies_on_address_id", using: :btree
    t.index ["company_type_id"], name: "index_companies_on_company_type_id", using: :btree
  end

  create_table "company_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "active"
    t.boolean  "licensor"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "conditional_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "conditional_id"
    t.integer  "conditional_status_id"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["conditional_id"], name: "index_conditional_histories_on_conditional_id", using: :btree
    t.index ["conditional_status_id"], name: "index_conditional_histories_on_conditional_status_id", using: :btree
    t.index ["user_id"], name: "index_conditional_histories_on_user_id", using: :btree
  end

  create_table "conditional_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "conditional_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "conditionals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.string   "due_date"
    t.integer  "document_id"
    t.integer  "conditional_status_id"
    t.integer  "conditional_type_id"
    t.integer  "recurrence_type_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["conditional_status_id"], name: "index_conditionals_on_conditional_status_id", using: :btree
    t.index ["conditional_type_id"], name: "index_conditionals_on_conditional_type_id", using: :btree
    t.index ["document_id"], name: "index_conditionals_on_document_id", using: :btree
    t.index ["recurrence_type_id"], name: "index_conditionals_on_recurrence_type_id", using: :btree
  end

  create_table "content_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "documents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.string   "file_path"
    t.date     "issue_date"
    t.date     "due_date"
    t.integer  "folder_id"
    t.integer  "content_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["content_type_id"], name: "index_documents_on_content_type_id", using: :btree
    t.index ["folder_id"], name: "index_documents_on_folder_id", using: :btree
  end

  create_table "enterprise_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "enterprises", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "active"
    t.integer  "enterprise_type_id"
    t.integer  "address_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["address_id"], name: "index_enterprises_on_address_id", using: :btree
    t.index ["enterprise_type_id"], name: "index_enterprises_on_enterprise_type_id", using: :btree
  end

  create_table "evidence_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "evidences", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.date     "file_date"
    t.string   "file_path"
    t.string   "number"
    t.integer  "task_id"
    t.integer  "evidence_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["evidence_type_id"], name: "index_evidences_on_evidence_type_id", using: :btree
    t.index ["task_id"], name: "index_evidences_on_task_id", using: :btree
  end

  create_table "features", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "folders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.string   "number"
    t.boolean  "active"
    t.integer  "enterprise_id"
    t.integer  "feature_id"
    t.integer  "phase_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["enterprise_id"], name: "index_folders_on_enterprise_id", using: :btree
    t.index ["feature_id"], name: "index_folders_on_feature_id", using: :btree
    t.index ["phase_id"], name: "index_folders_on_phase_id", using: :btree
  end

  create_table "phases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "priorities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "recurrence_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "task_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "task_id"
    t.integer  "task_status_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["task_id"], name: "index_task_histories_on_task_id", using: :btree
    t.index ["task_status_id"], name: "index_task_histories_on_task_status_id", using: :btree
    t.index ["user_id"], name: "index_task_histories_on_user_id", using: :btree
  end

  create_table "task_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.date     "start_date"
    t.date     "due_date"
    t.integer  "conditional_id"
    t.integer  "priority_id"
    t.integer  "task_status_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["conditional_id"], name: "index_tasks_on_conditional_id", using: :btree
    t.index ["priority_id"], name: "index_tasks_on_priority_id", using: :btree
    t.index ["task_status_id"], name: "index_tasks_on_task_status_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "authentication_token",   limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "companies", "addresses"
  add_foreign_key "companies", "company_types"
  add_foreign_key "conditional_histories", "conditional_statuses"
  add_foreign_key "conditional_histories", "conditionals"
  add_foreign_key "conditional_histories", "users"
  add_foreign_key "conditionals", "conditional_statuses"
  add_foreign_key "conditionals", "conditional_types"
  add_foreign_key "conditionals", "documents"
  add_foreign_key "conditionals", "recurrence_types"
  add_foreign_key "documents", "content_types"
  add_foreign_key "documents", "folders"
  add_foreign_key "enterprises", "addresses"
  add_foreign_key "enterprises", "enterprise_types"
  add_foreign_key "evidences", "evidence_types"
  add_foreign_key "evidences", "tasks"
  add_foreign_key "folders", "enterprises"
  add_foreign_key "folders", "features"
  add_foreign_key "folders", "phases"
  add_foreign_key "task_histories", "task_statuses"
  add_foreign_key "task_histories", "tasks"
  add_foreign_key "task_histories", "users"
  add_foreign_key "tasks", "conditionals"
  add_foreign_key "tasks", "priorities"
  add_foreign_key "tasks", "task_statuses"
end

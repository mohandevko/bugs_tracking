# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 5) do

  create_table "bugs", :force => true do |t|
    t.column "title",       :string
    t.column "description", :string
    t.column "status",      :string
    t.column "project_id",  :integer
    t.column "user_id",     :integer
  end

  create_table "comments", :force => true do |t|
    t.column "description", :string
    t.column "bug_id",      :integer
    t.column "user_id",     :integer
  end

  create_table "projects", :force => true do |t|
    t.column "title",       :string
    t.column "description", :string
  end

  create_table "userprojects", :force => true do |t|
    t.column "user_id",    :integer
    t.column "project_id", :integer
  end

  create_table "users", :force => true do |t|
    t.column "name",        :string
    t.column "designation", :string
  end

end

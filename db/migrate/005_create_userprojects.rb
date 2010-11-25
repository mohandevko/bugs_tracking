class CreateUserprojects < ActiveRecord::Migration
  def self.up
    create_table :userprojects do |t|
    t.column :user_id, :integer
    t.column :project_id, :integer
    end
  end

  def self.down
    drop_table :userprojects
  end
end

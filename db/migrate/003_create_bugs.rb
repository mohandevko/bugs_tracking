class CreateBugs < ActiveRecord::Migration
  def self.up
    create_table :bugs do |t|
    	t.column :title, :string
    	t.column :description, :string
    	t.column :status,:string
    	t.column :project_id, :integer
    	t.column :user_id, :integer
    end
  end

  def self.down
    drop_table :bugs
  end
end

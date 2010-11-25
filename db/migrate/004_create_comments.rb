class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
    	t.column :description, :string
    	t.column :bug_id, :integer
    	t.column :user_id, :integer
    end
  end

  def self.down
    drop_table :comments
  end
end

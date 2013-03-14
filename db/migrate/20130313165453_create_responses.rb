class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text  :content, :null => false
      t.integer :respondable_id, :null => false
      t.string  :respondable_type, :null => false

      t.timestamps
    end
  end
end

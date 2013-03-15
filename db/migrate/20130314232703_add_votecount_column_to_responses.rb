class AddVotecountColumnToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :vote_count, :integer, :default => 0
  end
end

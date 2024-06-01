class AddNtrpRankingToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :ntrp_ranking, :float
    add_column :users, :location, :string
  end
end

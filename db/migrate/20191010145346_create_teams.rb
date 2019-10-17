class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams, id: false do |t|
      t.string :uid, null: false, limit: 20, primary_key: true
      t.string :name, null: false

      t.timestamps
    end

    add_index :teams, :uid, unique: true
  end
end

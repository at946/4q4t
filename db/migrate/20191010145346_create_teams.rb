class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :uid, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_index :teams, :uid, unique: true
  end
end

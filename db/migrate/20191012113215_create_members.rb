class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members, id: false do |t|
      t.references :team, null: false, type: :string, limit: 20, primary_key: :uid
      t.string :uid, null: false, limit: 20, primary_key: true
      t.string :name, null: false
      t.string :ans_q1, array: true
      t.string :ans_q2, array: true
      t.string :ans_q3, array: true
      t.string :ans_q4, array: true

      t.timestamps
    end

    add_index :members, :uid, unique: true
    add_index :members, :ans_q1, using: 'gin'
    add_index :members, :ans_q2, using: 'gin'
    add_index :members, :ans_q3, using: 'gin'
    add_index :members, :ans_q4, using: 'gin'

  end
end

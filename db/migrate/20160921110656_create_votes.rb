class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :voteable, polymorphic: true, index: true
      t.references :user, null: false
      t.boolean :status

      t.timestamps
    end
  end
end

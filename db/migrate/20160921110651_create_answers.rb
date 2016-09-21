class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer, null: false
      t.references :question, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end

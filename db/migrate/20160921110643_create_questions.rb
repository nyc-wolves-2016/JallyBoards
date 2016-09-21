class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_title, null: false
      t.string :question_body, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end

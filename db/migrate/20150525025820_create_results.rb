class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.boolean :correct, null: true, default: false

      t.references :exam, index: true
      t.references :question, index: true
      t.references :answer, index: true

      t.timestamps null: false
    end
    add_foreign_key :results, :exams
    add_foreign_key :results, :questions
    add_foreign_key :results, :answers
  end
end

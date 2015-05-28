class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :name
      t.integer :mark
      t.boolean :done, default: false
      t.references :category, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :exams, :users
    add_foreign_key :exams, :categories
  end
end

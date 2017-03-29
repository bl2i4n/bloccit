class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.string :resolved
      t.string :boolean

      t.timestamps null: false
    end
  end
end

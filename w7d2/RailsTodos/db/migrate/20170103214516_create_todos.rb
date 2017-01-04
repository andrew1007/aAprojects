class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :title, presence: true
      t.string :body, presence: true
      t.boolean :done, presence: true
      t.timestamps
    end
  end
end

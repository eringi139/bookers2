class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.text :title
      t.text :body
      t.text :user_id
      t.timestamps
    end
  end
end

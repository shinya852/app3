class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      #定義
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end

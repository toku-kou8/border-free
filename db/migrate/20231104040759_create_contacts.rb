class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :name_kana, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end

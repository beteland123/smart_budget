class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :name
      t.decimal :amount
      t.references :category, null: false, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

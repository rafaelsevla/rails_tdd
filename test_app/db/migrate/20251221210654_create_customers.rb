class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.boolean :vip, default: false, null: false
      t.integer :days_to_pay

      t.timestamps
    end
  end
end

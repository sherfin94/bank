class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.date :payment_date
      t.float :beginning_balance
      t.float :principal_payment
      t.float :total_payment
      t.float :ending_balance

      t.timestamps
    end
  end
end

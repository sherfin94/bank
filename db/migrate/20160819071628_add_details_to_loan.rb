class AddDetailsToLoan < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :status, :boolean
  end
end

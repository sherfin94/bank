class ChangeTypeOfLoanStatusToString < ActiveRecord::Migration[5.0]
  def change
    change_column :loans, :status, :string
  end
end

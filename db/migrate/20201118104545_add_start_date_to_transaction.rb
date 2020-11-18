class AddStartDateToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :start_date, :date
  end
end

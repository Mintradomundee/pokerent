class AddEndDateToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :end_date, :date
  end
end

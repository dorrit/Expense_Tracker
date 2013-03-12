class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.column :date, :date
      t.column :description, :string
      t.column :amount, :decimal, :precision => 8, :scale => 2
      t.column :vendor_id, :integer
      t.column :category_id, :integer

      t.timestamps
    end
  end
end
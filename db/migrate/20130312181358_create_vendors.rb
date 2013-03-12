class CreateVendors < ActiveRecord::Migration
   def change
    create_table :vendors do |t|
      t.column :company, :string
      
      t.timestamps
    end
  end
end

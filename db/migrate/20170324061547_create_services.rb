class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
    	t.string :name, :limit => 20
    	t.integer :products 

      t.timestamps
    end
  end
end

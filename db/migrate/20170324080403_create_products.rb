class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
    	t.integer :service_id
    	t.string :name
    	t.integer :platforms

      t.timestamps
    end
    
  end  
end

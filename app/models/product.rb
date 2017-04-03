class Product < ApplicationRecord

	belongs_to :service

	def self.to_csv(options = {})
		desired_columns = ["name", "platforms"]
	  CSV.generate(options) do |csv|
	    csv << desired_columns
	    all.each do |product|
	      csv << product.attributes.values_at(*desired_columns)
	    end
	  end
	end

end

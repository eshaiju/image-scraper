class Store < ActiveRecord::Base
	def self.save_data page_url
		@store = Store.find_by_url(page_url)
		if @store
			@store.count +=1
	    else
	    	@store = Store.new
	    	@store.url = page_url
		end
		@store.save
    end
end

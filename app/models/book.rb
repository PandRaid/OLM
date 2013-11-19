class Book < ActiveRecord::Base
	validates_presence_of :title, :on => :create
	validates_presence_of :author, :on => :create
	validates_presence_of :book, :on => :create
	validates_presence_of :cover, :on => :create

	def self.search_title(search)
		if search
			find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end

	def self.search_author(search)
		if search
			find(:all, :conditions => ['author LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end
end

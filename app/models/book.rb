class Book < ActiveRecord::Base
	validates_presence_of :title, :on => :create
	validates_presence_of :author, :on => :create
	validates_presence_of :book, :on => :create
	validates_presence_of :cover, :on => :create
end

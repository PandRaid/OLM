class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :first_name, :on => :create
	validates_presence_of :last_name, :on => :create
	validates_presence_of :zip, :on => :create
	validates_presence_of :username, :on => :create
	validates_presence_of :email, :on => :create
	validates_length_of :last_name, :maximum => 30, :message => "last name to long!"
	validates_length_of :first_name, :maximum => 15, :message => "first name to long!"
	validates_length_of :username, :within => 6..20, :too_long => "pick a shorter name", :too_short => "pick a longer name"
    validates_length_of :zip, :minimum => 5, :too_short => "please enter at least 5 characters"
    validates_length_of :password, :minimum => 8 ,:maximum => 32, :within => 8..32,:too_short => 'way too short', :too_long => 'way to long'
    validates_uniqueness_of :username, :email, :case_sensitive => false
end

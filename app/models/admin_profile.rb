class AdminProfile < ActiveRecord::Base
	validates :email, presence: true
end

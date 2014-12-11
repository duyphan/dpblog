class User < ActiveRecord::Base
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :email, presence: true


	has_many :articles, :dependent => :destroy

	def name
    [firstname, lastname].join(' ')
  end
end

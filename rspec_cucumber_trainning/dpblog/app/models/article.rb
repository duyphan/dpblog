class Article < ActiveRecord::Base
	validates :title, presence: true

	def self.by_letter(letter) 
		where("title LIKE ?", "#{letter}%").order(:title) 
	end
end

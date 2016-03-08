class Domain < ActiveRecord::Base
	belongs_to :course
	has_many :skills

	extend FriendlyId
	friendly_id :title, use: :slugged

	#A method to retrieve all the unlocked games within a domain for a certain student
	def unlocked_games(student)
		games = Array.new
		unlocked_games = Array.new
		skills = self.skills
		games = student.games
		games.each do |game|
			if game.primary_skill.in?(skills)
				unlocked_games << game
			else
				if game.secondary_skill.in?(skills)
					unlocked_games << game
				end
			end
		end
		unlocked_games
	end
end

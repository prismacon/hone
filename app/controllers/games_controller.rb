class GamesController < ApplicationController
	before_action :authenticate_developer!

	def new
		@skill = Skill.friendly.find(params[:skill])
		@game = Game.new
	end

	def create
		@skill = Skill.find_by_id(params[:id])
		@game = Game.create(game_params)
		if @game.save
			flash[:notice] = "Game Added"
				redirect_to @game.primary_skill
		else
			flash[:notice] = "Please fill all paramaters"
			redirect_to :action => 'new', :id => game_params[:primary_skill_id]
		end
	end

	private
	def game_params
	params.require(:game).permit(:title, :description, :link, :passing_score, :platform,
		:primary_skill_id, :secondary_skill_id)
	end
end

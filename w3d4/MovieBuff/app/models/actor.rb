class Actor < ActiveRecord::Base
	has_many :castings
	#primary id
	#foreign actor_id
	# class_name = "Casting"


	has_many :movies, through: :castings
	has_many :directed_movies,
		foreign_key: :director_id,
		class_name: "Movie"

end

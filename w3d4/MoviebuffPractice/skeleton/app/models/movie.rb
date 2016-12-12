class Movie < ActiveRecord::Base

	has_many :castings,
	primary_key: :id,
	foreign_key: :movie_id,
	class_name: :Casting

	has_many :actors,
	through: :castings,
	source: :actors
end

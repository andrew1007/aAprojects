class Actor < ActiveRecord::Base

	has_many :castings,
	primary_key: :id,
	foreign_key: :actor_id,
	class_name: :Casting

	has_many :movies,
	through: :castings,
	source: :movies
end

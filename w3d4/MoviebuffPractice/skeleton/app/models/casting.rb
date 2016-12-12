class Casting < ActiveRecord::Base

	belongs_to :movies,
	primary_key: :id,
	foreign_key: :move_id,
	class_name: :Movie

	belongs_to :actors,
	primary_key: :id,
	foreign_key: :actor_id,
	class_name: :Casting
end

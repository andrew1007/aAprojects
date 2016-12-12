def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  actor_count = those_actors.length
  Movie
    .select("movies.id, title")
    .joins(:actors)
    .where("actors.name IN (?)", those_actors)
    .group("movies.id")
    .having("COUNT(*) = ?", actor_count)
end

def golden_age
  # Find the decade with the highest average movie score.
  x = Movie.select("AVG(score) AS average_score, yr / 10 * 10 AS decade").group("yr / 10 * 10").order("average_score DESC").limit(1)
end

def costars(name)
  # List the names of the actors that the named actor has ever appeared with.
  # Hint: use a subquery

end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie

end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the letters in whazzername,
  # ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but not like "stallone sylvester" or "zylvester ztallone"

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of their career.

end
#
# <<-SQL
# SELECT AVG(score) AS average_score, yr / 10 * 10 AS decade
# FROM movies
# GROUP BY yr / 10 * 10
# ORDER BY average_score DESC
# LIMIT 1
# SQL
# pluck(decade)

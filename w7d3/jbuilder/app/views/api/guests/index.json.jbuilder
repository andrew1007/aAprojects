
json.array! @guests do |person|
  json.partial! 'api/guests/guest', guest: person
end

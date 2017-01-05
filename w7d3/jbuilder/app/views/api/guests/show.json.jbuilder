# json.extract! @guest, :gifts
json.partial! 'api/guests/guest', guest: @guest
json.gifts do
  json.array! @guest.gifts do |person_gift|
    json.title person_gift.title
    json.description person_gift.description
  end
end

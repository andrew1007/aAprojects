# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# x=User.create(email:'andrew1007@gmail.com')
# y=User.create(email: '1')
# z=User.create(email: '2')
# a=User.create(email: '3')
# b=User.create(email: '4')
# c=User.create(email: '5')


d=ShortenedUrl.create_for_user_and_long_url!("1" , '123456789')
e=ShortenedUrl.create_for_user_and_long_url!("2" , '12345678')
f=ShortenedUrl.create_for_user_and_long_url!("3" ,'1234567')
g=ShortenedUrl.create_for_user_and_long_url!("4" ,'1234567')

# Visit.record_visit!(x, d)
# Visit.record_visit!(y, d)
# Visit.record_visit!(b, f)
# Visit.record_visit!(c, f)
# Visit.record_visit!(a, g)
# Visit.record_visit!(y, d)
# Visit.record_visit!(y, d)
# Visit.record_visit!(y, d)
# Visit.record_visit!(y, d)

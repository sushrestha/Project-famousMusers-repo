# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




Muser.create(email: "abc@xyz.com",
             password_digest: "password",
             password_confirmation: "password",
             isModerator: false,
#             activated: true,
 #            activated_at: Time.zone.now
	)

Musing.create( muser_id: 1,
				title: 'Title 1',
			   content: 'This is content 1.',
			   isPrivate: 0,
			   stars: Rating.create([
			   	{stars: 2, musing_id: 1},
			   	{stars: 4, musing_id: 1}
			   	])

	)
Musing.create( title: 'Title 2',
			   content: 'This is content 2.',
			   isPrivate: 1,
 				stars: Rating.create([
			   	{stars: 1, musing_id: 2},
			   	{stars: 5, musing_id: 2}
			   	])
	)
Musing.create( title: 'Title 3',
			   content: 'This is content 3.',
			   isPrivate: 0,
 				stars: Rating.create([
			   	{stars: 1, musing_id: 3},
			   	{stars: 2, musing_id: 3},
			   	{stars: 3, musing_id: 3},
			   	{stars: 4, musing_id: 3},
			    {stars: 5, musing_id: 3}
			   	])
	)
Musing.create( title: 'Title 4',
			   content: 'This is content 4.',
			   isPrivate: 0
	)
Musing.create( title: 'Title 5',
			   content: 'This is content 5.',
			   isPrivate: 1
	)
Musing.create( title: 'Title 6',
			   content: 'This is content 6.',
			   isPrivate: 0
	)
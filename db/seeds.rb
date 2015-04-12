# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

first = Muser.create( email: 'fake4@fake.com',
              name: 'bob',
              password: 'password',
              isModerator: 'f')
              
second = Muser.create( email: 'fake3@fake.com',
              name: 'alice',
              password: 'password',
              isModerator: 'f')

@myMessage = Message.create( content: 'test message',
                             author_id: first.id,
                             recipient_id: second.id)           

Musing.create( title: 'Title 1',
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
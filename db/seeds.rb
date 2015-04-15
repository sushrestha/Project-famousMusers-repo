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


Muser.create(email: 'abc@xyz.com',
			 name: 'abc',
             password_digest: 'password',
             isModerator: 'f'
	)

Musing.create( muser_id: first.id,
				title: 'Title 1',
			   content: 'This is content 1.',
			   isPrivate: 0,
			   stars: Rating.create([
			   	{stars: 2, musing_id: 1, muser_id: second.id}
			   	])

	)
Musing.create( muser_id: second.id,
			   title: 'Title 2',
			   content: 'This is content 2.',
			   isPrivate: 1,
 				stars: Rating.create([
			   	{stars: 1, musing_id: 2, muser_id: first.id}
			   	])
	)
# Following relationships
#musers = Muser.all
#muser  = musers.first
#following = musers[2]
#followers = musers[2]
#following.each { |followed| muser.follow(followed) }
#followers.each { |follower| follower.follow(muser) }

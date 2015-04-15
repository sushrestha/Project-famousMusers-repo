# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


muser1 = Muser.create( email: 'fake1@fake.com',
              name: 'bob',
              password: 'password',
              isModerator: 'f')
              
muser2 = Muser.create( email: 'fake2@fake.com',
              name: 'alice',
              password: 'password',
              isModerator: 'f')          

muser3 = Muser.create( email: 'abc@xyz.com',
             name: 'abc',
             password: 'password',
             isModerator: 'f')

@myMessage = Message.create( content: 'test message',
                             author_id: muser1.id,
                             recipient_id: muser2.id) 
	
rating1 = Rating.create([
          {stars: 2, musing_id: 1},
          {stars: 4, musing_id: 2}
          ])
          
rating2 = Rating.create([
          {stars: 1, musing_id: 1},
          {stars: 5, musing_id: 2}
          ])
          
rating3 = Rating.create([
          {stars: 1, musing_id: 1},
          {stars: 2, musing_id: 2},
          {stars: 3, musing_id: 3}
          ])
          
compRating1 = CompetitionRating.create([
            {competitionstars: 1, musing_id: 1, competition_id: 1},
            {competitionstars: 3, musing_id: 2, competition_id: 1},
            {competitionstars: 5, musing_id: 3, competition_id: 1}
            ])
            
compRating2 = CompetitionRating.create([
            {competitionstars: 1, musing_id: 1, competition_id: 2},
            {competitionstars: 3, musing_id: 2, competition_id: 2},
            {competitionstars: 5, musing_id: 3, competition_id: 2}
            ])

musing1 = Musing.create( title: 'Title 1',
			   content: 'This is content 1.',
			   isPrivate: 0,
			   stars: rating1,
			   muser_id: muser1.id)

musing2 = Musing.create( title: 'Title 2',
			   content: 'This is content 2.',
			   isPrivate: 1,
 				 stars: rating2,
         muser_id: muser1.id)
          
musing3 = Musing.create( title: 'Title 3',
			   content: 'This is content 3.',
			   isPrivate: 0,
 				 stars: rating3,
         muser_id: muser1.id)

musing4 = Musing.create( title: 'Title 4',
			   content: 'This is content 4.',
			   isPrivate: 0,
         muser_id: muser1.id)
         
musing5 = Musing.create( title: 'Title 5',
			   content: 'This is content 5.',
			   isPrivate: 1,
         muser_id: muser1.id)
         
musing6 = Musing.create( title: 'Title 6',
			   content: 'This is content 6.',
			   isPrivate: 0,
         muser_id: muser1.id)
	
competition1 = Competition.create( name: 'Most Creative',
                                   start: DateTime.parse("2015-04-01 08:00:00"),
                                   end: DateTime.parse("2015-04-30 11:59:59"),
                                   musings: [])
                                   
#musings: [musing1,musing2,musing3])                                   
                                  
competition2 = Competition.create( name: 'Most Inspiring',
                                   start: DateTime.parse("2015-05-01 08:00:00"),
                                   end: DateTime.parse("2015-05-31 11:59:59"),
                                   musings: [])
                                   
#musings: [musing4,musing5,musing6])                                   



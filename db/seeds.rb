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


          
musing1 = Musing.create( title: 'Inspirational',
         content: 'Start by doing whats necessary; then do whats possible; and suddenly you are doing the impossible',
         isPrivate: 0,
         muser_id: muser1.id)
musing2 = Musing.create( title: 'Hellen Keller',
         content: 'The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart',
         isPrivate: 1,
         muser_id: muser2.id)
          
musing3 = Musing.create( title: 'Vince Lombardi',
         content: 'Perfection is not attainable, but if we chase perfection we can catch excellence',
         isPrivate: 0,
         muser_id: muser1.id)

musing4 = Musing.create( title: 'Jimmy Dean',
         content: 'I cant change the direction of the wind, but I can adjust my sails to always reach my destination',
         isPrivate: 0,
         muser_id: muser1.id)

rating1 = Rating.create([
          {stars: 2, musing_id: 1, muser_id: muser2.id}
          ])         
rating2 = Rating.create([
          {stars: 4, musing_id: 2, muser_id: muser2.id}
          ])          
rating3 = Rating.create([
          {stars: 4, musing_id: 3, muser_id: muser2.id}
          ])


rating4 = Rating.create([
          {stars: 4, musing_id: 1, muser_id: muser1.id}
          ])

rating4 = Rating.create([
          {stars: 4, musing_id: 2, muser_id: muser1.id}
          ])


         

	
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



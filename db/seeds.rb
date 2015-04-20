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
             
muser4 = Muser.create( email: 'francis@old.com',
              name: 'Francis of Assisi',
              password: 'password',
              isModerator: 'f')
              
muser5 = Muser.create( email: 'mayaangelou@gmail.com',
              name: 'Maya Angelou',
              password: 'password',
              isModerator: 'f')

@myMessage = Message.create( content: 'test message',
                             author_id: muser1.id,
                             recipient_id: muser2.id) 
	

          
compRating1 = CompetitionRating.create([
            {competitionstars: 1, musing_id: 1, competition_id: 3},
            {competitionstars: 3, musing_id: 2, competition_id: 3},
            {competitionstars: 5, musing_id: 3, competition_id: 3}
            ])
            
compRating2 = CompetitionRating.create([
            {competitionstars: 1, musing_id: 1, competition_id: 2},
            {competitionstars: 3, musing_id: 2, competition_id: 2},
            {competitionstars: 5, musing_id: 3, competition_id: 2}
            ])

#sindhu

category1 = Category.create( name: 'Journal Entry',
                              desc: 'It is journal Entry')
category2 = Category.create( name: 'Song Lyrics',
                              desc: 'These are lyrics of a song')
category3 = Category.create( name: 'Stories',
                              desc: 'It is a story')
category4 = Category.create( name: 'Jokes',
                              desc: 'It is a joke')
category5 = Category.create( name: 'Rants',
                              desc: 'It is a a tirade')
category5 = Category.create( name: 'Nonsense',
                              desc: 'It has no sense')
category6 = Category.create( name: 'Ramblings',
                              desc: 'Lengthy and degressive')
category7 = Category.create( name: 'Thoughts',
                              desc: 'Ideas')
category8 = Category.create( name: 'Tweets',
                              desc: 'A message')

musing1 = Musing.create( title: 'Priorities',
			   content: "Start by doing what's necessary; then do what's possible; and suddenly you are doing the impossible.",
			   isPrivate: 0,
			   muser_id: muser4.id,
         category_id: category1.id)

musing2 = Musing.create( title: 'Mission',
			   content: "My mission in life is not merely to survive, but to thrive; and to do so with some passion, some compassion, some humor, and some style.",
			   isPrivate: 1,
         muser_id: muser5.id,
         category_id: category1.id)
          
musing3 = Musing.create( title: 'Stolen',
			   content: 'It is one of the blessings of old friends that you can afford to be stupid with them.',
			   isPrivate: 0,
         muser_id: muser1.id)

musing4 = Musing.create( title: 'Jaden',
			   content: "How can mirrors be real if our eyes aren't real",
			   isPrivate: 0,
         muser_id: muser1.id)
         
musing5 = Musing.create( title: 'Everyday',
			   content: 'Wake up? But I just got out of bed yesterday',
			   isPrivate: 1,

         muser_id: muser1.id)
musing6 = Musing.create( title: 'Arthur C. Clarke/Sudden Clarity Clarence',
         content: "Magic is just science you don't know yet",
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
                                  
competition2 = Competition.create( name: 'Most Inspiring',
                                   start: DateTime.parse("2015-05-01 08:00:00"),
                                   end: DateTime.parse("2015-05-31 11:59:59"),
                                   musings: [])                               

competition3 = Competition.create( name: 'Best',
                                   start: DateTime.parse("2015-03-01 08:00:00"),
                                   end: DateTime.parse("2015-03-31 11:59:59"),
                                   musings: [musing1,musing2,musing3])


# Following relationships
#musers = Muser.all
#muser  = musers.first
#following = musers[2]
#followers = musers[2]
#following.each { |followed| muser.follow(followed) }
#followers.each { |follower| follower.follow(muser) }


user1 = User.create(email: 'test@example.com', password: 'password')
user2 = User.create(email: 'test2@example.gov', password: 'password')

post1 = user1.posts.create(title: 'First Post', body: 'This is the first post!')
post2 = user1.posts.create(title: 'Second Post', body: 'This is the second post!')

post3 = user2.posts.create(title: 'Third Post', body: 'This is the third post!')
post4 = user2.posts.create(title: 'Fourth Post', body: 'This is the fourth post!')

post1.comments.create(body: 'This was awesome', user: user1)
post2.comments.create(body: 'The Godfather was a terrible movie', user: user2)
post3.comments.create(body: 'Two thumbs down', user: user1)
post4.comments.create(body: 'Two thumbs meh', user: user2)

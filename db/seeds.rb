user1 = User.create(Name: "Joaquin", email: "joaquin@test.com", password:"peru69")
user2 = User.create(Name: "Esteban", email: "hola@hola.com", password:"mex420")
post = Post.create(Title: "Hola tonto", Text: "Tonto el que no salude", user_id: 1)
comment = Comment.create(Text: "hey tonto", user_id: 1, post_id: 1)

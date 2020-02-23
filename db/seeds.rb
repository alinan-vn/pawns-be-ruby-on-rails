profile_pic_links = [
    'https://d2h1pu99sxkfvn.cloudfront.net/b0/14427198/520907985_m6TUWpNOFG/U5.jpg',
    'https://dev.copalana.net/Images/projects/Project_Demo_2020/637142582733561644.jpeg',
    'https://p16.muscdn.com/img/musically-maliva-obj/1627980188400645~c5_720x720.jpeg',
    'https://i.pinimg.com/originals/7c/de/71/7cde7100b0738d516d1dcbd8364eeeea.jpg'
]

profile_background = [
    'https://d2hhj3gz5jljkm.cloudfront.net/wallpapers2/074/905/225/472/original/47f1e70bd90db25a97f3b761b07764f7f947287e.jpg',
    'https://i.imgur.com/ca5GXkg.jpg'
]

names = ['GOB', 'George', 'Michael', 'Oscar', 'Maebe', 'George Michael', 'Tobias', 'Lucille', 'Bustor', 'Fri', 'Leela', 'Bender', 'the Professor', 'Zoidberg']

# names.each do |name| 
#     User.create(
#         username: name,
#         password: 'guest',
#         elo: rand(800..2200),
#         profile_pic: profile_pic_links.sample,
#         profile_background: profile_background.sample,
#         bio: Faker::Books::Lovecraft.sentence(word_count: 100)
#     )
# end

# User.create(username: 'maebe', password: 'guest', elo: 1200, profile_pic: 'https://d2h1pu99sxkfvn.cloudfront.net/b0/14427198/520907985_m6TUWpNOFG/U5.jpg', profile_background: 'https://d2hhj3gz5jljkm.cloudfront.net/wallpapers2/074/905/225/472/original/47f1e70bd90db25a97f3b761b07764f7f947287e.jpg', bio: 'a lot of bio content. yak yak yak, da da da , si si si si. ni hao')

# 10.times do
#     Article.create(
#         title: Faker::Book.title,
#         content: Faker::Books::Lovecraft.sentence(word_count: 400),
#         date: "#{rand(1..12)}-#{rand(1..30)}-#{rand(2012-2019)}",
#         author: Faker::Book.author
#     )
# end

500.times do 
    AVote.create(
        article: Article.all.sample,
        user: User.all.sample
    )
end

50.times do 
    Comment.create(
        content: Faker::TvShows::RickAndMorty.quote,
        user: User.all.sample,
        article: Article.all.sample
    )
end

50.times do 
    Reply.create(
        content: Faker::TvShows::RickAndMorty.quote,
        user: User.all.sample,
        comment: Comment.all.sample
    )
end
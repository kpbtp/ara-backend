user1 = User.where(email: "testing1@example.com").first_or_create(password: "password", password_confirmation: "password")

user2 = User.where(email: "testing2@example.com").first_or_create(password: "password", password_confirmation: "password")

animes = [
  {
    name: "Attack on Titan",
    year: "2013",
    synopsis: "Humans fight against giant humanoid creatures called Titans.",
    run_time: "24 minutes",
    seasons: 4,
    episodes: 75,
    studio: "Wit Studio",
    genres: "Action, Drama, Fantasy"
  },
  {
    name: "Your Lie in April",
    year: "2014",
    synopsis: "A piano prodigy meets a violinist who changes his life.",
    run_time: "22 minutes",
    seasons: 1,
    episodes: 22,
    studio: "A-1 Pictures",
    genres: "Romance, Drama, Music"
  },
  {
    name: "One Punch Man",
    year: "2015",
    synopsis: "A superhero with unmatched strength seeks thrill in his life.",
    run_time: "24 minutes",
    seasons: 2,
    episodes: 24,
    studio: "Madhouse",
    genres: "Action, Comedy, Superhero"
  }
]

animes.each do |anime|
  Anime.create(anime)
  puts "Creating Anime: #{anime}"
end



# Seed data for anime_lists table
anime_lists_data = [
  { user_id: 1, anime_id: 1, name: "My Favorite Anime", genre_preferences: "Action, Adventure" },
  { user_id: 1, anime_id: 2, name: "Romantic Anime", genre_preferences: "Romance, Drama" },
  { user_id: 2, anime_id: 3, name: "Comedy Anime", genre_preferences: "Comedy" }
]

AnimeList.create!(anime_lists_data)

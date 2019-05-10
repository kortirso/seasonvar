movie_form = MovieForm.new(title: 'Game of thrones', plot: 'Battle between fire and ice')
movie1 = movie_form.movie if movie_form.persist?

season_form = SeasonForm.new(movie: movie1, number: 1)
season1 = season_form.season if season_form.persist?

episode_form = EpisodeForm.new(season: season1, number: 1)
episode_form.persist?
episode_form = EpisodeForm.new(season: season1, number: 2)
episode_form.persist?
episode_form = EpisodeForm.new(season: season1, number: 3)
episode_form.persist?
episode_form = EpisodeForm.new(season: season1, number: 4)
episode_form.persist?
episode_form = EpisodeForm.new(season: season1, number: 5)
episode_form.persist?
episode_form = EpisodeForm.new(season: season1, number: 6)
episode_form.persist?
episode_form = EpisodeForm.new(season: season1, number: 7)
episode_form.persist?
episode_form = EpisodeForm.new(season: season1, number: 8)
episode_form.persist?
episode_form = EpisodeForm.new(season: season1, number: 9)
episode_form.persist?
episode_form = EpisodeForm.new(season: season1, number: 10)
episode_form.persist?

movie_form = MovieForm.new(title: '300: Rise of an Empire', plot: 'Continue of 300 Spartans')
movie_form.persist?

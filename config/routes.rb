Rails.application.routes.draw do

  get("/directors/youngest", { :controller => "directors", :action => "rookie" })

  get("/directors/eldest", { :controller => "directors", :action => "wisest" })

  get("/", { :controller => "application", :action => "homepage" })

  get("/directors", { :controller => "directors", :action => "index" })

  get("/directors/:an_id", { :controller => "directors", :action => "director_details" })



  get("/movies", { :controller => "directors", :action => "all_movies" })

  get("/movies/:path_id", { :controller => "directors", :action => "movie_show" })



  get("/actors", { :controller => "directors", :action => "all_actors"})

  get("/actors/:an_id", { :controller => "directors", :action => "actor_details" })

end

class DirectorsController < ApplicationController 

  # Controllers for DIRECTORS

  def rookie
    @youngest = Director.order({ :dob => :desc }).at(0)

    render( { :template => "director_templates/youngest.html.erb" })
  end

  def wisest 
    @oldest = Director.where.not({ :dob => :desc }).order({ :dob => :asc }).at(0)

    render( { :template => "director_templates/eldest.html.erb" })
  end 

  def index
    @list_of_directors = Director.all

    render({ :template => "director_templates/index.html.erb" })
  end

  def director_details

    the_id = params.fetch("an_id")

    @the_director = Director.where({ :id => the_id }).at(0)
    @filmography = Movie.where({ :director_id => the_id })
    @list_of_directors = Director.all
    @list_of_movies = Movie.all
    @the_movie = Movie.where({ :id => the_id }).at(0)

    render({ :template => "director_templates/show.html.erb" })
  end



  # Controller for MOVIES

  def all_movies
  
    @list_of_directors = Director.all
    @list_of_movies = Movie.all 

    render({ :template => "movie_templates/movies.html.erb" })
  end

  def movie_show

    the_id = params.fetch("path_id")

    @the_movie = Movie.where({ :id => the_id }).at(0)
    @the_director = Director.where({ :id => the_id }).at(0)

    render({ :template => "movie_templates/movie_show.html.erb"})
  end



  # Controller for ACTORS
 
  def all_actors 

    @list_of_directors = Director.all 
    @list_of_actors = Actor.all
    
    render({ :template => "actor_templates/actors.html.erb" })
  end
  
  
  def actor_details
  
    the_id = params.fetch("an_id")
  
    @list_of_actors = Actor.all
    @list_of_movies = Movie.all
    @list_of_directors = Director.all
    @the_actor = Actor.where({ :id => the_id }).at(0)
    @the_character = Character.where({ :actor_id => the_id })
    
    
    
    
    render({ :template => "actor_templates/actor_show.html.erb" })
  end
  
end

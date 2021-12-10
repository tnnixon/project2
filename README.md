<h1> Proposal Link </h1>
 <br>
 https://docs.google.com/document/d/1WKpxvx1ruE4ZMyjaq1GBuiWMLHYcRxBEmqH7vMIGC7Y/edit?usp=sharing
 <br>
 
 <h1> Data Sources </h1>
 <b> IMDB Data </b> <br>
https://www.kaggle.com/stefanoleone992/imdb-extensive-dataset <br>
<b> Rotten Tomatoes Ratings </b> <br>
https://www.kaggle.com/stefanoleone992/rotten-tomatoes-movies-and-critic-reviews-dataset?select=rotten_tomatoes_movies.csv <br>
<b> IMDB Top 250 rated Movies </b> <br>
https://www.imdb.com/chart/top/?ref_=nv_mv_250 <br>

<h1> Pre-Requisites </h1> <br>
  a) SQLite DB <br>
  b) Extract the files in "Raw_Data.zip" and place them in the folder "Raw_Data". This folder should be in the same path as IPYNB files. <br>
      Due to Github Size restrictions all the files are not uploaded to the provided "Raw_Data" folder.
  
<h1> ETL Code </h1> <br>
Execute the below IPYNB files to generate movies_db.sqllite Database file.<br>
  a) movies.ipynb <br>
  b) names.ipynb <br>
  c) movie_names.ipynb <br>
  d) ratings_dac.ipynb <br>
  e) imdb_250_scraper.ipynb <br>

<h1> Database Tables List</h1><br>
  1) movies - Contains list of Movies from IMDB. <br>
  2) names - Contains list of actors, actresses, directors, writers, producers and others invloved in film making.<br>
  3) movie_names - This table depicts many-to-many relationship between movies and names. <br>
  4) ratings - This has Rotten Tomatoes ratings for the movies in movies table. Not all movies have ratings in rotten tomatoes. <br>
  5) imdb_top_250_movies - Contains list of top 250 movies based on IMDB list.

<h1> Sample DB Queries</h1> </br>
 <p> select * from movies limit 100

select * from movies limit 100

select * from actors limit 100

select * from imdb_top_250_movies

select * from cast_and_crew limit 100

select * from ratings limit 100

--Details of top 250 IMDB rated movies
select m.* from imdb_top_250_movies t250,movies m where t250.title=m.imdb_title_id

--IMDB 250 movies Rotten Tomato ratings
select r.imdb_ratings,r.tomatometer_rating, m.* from imdb_top_250_movies t250,movies m ,ratings r 
where t250.title=m.imdb_title_id and m.imdb_title_id=r.imdb_title_id

</p>
 <p> </p>

<h1> Presentation Link </h1>
 <br>
 https://docs.google.com/presentation/d/1kEtDiiB0wMDEApIcvWh8G1HzSCYXLKEOoH_JWarkoXY/edit?usp=sharing
 <br>

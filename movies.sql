-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [movies] (
    [imdb_title_id] VARCHAR  NOT NULL ,
    [title] VARCHAR  NOT NULL ,
    [original_title] VARCHAR  NOT NULL ,
    [year] INT  NOT NULL ,
    [date_published] DATE  NOT NULL ,
    [genre] VARCHAR  NOT NULL ,
    [duration] INT  NOT NULL ,
    [country] VARCHAR  NOT NULL ,
    [language] VARCHAR  NOT NULL ,
    [director] VARCHAR  NOT NULL ,
    [writer] VARCHAR  NOT NULL ,
    [production_company] VARCHAR  NOT NULL ,
    [actors] VARCHAR  NOT NULL ,
    [description] VARCHAR  NOT NULL ,
    [imdb_ratings] FLOAT  NOT NULL ,
    [votes] INT  NOT NULL ,
    [budget] VARCHAR  NOT NULL ,
    [usa_gross_income] VARCHAR  NOT NULL ,
    [worlwide_gross_income] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_movies] PRIMARY KEY CLUSTERED (
        [imdb_title_id] ASC
    )
)

CREATE TABLE [cast_and_crew] (
    [id] INT  NOT NULL ,
    [imdb_title_id] VARCHAR  NOT NULL ,
    [ordering] INT  NOT NULL ,
    [imdb_name_id] VARCHAR  NOT NULL ,
    [category] VARCHAR  NOT NULL ,
    [job] VARCHAR  NOT NULL ,
    [characters] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_cast_and_crew] PRIMARY KEY CLUSTERED (
        [id] ASC
    )
)

CREATE TABLE [ratings] (
    [rating_id] INT  NOT NULL ,
    [title] VARCHAR  NOT NULL ,
    [year] INT  NOT NULL ,
    [original_release_date] DATE  NOT NULL ,
    [imdb_ratings] FLOAT  NOT NULL ,
    [tomatometer_rating] FLOAT  NOT NULL ,
    [audience_rating] FLOAT  NOT NULL ,
    [imdb_title_id] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_ratings] PRIMARY KEY CLUSTERED (
        [rating_id] ASC
    )
)

CREATE TABLE [actors] (
    [imdb_name_id] VARCHAR  NOT NULL ,
    [name] VARCHAR  NOT NULL ,
    [birth_name] VARCHAR  NOT NULL ,
    [height] FLOAT  NOT NULL ,
    [bio] VARCHAR  NOT NULL ,
    [birth_details] VARCHAR  NOT NULL ,
    [date_of_birth] DATE  NOT NULL ,
    [place_of_birth] VARCHAR  NOT NULL ,
    [death_details] VARCHAR  NOT NULL ,
    [date_of_death] DATE  NOT NULL ,
    [place_of_death] VARCHAR  NOT NULL ,
    [reason_of_death] VARCHAR  NOT NULL ,
    [spouses_string] VARCHAR  NOT NULL ,
    [spouses] INT  NOT NULL ,
    [divorces] INT  NOT NULL ,
    [spouses_with_children] INT  NOT NULL ,
    [children] INT  NOT NULL ,
    CONSTRAINT [PK_actors] PRIMARY KEY CLUSTERED (
        [imdb_name_id] ASC
    )
)

CREATE TABLE [imdb_top_250_movies] (
    [title] VARCHAR  NOT NULL ,
    [movie_name] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_imdb_top_250_movies] PRIMARY KEY CLUSTERED (
        [title] ASC
    )
)

ALTER TABLE [movies] WITH CHECK ADD CONSTRAINT [FK_movies_imdb_title_id] FOREIGN KEY([imdb_title_id])
REFERENCES [cast_and_crew] ([imdb_title_id])

ALTER TABLE [movies] CHECK CONSTRAINT [FK_movies_imdb_title_id]

ALTER TABLE [movies] WITH CHECK ADD CONSTRAINT [FK_movies_title] FOREIGN KEY([title])
REFERENCES [imdb_top_250_movies] ([title])

ALTER TABLE [movies] CHECK CONSTRAINT [FK_movies_title]

ALTER TABLE [movies] WITH CHECK ADD CONSTRAINT [FK_movies_year] FOREIGN KEY([year])
REFERENCES [ratings] ([year])

ALTER TABLE [movies] CHECK CONSTRAINT [FK_movies_year]

ALTER TABLE [cast_and_crew] WITH CHECK ADD CONSTRAINT [FK_cast_and_crew_imdb_title_id] FOREIGN KEY([imdb_title_id])
REFERENCES [ratings] ([imdb_title_id])

ALTER TABLE [cast_and_crew] CHECK CONSTRAINT [FK_cast_and_crew_imdb_title_id]

ALTER TABLE [cast_and_crew] WITH CHECK ADD CONSTRAINT [FK_cast_and_crew_imdb_name_id] FOREIGN KEY([imdb_name_id])
REFERENCES [actors] ([imdb_name_id])

ALTER TABLE [cast_and_crew] CHECK CONSTRAINT [FK_cast_and_crew_imdb_name_id]

ALTER TABLE [ratings] WITH CHECK ADD CONSTRAINT [FK_ratings_title_imdb_ratings_imdb_title_id] FOREIGN KEY([title], [imdb_ratings], [imdb_title_id])
REFERENCES [movies] ([title], [imdb_ratings], [imdb_title_id])

ALTER TABLE [ratings] CHECK CONSTRAINT [FK_ratings_title_imdb_ratings_imdb_title_id]

ALTER TABLE [imdb_top_250_movies] WITH CHECK ADD CONSTRAINT [FK_imdb_top_250_movies_title] FOREIGN KEY([title])
REFERENCES [ratings] ([title])

ALTER TABLE [imdb_top_250_movies] CHECK CONSTRAINT [FK_imdb_top_250_movies_title]

COMMIT TRANSACTION QUICKDBD
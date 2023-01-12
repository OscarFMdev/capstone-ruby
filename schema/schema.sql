CREATE TABLE item (  
  id INT GENERATED ALWAYS AS IDENTITY,
  id_genre INT REFERENCES genre(id),
  id_author INT REFERENCES author(id),
  id_label INT REFERENCES label(id),
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY (id)
);

CREATE TABLE genre (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
);

CREATE TABLE author (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(250),
  last_name VARCHAR(250),
);

CREATE TABLE label (
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(250),
  color VARCHAR(250),
);

/*---------------------------------------------------------*/

CREATE TABLE music_albums (  
  id INT GENERATED ALWAYS AS IDENTITY,
  on_spotify BOOLEAN,
  PRIMARY KEY (id)
);

CREATE TABLE book (  
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(250),
  cover_state VARCHAR(250),
  PRIMARY KEY (id)
);

CREATE TABLE game (  
  id INT GENERATED ALWAYS AS IDENTITY,
  multiplayer BOOLEAN,
  last_played DATE,
  PRIMARY KEY (id)
);



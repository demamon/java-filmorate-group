CREATE TABLE IF NOT EXISTS users (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    email varchar(100) NOT NULL UNIQUE,
    login varchar(100) NOT NULL UNIQUE,
    name varchar(100) NOT NULL ,
    birthday date NOT NULL
);

CREATE TABLE IF NOT EXISTS genres (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name varchar(20) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS mpa (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name varchar(20) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS films(
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name varchar(100) NOT NULL,
    description varchar(200),
    release_date date NOT NULL,
    duration INT NOT NULL,
    mpa_id INT NOT NULL,
    rate INT,
    FOREIGN KEY (mpa_id) REFERENCES mpa(id)
);

CREATE TABLE IF NOT EXISTS friendship (
    user_id BIGINT,
    friend_id BIGINT,
    PRIMARY KEY (user_id, friend_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (friend_id) REFERENCES users(id)
);


CREATE TABLE IF NOT EXISTS film_genre (
    film_id BIGINT,
    genre_id BIGINT,
    FOREIGN KEY (film_id) REFERENCES films(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    PRIMARY KEY (film_id, genre_id)
);

CREATE TABLE IF NOT EXISTS likes (
    film_id BIGINT,
    user_id BIGINT,
    FOREIGN KEY (film_id) REFERENCES films(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY (film_id, user_id)
);

CREATE TABLE IF NOT EXISTS reviews (
   reviews_id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
   content varchar(500) NOT NULL,
   type BOOLEAN NOT NULL,
   user_id BIGINT NOT NULL,
   film_id BIGINT NOT NULL,
   useful BIGINT DEFAULT 0,
   FOREIGN KEY (film_id) REFERENCES films(id),
   FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS review_likes (
    review_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    is_positive BOOLEAN NOT NULL,
    PRIMARY KEY (review_id, user_id),
    FOREIGN KEY (review_id) REFERENCES reviews(reviews_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
  
CREATE TABLE IF NOT EXISTS directors (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name varchar(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS film_directors (
    film_id BIGINT,
    director_id BIGINT,
    FOREIGN KEY (film_id) REFERENCES films(id),
    FOREIGN KEY (director_id) REFERENCES directors(id),
    PRIMARY KEY (film_id, director_id)
);

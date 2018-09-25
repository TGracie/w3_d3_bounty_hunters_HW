DROP TABLE IF EXISTS bounty_hunters;

  CREATE TABLE bounty_hunters(
    id SERIAL4        PRIMARY KEY,
    name             VARCHAR(255),
    favourite_weapon VARCHAR(255),
    homeworld        VARCHAR(255),
    danger_level     VARCHAR(255)
  )

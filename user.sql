create table user(
  id SERIAL NOT NULL,
  username    VARCHAR(40) NOT NULL UNIQUE,
  name        VARCHAR(40) NOT NULL,
  email       VARCHAR(320) NOT NULL UNIQUE,
  pfp_id      INTEGER,

  CONSTRAINT pk_user   PRIMARY KEY (id),
  CONSTRAINT fk_pfp    FOREIGN KEY (pfp_id)
  REFERENCES  image(id)
  );

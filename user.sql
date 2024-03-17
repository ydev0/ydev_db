create table user(
  id SERIAL,

  uuid        VARCHAR NOT NULL UNIQUE,
  name        VARCHAR NOT NULL,
  email       VARCHAR NOT NULL UNIQUE,
  description VARCHAR,

  pfp_img_id    INTEGER,
  header_img_id INTEGER,

  CONSTRAINT pk_user   PRIMARY KEY (id),
  CONSTRAINT fk_pfp    FOREIGN KEY (pfp_img_id)
  REFERENCES  _img(id),
  CONSTRAINT fk_header FOREIGN KEY (header_img_id)
  REFERENCES  _img(id)
  );

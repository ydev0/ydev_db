create table user
(
  id       int auto_increment
  primary key,
  username varchar(20)  not null,
  email    varchar(320) not null,
  password varchar(100) not null,
  root     tinyint(1)   not null,
  pfp_id   int          null,
  constraint email unique (email),
  constraint id unique (id),
  constraint username unique (username),
  constraint fk_pfp foreign key (pfp_id) references image (id)
);



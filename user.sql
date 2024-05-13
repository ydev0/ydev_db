create table user(
  id int not null unique AUTO_INCREMENT,
  username    VARCHAR(20) not null unique,
  name        varchar(50) not null,
  email       varchar(320) not null unique,
  password    varchar(100) not null,
  pfp_id      integer,

  constraint pk_user primary key (id),
  constraint fk_pfp foreign key (pfp_id) references image (id)
);


--> sample insertion on user
insert into user (id, username, name, email, password, pfp_id) values (0, "carlos", "carlosU.U", "carlos@carlos.com", "1234", "1");

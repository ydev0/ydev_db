create table user(
  id int not null unique AUTO_INCREMENT,
  username    varchar(20) not null unique,
  name        varchar(50) not null,
  email       varchar(320) not null unique,
  password    varchar(100) not null,
  root        boolean not null,
  pfp_id      integer,

  constraint pk_user primary key (id),
  constraint fk_pfp foreign key (pfp_id) references image (id)
);


insert into user (username, name, email, password, root, pfp_id) values ("carlos", "carlosU.U", "carlos@carlos.com", "1234",0, 1) returning id;

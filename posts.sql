create table posts(
  id int not null,
  title varchar(20),
  content blob not null,

  usr_id integer,

  constraint pk_pts primary key (id),
  constraint fk_usr foreign key (usr_id) references user(id)
);

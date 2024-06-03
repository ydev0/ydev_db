create table thread
(
  id         int auto_increment
  primary key,
  usr_id     int           null,
  text       varchar(1000) not null,
  article_id int           null,
  constraint fk_artl
  foreign key (article_id) references article (id),
  constraint fk_usr
  foreign key (usr_id) references user (id)
);

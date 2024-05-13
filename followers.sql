create table relations (
  follower_id int not null,
  followed_id int not null,

  constraint pk_relation primary key (follower_id, followed_id),
  constraint fk_follower foreign key (follower_id) references user(id),
  constraint fk_followed foreign key (followed_id) references user(id)
);

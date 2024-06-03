create table usr_flw
(
    usr_id int not null,
    flw_id int not null,
    primary key (usr_id, flw_id),
    constraint fk_followed
        foreign key (flw_id) references user (id),
    constraint fk_follower
        foreign key (usr_id) references user (id)
);

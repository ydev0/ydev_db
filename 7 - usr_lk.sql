create table usr_lk
(
    usr_id  int not null,
    thrd_id int not null,
    constraint fk_thrd
        foreign key (thrd_id) references thread (id),
    constraint fk_user
        foreign key (usr_id) references user (id)
);

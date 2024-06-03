create table thrd_lst
(
    main_id  int not null,
    assoc_id int not null,
    constraint fk_ac_thrd
        foreign key (assoc_id) references thread (id),
    constraint fk_mn_thrd
        foreign key (main_id) references thread (id)
);

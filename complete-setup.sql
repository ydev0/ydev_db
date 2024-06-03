create database if not exists ydev_db;

ALTER DATABASE ydev_db CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

use ydev_db;

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;

create table if not exists article 
(
    id       int auto_increment
        primary key,
    title    varchar(80)   not null,
    markdown varchar(4000) not null
);

create table if not exists image 
(
    id     int auto_increment
        primary key,
    type   varchar(20) null,
    image  longblob    null,
    width  int         null,
    height int         null
);

create table if not exists user 
(
    id       int auto_increment
        primary key,
    username varchar(20)  not null,
    email    varchar(320) not null,
    password varchar(100) not null,
    root     tinyint(1)   not null,
    pfp_id   int          null,
    constraint email
        unique (email),
    constraint id
        unique (id),
    constraint username
        unique (username),
    constraint fk_pfp
        foreign key (pfp_id) references image (id)
);

create table if not exists thread 
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

create table if not exists thrd_lst 
(
    main_id  int not null,
    assoc_id int not null,
    constraint fk_ac_thrd
        foreign key (assoc_id) references thread (id),
    constraint fk_mn_thrd
        foreign key (main_id) references thread (id)
);

create table if not exists usr_flw
(
    usr_id int not null,
    flw_id int not null,
    primary key (usr_id, flw_id),
    constraint fk_followed
        foreign key (flw_id) references user (id),
    constraint fk_follower
        foreign key (usr_id) references user (id)
);

create table if not exists usr_lk
(
    usr_id  int not null,
    thrd_id int not null,
    constraint fk_thrd
        foreign key (thrd_id) references thread (id),
    constraint fk_user
        foreign key (usr_id) references user (id)
);

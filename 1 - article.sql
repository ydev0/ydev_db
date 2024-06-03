create table article
(
    id       int auto_increment
        primary key,
    title    varchar(80)   not null,
    markdown varchar(4000) not null
);

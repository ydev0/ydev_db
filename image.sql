create table image(
  id int not null,
  type varchar(20),
  image blob,
  width integer,
  height integer,

  constraint pk_image primary key (id)
);

--> insert sample
insert into image (id, type, image, width, height) values (0, ".png", "imagem da silva", 1920, 1080);

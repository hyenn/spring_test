drop table image;

create table image(
no		number			not null,
title	varchar(30)		not null,
name	varchar(30)		not null,
content	varchar(30)		not null,
img		varchar(50)		not null,
pw		varchar(30)		not null,
viewcnt	number			default 0,
mdate	date			not null,
primary key(no)
);


select no,title,name,img,viewcnt,
			mdate, r
from(
	select no,title,name,img,viewcnt,
				mdate, rownum as r
	from(
		select no,title,name,img,viewcnt,
				to_char(mdate,'yyyy-mm-dd')as mdate
		from image
		--where name='%ㅇ'
		order by no desc
	)
) where r>=2 and r<=3;


select * from image;

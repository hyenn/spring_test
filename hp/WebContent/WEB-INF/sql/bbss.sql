create table bbss(
bbsno		number(10)		not null,
bname		varchar(20)		not null,
title		varchar(200)	not null,
content		varchar(1000)	not null,
passwd		varchar(15)		not null,
viewcnt		number(5)		default 0,
wdate 		date			not null,
grpno		number(7)		default 0,
indent		number(2)		default 0,
ansnum		number(5)		default 0,
refnum		number(5)		default 0,
primary key(bbsno)
);


select bbsno,bname,title,viewcnt,wdate,grpno,
		indent,ansnum,r
from(		
	select bbsno,bname,title,viewcnt,wdate,grpno,
			indent,ansnum,rownum as r
	from(
		select bbsno,bname,title,viewcnt,
			to_char(wdate,'yyyy-mm-dd') as wdate,grpno,
			indent,ansnum
		from bbss
		where bbsno=1
	)
)where r>=? and r<=?
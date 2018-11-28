create table fup(
fno			number(7)		not null,
fname		varchar(20)		not null,
ftitle		varchar(100)	not null,
fcontent	varchar(4000)	not null,
fpw			varchar(15)		not null,
viewcnt		number(5)		default 0,
fdate		date			not null,
grpno		number(7)		default 0,	--부모글, 그룹 번호
indent		number(2)		default 0,	--
ansnum		number(5)		default 0,
primary key(fno)

);

alter table fup
add(refnum	 number	default 0,
	filename varchar(30),
	filesize number default 0);
	
	
select fno,fname,ftitle,filename,viewcnt,
	fdate,grpno,indent,ansnum,r	
from(

	select fno,fname,ftitle,filename,viewcnt,
		fdate,grpno,indent,ansnum, rownum as r
	from(
	
		select fno,fname,ftitle,filename,viewcnt,
		to_char(fdate,'yyyy-mm-dd') as fdate,grpno,indent,ansnum
		from fup
		order by grpno desc, ansnum
	)
)where r>=2 and r<=3;	
	
select * from fup;	

delete from fup;
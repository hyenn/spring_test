drop table mmember;

create table mmember(
	id			varchar(20)		not null,
	pw			varchar(20)		not null,
	mname		varchar(20)		not null,
	phone		varchar(20)		null,
	email		varchar(50)		not null unique,
	zipcode		varchar(10)		null,
	address1	varchar(150)	null,
	address2	varchar(100)	null,
	mdate		date			not null,
	grade		char(1)			default 'H',
	
	primary key(id)
);

select id,mname,phone,email,zipcode,address1,address2,mdate,r
from(
	select id,mname,phone,email,zipcode,address1,address2,mdate,rownum as r
	from(
		select id,mname,phone,email,zipcode,address1,address2,mdate
		from mmember
		--where mname like '%이%'
		order by mdate desc
	)
)where r>=2 and r<=3


insert into mmember
(mname, id, pw, phone, email, zipcode, address1, address2, mdate, grade)
values
('이름','admin','123','111','nene@name.com','12344','서울시','강북구',sysdate,'A');

update mmember
set phone = '010-2222-2222',
	email = 'aaa@name.neme',
	zipcode = '11111',
	address1 = '서울',
	address2 = '강남',
	pw = '123'
where id = 'aaa';	

select * from MMEMBER;



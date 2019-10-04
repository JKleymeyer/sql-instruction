-- add a dummy stuffy, update record, then delete that record
insert into stuffy (id, type, color, size, limbs)
values ('11', 'dummy', 'dummy', 'd', '4');
select * from stuffy;
update stuffy
set color = 'Green'
where id = 11;
select * from stuffy;
delete from stuffy
where id = 11;
select * from stuffy;
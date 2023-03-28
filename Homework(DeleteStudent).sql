create database Course

use Course

create table Students(
[Id] int primary key identity(1,1),
[Name] nvarchar(20),
[Surname] nvarchar(20),
[Age] int,
[Email] nvarchar(100),
[Address] nvarchar(200)
)

insert into Students ([Name],[Surname],[Age],[Email],[Address])
values('Cavid','Ismayilzade',22,'cavid@mail.ru','Sulutepe'),
      ('Agshin','Humbetov',27,'agshin@gmail.com','Xirdalan'),
	  ('Mirze','Beshirzade',27,'mirze@list.ru','Bulbule'),
	  ('Ibrahim','Aliyev',21,'xachker@box.ru','Sumqayit'),
	  ('Shaig','Kazimov',25,'shaig@code.edu.az','Baki'),
	  ('Mubariz','Agayev',18,'mubariz@box.az','Salyan'),
	  ('Anar','Aliyev',28,'anar@mail.ru','Baki')

select *from Students

create table StudentArchives(
[Id] int primary key identity(1,1),
[UserId] int,
[Name] nvarchar(20),
[Surname] nvarchar(20),
[Age] int,
[Email] nvarchar(100),
[Address] nvarchar(200),
[Date] datetime
)


select *from StudentArchives


create trigger trg_deleteStudent on Students
after delete 
as
BEGIN
insert into StudentArchives([UserId],[Name],[Surname],[Age],[Email],[Address],[Date])
select [Id],[Name],[Surname],[Age],[Email],[Address],GETDATE() from deleted
END

delete from Students where Id = 7

create procedure usp_deleteStudent 
@studentId int
as
BEGIN
delete from Students where Id = @studentId
select *from  Students
select *from StudentArchives
END

exec usp_deleteStudent 3



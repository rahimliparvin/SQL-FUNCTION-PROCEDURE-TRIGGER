

--create view GetCustomerById
--as 
--select *from Customers where Id = 1

--select *from GetCustomerById

use Company

create function dbo.SayHelloWorld()
returns nvarchar(50)
as
BEGIN
   return 'Hello World'
END	

select dbo.SayHelloWorld()


create function dbo.writeWord(@word nvarchar(20))
returns nvarchar(50)
as
BEGIN
   return @word
END	

declare @word nvarchar(20) = 'P135'

select dbo.writeWord(@word)

select dbo.writeWord('P135')


create function dbo.writeWordswithTwoParametr(@word nvarchar(20),@source nvarchar(20))
returns nvarchar(50)
as
BEGIN
   return @word + @source
END	

select dbo.writeWordswithTwoParametr('Shaig','P135') as 'Data'


create function dbo.SumOfNumbers(@num1 int,@num2 int)
returns int
as
BEGIN
   return @num1 + @num2
END	

select dbo.SumOfNumbers(5,10)


create function dbo.GetCustomerCount()
returns int
as
BEGIN
 declare @count int 
 select @count =  Count(*) from Customers
 return @count
END

select dbo.GetCustomerCount()


create function dbo.GetCustomerAvarageAgeById(@id int)
returns int
as
BEGIN
 declare @avgAge int 
 select @avgAge =  Avg(Age) from Customers where Id > @id
 return @avgAge
END

select dbo.GetCustomerAvarageAgeById(4)


create procedure usp_SayHelloWorld
as
BEGIN
  print 'Hello World'
END

exec usp_SayHelloWorld



create procedure usp_SumOfNums
@num1 int, 
@num2 int
as
BEGIN
  print @num1 + @num2
END

exec usp_SumOfNums 5,8



create procedure usp_addCustomer
@name nvarchar(50), 
@surname nvarchar(50),
@age int
as
BEGIN
  insert into Customers([Name],[Surname],[Age])
  values(@name,@surname,@age)
END

exec  usp_addCustomer 'Eli','Talibov',21


create procedure usp_deleteCustomer
@id int
as
BEGIN
delete from Customers where Id = @id
END

exec usp_deleteCustomer 3


create procedure usp_deleteCustomerShowDatas
@id int
as
BEGIN
delete from Customers where Id = @id
select *from Customers
END

exec usp_deleteCustomerShowDatas 7



--create table Users(
--[Id] int primary key identity(1,1),
--[Name] nvarchar(50),
--[Age] int,
--[IsDeleted] bit default 'False'
--)


--create table UserLogs(
--[Id] int primary key identity(1,1),
--[UserID] int,
--[Operation] nvarchar(10),
--[Date] datetime 
--)
 

--create trigger trg_insertUser on Users
--after insert
--as
--BEGIN	
--insert into UserLogs([UserID],[Operation],[Date])
--select Id,'Insert',GETDATE() from inserted
--END


--create procedure usp_insertUser 
--@name nvarchar(20),
--@age int
--as
--BEGIN	
--insert into Users([Name],[Age])
--values(@name,@age)
--END	

exec usp_insertUser 'Ceyhun',23


--create procedure usp_getUserById
--@id int
--as
--BEGIN	
--select *from UserLogs where UserID = 8
--END

--create trigger trg_deleteUser on Users
--after delete
--as
--BEGIN	
--insert into UserLogs([UserID],[Operation],[Date])
--select Id,'Delete',GETDATE() from deleted
--END


--delete from Users where Id = 1

create trigger trg_updateUser on Users
after update
as
BEGIN	
insert into UserLogs([UserID],[Operation],[Date])
select Id,'Update',GETDATE() from deleted
END

Update Users 
set [Name] = 'Elekber' where Id = 3


select * from UserLogs where UserId = 3
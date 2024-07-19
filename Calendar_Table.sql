Declare @StartDate date = (select Min(OrderDate) From Fact_Sales);
Declare @EndDate date = (select Max(OrderDate) From Fact_Sales);

With Calendarr As
(
select @StartDate as [Date]
Union All
Select DATEADD(dd,1,[Date])
from Calendarr 
Where DATEADD(dd,1,[Date]) <= @EndDate
)
Select [Date] From Calendarr

OPTION (MAXRECURSION 0)

select Month([Date]) , DATEPART(quarter, [Date]),Year([Date])
from Calendarr 
OPTION (MAXRECURSION 0)
------------------------------------
Create Table Calendar 
( 
[Date]    date Primary Key,
[Year]    int  not null,
[Quarter] varchar(10)  not null,
[MonthName]   varchar(10)  not null,
[MonthNum]    int,
[Weekday]     Varchar(50),
[WeekNum]     int,
[Weekday/end] Varchar(50)
)
  
Declare @StartDate date = (select Min(OrderDate) From Fact_Sales);
Declare @EndDate date = (select Max(OrderDate) From Fact_Sales);

With Calendarr As
( select @StartDate as [Date]
Union All
Select DATEADD(dd,1,[Date]) from Calendarr 
Where DATEADD(dd,1,[Date]) <= @EndDate)

insert into Calendar([Date],[Year],[Quarter],[MonthName],[MonthNum],[Weekday],[WeekNum])

select [Date],Year([Date]), DATEPART(quarter, [Date]),
SUBSTRING( DateName( month ,[Date]),1,3),Month([Date])
,SUBSTRING( DATENAME(dw,[Date]) ,1,3),DATEPART(dw,[Date])
from Calendarr 
OPTION (MAXRECURSION 0)

update Calendar 
set [Quarter] = 'Q'+[Quarter];

update Calendar 
set  [weekday/end] = IIF(WeekNum = 1 ,'Weekend',IIF(WeekNum = 7,'Weekend','Weekday'));

select * from Calendar

----------------------------------

select * from Calendar
select SUBSTRING( DATENAME(dw,[Date]) ,1,3),DATEPART(dw,[Date])
from Calendar

/*
if WeekNum = 1 or 7
 BEGIN
       'Weekend'
    END;
ELSE  
 BEGIN
       'Weekday'
    END;
	
	select
	IIF(WeekNum = 1 ,'Weekend',IIF(WeekNum = 7,'Weekend','Weekday'))
	from Calendar
	*/
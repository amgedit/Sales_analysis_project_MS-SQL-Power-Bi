select * from Fact_Sales
order by 12;


/*delete from Fact_Sales
where OrderDate is null*/

------------
Select * from Fact_Sales
where OrderDate is null

--Delete Null
Delete  from Fact_Sales
where OrderDate is null

-------------View Depul
 select *, ROW_NUMBER() over(partition by OrderDate,OrderNumber,
 Productkey,SalespersonKey,Salesperson,Supervisor,
 Manager,Channel,Quantity,UnitPrice order by OrderNumber) as Number_Rows

 from Fact_Sales;


 with Depulectte AS
 (
 SELECT *, ROW_NUMBER() over(partition by OrderDate,OrderNumber,
 Productkey,SalespersonKey,Salesperson,Supervisor, Manager,Channel,
 Quantity,UnitPrice order by OrderNumber) as Number_Rows
 
 from Fact_Sales


 )

 select * from Depulectte,Fact_Sales
 where Number_Rows>1;

 --------


 select * from Fact_Sales
  
 /*
 DECLARE @num int
 set @num =1
 update Fact_Sales
 set index_ =   @num
 @num = @num+1
 */
 /*
   with index_ AS
(
 select  ROW_NUMBER() over(order by OrderNumber) as indeex
 from Fact_Sales
 )
 select indeex from  index_
 */

 Alter Table Fact_Sales
 Add  index_ int identity
 Primary Key(index_)
 
  select * from Fact_Sales



select * from Datee





  update Fact_Sales
  set OrderDate = OrderDate_
  from Datee
  where Fact_Sales.index_ = Datee.index_


  --change constraint primary to not primary
  Alter Table Fact_Sales
  Drop column index_

   select * from Fact_Sales

 
 
 -------------------


 Alter Table Fact_Sales
 Add  Revenue DECIMAL(10, 2)

 update Fact_Sales
 set Revenue = Quantity * UnitPrice


  select * from Fact_Sales





  ---------------------------------------**********************************************************

  /*
  select * from Budget_2019;

  Alter Table Budget_2019
  Drop column F14 ;


  delete from Budget_2019
  where F2 = 29894.7708 and F3 = 141352.9875;


    delete from Budget_2019
  where F2 = 2019.00 and F3 is null;


  Select SalespersonID, Month_, Budget
	from Budget_2019
	unpivot(
	Sales
	for Month_ in([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
	 
	)	as Unpivot_

	create Table Budget_2019_2
	( SalespersonID int ,
	  Month_ int,
	  Budget Decimal(10,2)
	
	)

	insert into Budget_2019_2(SalespersonID,Month_,Budget)

	  Select SalespersonID, Month_, Budget
	from Budget_2019
	unpivot(
	Budget
	for Month_ in([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
	 
	)	as Unpivot_ 


	  select * from Budget_2019_2;


	  Delete from Budget_2019_2 
	  where SalespersonID is null;

	  select * from Budget_2019_2;

	  Alter Table Budget_2019_2
	  Add Year_ int

	  Update Budget_2019_2
	  set Year_ = 2019


	  	  select * from Budget_2019_2;
--------------------------------------------------


  select * from Budget_2020;

  Alter Table Budget_2020
  Drop column F14 ;


  delete from Budget_2020
  where F2 = 639737.1033 and F3 = 496831.5389;


    delete from Budget_2020
  where F2 = 2020.00 and F3 is null;


  Select SalespersonID, Month_, Budget
	from Budget_2020
	unpivot(
	Budget
	for Month_ in([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
	 
	)	as Unpivot_

	create Table Budget_2020_2
	( SalespersonID int ,
	  Month_ int,
	  Budget Decimal(10,2)
	
	)

	insert into Budget_2020_2(SalespersonID,Month_,Budget)

	  Select SalespersonID, Month_, Budget
	from Budget_2020
	unpivot(
	Budget
	for Month_ in([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
	 
	)	as Unpivot_ 


	  select * from Budget_2020_2;


	  Delete from Budget_2020_2 
	  where SalespersonID is null;

	  select * from Budget_2020_2;

	  Alter Table Budget_2020_2
	  Add Year_ int

	  Update Budget_2020_2
	  set Year_ = 2020


	  	  select * from Budget_2020_2;


-------------------------------------------------------------------



  select * from Budget_2021;

  Alter Table Budget_2021
  Drop column F14 ;


  delete from Budget_2021
  where F2 = 716650.1064 and F3 = 390542.3797;


    delete from Budget_2021
  where F2 = 2021.00 and F3 is null;


  Select SalespersonID, Month_, Budget
	from Budget_2021
	unpivot(
	Budget
	for Month_ in([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
	 
	)	as Unpivot_

	create Table Budget_2021_2
	( SalespersonID int ,
	  Month_ int,
	  Budget Decimal(10,2)
	
	)

	insert into Budget_2021_2(SalespersonID,Month_,Budget)

	  Select SalespersonID, Month_, Budget
	from Budget_2021
	unpivot(
	Budget
	for Month_ in([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
	 
	)	as Unpivot_ 


	  select * from Budget_2021_2;


	  Delete from Budget_2021_2 
	  where SalespersonID is null;

	  select * from Budget_2021_2;

	  Alter Table Budget_2021_2
	  Add Year_ int

	  Update Budget_2021_2
	  set Year_ = 2021


	  	  select * from Budget_2021_2;

/*
		  insert into Budget_2021_2(SalespersonID,Month_,Budget)

		  select SalespersonID,Month_,Budget
		  From Budget_2019_2 


		   insert into Budget_2021_2(SalespersonID,Month_,Budget)

		  select SalespersonID,Month_,Budget
		  From Budget_2020_2 


		  	  	  select * from Budget_2021_2;

*/



Create Table Budget_All_Years
(
SalespersonID int ,
	  Month_ int,
	  Budget Decimal(10,2),
	  Year_ int
)


	insert into Budget_All_Years(SalespersonID,Month_,Budget,Year_)

	 select SalespersonID,Month_,Budget,Year_
		  From Budget_2019_2

		  	insert into Budget_All_Years(SalespersonID,Month_,Budget,Year_)

		   select SalespersonID,Month_,Budget,Year_
		  From Budget_2020_2 


		  	insert into Budget_All_Years(SalespersonID,Month_,Budget,Year_)

		   select SalespersonID,Month_,Budget,Year_
		  From Budget_2021_2;



 select distinct SalespersonID,Month_,Budget,Year_
	  from Budget_All_Years;

 select * from Budget_All_Years;


 */
 -------------------------------------------------------------
      select * from Budget_All_Years;
	   select * from Fact_Sales


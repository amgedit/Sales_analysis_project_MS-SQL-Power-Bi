---Budget Table


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
	  [Month] varchar(50),
	  Budget Decimal(10,2),
	  [Year] varchar(50)
)

	insert into Budget_All_Years(SalespersonID,[Month],Budget,[Year])

	 select SalespersonID,[Month],Budget,[Year]
		  From Budget_2019_2

		  	insert into Budget_All_Years(SalespersonID,[Month],Budget,[Year])

		   select SalespersonID,[Month],Budget,[Year]
		  From Budget_2020_2 


		  	insert into Budget_All_Years(SalespersonID,[Month],Budget,[Year])

		   select SalespersonID,[Month],Budget,[Year]
		  From Budget_2021_2;



 select distinct SalespersonID,[Month],Budget,[Year]
	  from Budget_All_Years;

 select Budget_Date from Budget_All_Years;

 select * from Budget_All_Years;


 SELECT convert(date,[Year] + '-' + [Month] +'-' + dayy  )from Budget_All_Years

 update Budget_All_Years
set [Budget_Date] =convert(date,[Year] + '-' + [Month] +'-' + '1' );





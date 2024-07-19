Create Table Dim_Salesperson
(
SalespersonKey int primary key,
Salesperson    Varchar(255) not null,
Supervisor     Varchar(255) not null,
Manager        Varchar(255) not null
)

insert into Dim_Salesperson
(SalespersonKey,Salesperson,Supervisor,Manager) 

Select distinct SalespersonKey, Salesperson,
 Supervisor, Manager
from Fact_Sales;

select * from Dim_Salesperson;



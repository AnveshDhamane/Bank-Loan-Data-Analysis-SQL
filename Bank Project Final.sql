create database project;

# ---------------------------------------------------------------------- View 1 -----------------------------------------------------------------------------------------------------


create view KPI_Report as
select 
    count(case when Close_Client = 'NO' then 1 end) as Active_Clients,
    count(case when Close_Client = 'YES' then 1 end) as Closed_Clients,
    concat(cast(round(sum(Funded_Amount) / 1000000, 2) as char(40)), ' M') as Total_Funded_Amount,
    round(avg(Int_Rate), 2) as Avg_Int_Rate,
    concat(cast(round((count(case when Is_Delinquent_Loan = 'Y' then 1 end) / count(*)) * 100,2) as char(40)), ' %') as Delinquent_Loan_Rate,
    concat(cast(round((count(case when Is_Default_Loan = 'Y' then 1 end) / count(*)) * 100,2) as char(40)),' %') as Default_Loan_Rate
from bank;





# --------------------------------------------------------------- Stored Procedure 1 -----------------------------------------------------------------------------------------------------------

delimiter \\
create procedure analysis()
begin

select * from Bank_KPI_Summary;


select State_Name, concat(cast(round(sum(Funded_Amount)/1000000, 2) as char(40)), ' M') as Total_Funded_Amount from bank
group by State_Name
order by sum(Funded_Amount) desc;


select Age, concat(cast(round(sum(Funded_Amount)/1000000, 2) as char(40)), ' M') as Total_Funded_Amount from bank
group by Age
order by sum(Funded_Amount) desc;


select Region_Name, concat(cast(round(sum(Funded_Amount)/1000000, 2) as char(40)), ' M') as Total_Funded_Amount from bank
group by Region_Name
order by sum(Funded_Amount) desc;


select Religion, concat(cast(round(sum(Funded_Amount)/1000000, 2) as char(40)), ' M') as Total_Funded_Amount from bank
group by Religion
order by sum(Funded_Amount) desc;


select Purpose_Category, concat(cast(round(sum(Funded_Amount)/1000000, 2) as char(40)), ' M') as Total_Funded_Amount from bank
group by Purpose_Category
order by sum(Funded_Amount) desc
limit 10;


select Bank_Name, concat(cast(round(sum(Loan_Amount) / 1000000, 2) as char(40)), ' M') as Total_Loan_Amount, concat(cast(round(sum(Funded_Amount) / 1000000, 2) as char(40)), ' M') as Total_Funded_Amount,((sum(Loan_Amount) - sum(Funded_Amount)) / sum(Loan_Amount)) * 100 as `Diff_in_%`, count(Account_ID) as Total_Loan_Count from bank
group by Bank_Name
order by Total_Loan_Count desc;

end\\
delimiter ;



-- Procedure Call
call analysis();



# ------------------------------------------------------View 2---------------------------------------------------------------------------------------------------------
create view Branch_Wise_KPI_Report as
select 
	Branch_Name,
    count(case when Close_Client = 'NO' then 1 end) as Active_Clients,
    count(case when Close_Client = 'YES' then 1 end) as Closed_Clients,
    concat(cast(round(sum(Funded_Amount) / 1000000, 2) as char(40)), ' M') as Total_Funded_Amount,
    round(avg(Int_Rate), 2) as Avg_Int_Rate,
    concat(cast(round((count(case when Is_Delinquent_Loan = 'Y' then 1 end) / count(*)) * 100,2) as char(40)), ' %') as Delinquent_Loan_Rate,
    concat(cast(round((count(case when Is_Default_Loan = 'Y' then 1 end) / count(*)) * 100,2) as char(40)),' %') as Default_Loan_Rate
from bank
group by Branch_Name
order by Branch_Name desc;


# ------------------------------------------------------------------------------ Stored Procedure 2-------------------------------------------------------------------------------
delimiter \\
create procedure Branch_Wise_Analysis(in branch_list varchar(255))
begin


select * from Branch_Wise_KPI_Report
where find_in_set(Branch_Name, branch_list);


select Branch_Name,State_Name, concat(cast(round(sum(Funded_Amount)/1000000, 2) as char(40)), ' M') as Total_Funded_Amount from bank
where find_in_set(Branch_Name, branch_list)
group by Branch_Name,State_Name
order by Branch_Name desc, sum(Funded_Amount) desc;


select Branch_Name,Age, concat(cast(round(sum(Funded_Amount)/1000000, 2) as char(40)), ' M') as Total_Funded_Amount from bank
where find_in_set(Branch_Name, branch_list)
group by Branch_Name,Age
order by Branch_Name desc, sum(Funded_Amount) desc;


select Branch_Name,Region_Name, concat(cast(round(sum(Funded_Amount)/1000000, 2) as char(40)), ' M') as Total_Funded_Amount from bank
where find_in_set(Branch_Name, branch_list)
group by Branch_Name,Region_Name
order by Branch_Name desc, sum(Funded_Amount) desc;


select Branch_Name,Religion, concat(cast(round(sum(Funded_Amount)/1000000, 2) as char(40)), ' M') as Total_Funded_Amount from bank
where find_in_set(Branch_Name, branch_list)
group by Branch_Name,Religion
order by Branch_Name desc, sum(Funded_Amount) desc;


select Branch_Name,Purpose_Category, concat(cast(round(sum(Funded_Amount)/1000000, 2) as char(40)), ' M') as Total_Funded_Amount from bank
where find_in_set(Branch_Name, branch_list)
group by Branch_Name,Purpose_Category
order by Branch_Name desc, sum(Funded_Amount) desc
limit 10;


select Branch_Name,Bank_Name, concat(cast(round(sum(Loan_Amount) / 1000000, 2) as char(40)), ' M') as Total_Loan_Amount, concat(cast(round(sum(Funded_Amount) / 1000000, 2) as char(40)), ' M') as Total_Funded_Amount,((sum(Loan_Amount) - sum(Funded_Amount)) / sum(Loan_Amount)) * 100 as `Diff_in_%`, count(Account_ID) as Total_Loan_Count from bank
where find_in_set(Branch_Name, branch_list)
group by Branch_Name,Bank_Name
order by Branch_Name desc, Total_Loan_Count desc;


end\\
delimiter ;




-- Procedure Call
call Branch_Wise_Analysis('PATIALA,Mathura');


-- ----------------------------------------------------------View 3-------------------------------------------------------------------------------------------------------------------------------

create view Bank_Wise_KPI_Report as
select 
	Bank_Name,
    count(case when Close_Client = 'NO' then 1 end) as Active_Clients,
    count(case when Close_Client = 'YES' then 1 end) as Closed_Clients,
    concat(cast(round(sum(Funded_Amount) / 1000000, 2) as char(40)), ' M') as Total_Funded_Amount,
    round(avg(Int_Rate), 2) as Avg_Int_Rate,
    concat(cast(round((count(case when Is_Delinquent_Loan = 'Y' then 1 end) / count(*)) * 100,2) as char(40)), ' %') as Delinquent_Loan_Rate,
    concat(cast(round((count(case when Is_Default_Loan = 'Y' then 1 end) / count(*)) * 100,2) as char(40)),' %') as Default_Loan_Rate
from bank
group by Bank_Name
order by Bank_Name desc;




# ------ --------------------------------------------------------Stored Procedure 3----------------------------------------------------------------------------------------
delimiter \\
create procedure Bank_Wise_Analysis(in Bank_list varchar(255))
begin


select * from Bank_Wise_KPI_Report
where find_in_set(Bank_Name, Bank_list);


select Bank_Name,State_Name, concat(cast(round(sum(Funded_Amount)/1000000, 2) as char(40)), ' M') as Total_Funded_Amount from bank
where find_in_set(Bank_Name, Bank_list)
group by Bank_Name,State_Name
order by Bank_Name desc, sum(Funded_Amount) desc;


select Bank_Name,Age, concat(cast(round(sum(Funded_Amount)/1000000, 2) as char(40)), ' M') as Total_Funded_Amount from bank
where find_in_set(Bank_Name, Bank_list)
group by Bank_Name,Age
order by Bank_Name desc, sum(Funded_Amount) desc;


select Bank_Name,Region_Name, concat(cast(round(sum(Funded_Amount)/1000000, 2) as char(40)), ' M') as Total_Funded_Amount from bank
where find_in_set(Bank_Name, Bank_list)
group by Bank_Name,Region_Name
order by Bank_Name desc, sum(Funded_Amount) desc;


select Bank_Name,Religion, concat(cast(round(sum(Funded_Amount)/1000000, 2) as char(40)), ' M') as Total_Funded_Amount from bank
where find_in_set(Bank_Name, Bank_list)
group by Bank_Name,Religion
order by Bank_Name desc, sum(Funded_Amount) desc;


select Bank_Name,Purpose_Category, concat(cast(round(sum(Funded_Amount)/1000000, 2) as char(40)), ' M') as Total_Funded_Amount from bank
where find_in_set(Bank_Name, Bank_list)
group by Bank_Name,Purpose_Category
order by Bank_Name desc, sum(Funded_Amount) desc
limit 10;


select Bank_Name, concat(cast(round(sum(Loan_Amount) / 1000000, 2) as char(40)), ' M') as Total_Loan_Amount, concat(cast(round(sum(Funded_Amount) / 1000000, 2) as char(40)), ' M') as Total_Funded_Amount,((sum(Loan_Amount) - sum(Funded_Amount)) / sum(Loan_Amount)) * 100 as `Diff_in_%`, count(Account_ID) as Total_Loan_Count from bank
where find_in_set(Bank_Name, Bank_list)
group by Bank_Name
order by Bank_Name desc, Total_Loan_Count desc;


end\\
delimiter ;





-- Procedure Call
call Bank_Wise_Analysis('102-DBS,301-DBS');











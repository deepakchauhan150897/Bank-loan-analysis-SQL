    -- KPI1 Sum of Year wise loan amount statics.
    select Year(issue_d) As Loan_Year,
    sum(loan_amnt) as Total_loan_amount
    From finance_1
    group by Year(issue_d)
    Order by Sum(loan_amnt);

-- KPI2 Grade & Sub_grade wise revolving Balance.
Select f1.grade, f1.sub_grade,
	   Sum(f2.revol_bal) As Total_Revol_Balance
       From finance_1 f1
       Join finance_2 f2
on f1.id= f2.id
Group by f1.grade,
        f1.sub_grade
        Order By f1.Grade,
        f1.sub_grade;
        
 -- KPI3 Total Payment for Verified Status Vs Total Payment for Non Verified Status.
 Select Case when f1.verification_status In('verified', 'source_verfied') Then 'verified'
 else 'Non_verified'
 End as verification_group,
  Sum(f2.total_pymnt) as Total_Payment
 From finance_1 f1
 Join finance_2 f2
 on f1.id= f2.id
 Group by Case when f1.verification_status In('verified', 'source_verfied') Then 'verified' else 'Non_verified'
 End 
 order by Total_payment;
 
 -- KPI4 State wise and last_credit_pull_d wise loan status.
SELECT
    f1.addr_state,
    f2.last_credit_pull_d,
    f1.loan_status,
    COUNT(*) AS total_loans
FROM finance_1 f1
JOIN finance_2 f2
    ON f1.id = f2.id
GROUP BY
    f1.addr_state,
    f2.last_credit_pull_d,
    f1.loan_status
ORDER BY
    f1.addr_state,
    f2.last_credit_pull_d,
    f1.loan_status;
    -- KPI5 Home ownership Vs last payment date stats.
    select
    f1.home_ownership,
    f2.last_pymnt_d,
    count(*) as total_loans
    from finance_1 f1
    Join finance_2 f2
    on f1.id= f2.id
	Group by 
    f1.home_ownership,
    f2.last_pymnt_d
order by f1.home_ownership,
    f2.last_pymnt_d desc;

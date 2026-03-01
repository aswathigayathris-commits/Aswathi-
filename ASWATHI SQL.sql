SELECT Name 
FROM `data`.`ecommerce_revenue`;

SELECT  
    Country,  
    AVG(Revenue) as Average_Revenue,  
    SUM(Revenue) as Total_Revenue, 
    COUNT(*) as Company_Count 
FROM `data`.ecommerce_revenue 
GROUP BY Country 
HAVING Company_Count > 5 
ORDER BY Total_Revenue DESC;

SELECT  
    Country,  
    SUM(Revenue) as Total_Revenue, 
    AVG(Revenue) as Average_Order_Value,  
    COUNT(*) as Order_Count 
FROM `data`.ecommerce_revenue 
GROUP BY Country 
ORDER BY Total_Revenue DESC;

Yearly Revenue Summary (CTE) 
WITH YearlyRevenue AS ( 
    SELECT  
        Country,  
        EXTRACT(YEAR FROM Order_Date) as Sales_Year, 
        SUM(Revenue) as Annual_Revenue 
    FROM `data`.ecommerce_revenue 
    GROUP BY Country, Sales_Year 
)

Yearly Revenue Summary (CTE) 
WITH YearlyRevenue AS ( 
    SELECT  
        Country,  
        EXTRACT(YEAR FROM Order_Date) as Sales_Year, 
        SUM(Revenue) as Annual_Revenue 
    FROM `data`.ecommerce_revenue 
    GROUP BY Country, Sales_Year 
)

LAG(Annual_Revenue) OVER (PARTITION BY Country ORDER BY Sales_Year)

ROUND(((Annual_Revenue - LAG(Annual_Revenue) OVER (PARTITION BY Country 
ORDER BY Sales_Year)) /  
NULLIF(LAG(Annual_Revenue) OVER (PARTITION BY Country ORDER BY Sales_Year), 0)) 
* 100, 2) 
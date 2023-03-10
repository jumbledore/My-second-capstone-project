
-- SELECT countryregioncode, name, SUM(orderqty)FROM main_6
-- GROUP BY countryregioncode, name
-- ORDER BY SUM(orderqty) DESC

-- 2) Find which subcategory product is the most popular
-- SELECT productsubcategoryname, SUM(orderqty) FROM main_6
-- GROUP BY productsubcategoryname
-- ORDER BY SUM(orderqty) DESC

-- -- 3) To find out actionable insight.
SELECT 
productsubcategoryname,
countryregioncode,
Count(sales.salesreason.reasontype) AS reasoncount,
sales.salesreason.name as salesreason,
sales.salesreason.reasontype
FROM main_6
INNER JOIN sales.salesorderheadersalesreason
ON sales.salesorderheadersalesreason.salesorderid = main_6.salesorderid
INNER JOIN sales.salesreason 
ON sales.salesorderheadersalesreason.salesreasonid = sales.salesreason.salesreasonid
WHERE countryregioncode = 'US'
GROUP BY productsubcategoryname, countryregioncode,sales.salesreason.name, sales.salesreason.reasontype
ORDER by reasoncount DESC



SELECT USER_ID, PRODUCT_ID
FROM ONLINE_SALE S
GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(*) > 1
ORDER BY 1 ASC, PRODUCT_ID DESC
;

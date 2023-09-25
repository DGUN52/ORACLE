SELECT CART_ID
FROM (
    SELECT DISTINCT CART_ID
    FROM CART_PRODUCTS
    WHERE NAME='Milk'
    UNION ALL
    SELECT DISTINCT CART_ID
    FROM CART_PRODUCTS
    WHERE NAME='Yogurt'
    ) T
GROUP BY CART_ID
HAVING COUNT(CART_ID)=2
ORDER BY 1
;

-- # SELECT CART_ID
-- # FROM CART_PRODUCTS
-- # WHERE NAME = 'Milk' OR NAME = 'Yogurt'
-- # GROUP BY CART_ID
-- # HAVING COUNT(DISTINCT NAME) = 2
-- # ORDER BY 1
-- # ;




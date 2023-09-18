SELECT 
    P.MEMBER_NAME
    , R.REVIEW_TEXT
    , TO_CHAR(R.REVIEW_DATE,'yyyy-mm-dd') REVIEW_DATE
FROM
    MEMBER_PROFILE P
    , REST_REVIEW R
    , (
        SELECT MEMBER_ID
        FROM (
            SELECT MEMBER_ID, COUNT(*)
            FROM REST_REVIEW
            GROUP BY MEMBER_ID
            ORDER BY 2 DESC
            )
        WHERE ROWNUM<=1
    ) MOST
WHERE 
    P.MEMBER_ID = R.MEMBER_ID
    AND P.MEMBER_ID = MOST.MEMBER_ID
ORDER BY
    3 ASC,
    2 ASC
;

/*
SELECT 
    P.MEMBER_NAME
    , R.REVIEW_TEXT
    , TO_CHAR(R.REVIEW_DATE,'yyyy-mm-dd') REVIEW_DATE
FROM
    MEMBER_PROFILE P
    , REST_REVIEW R
WHERE 
    P.MEMBER_ID = R.MEMBER_ID
    AND P.MEMBER_ID = (
        SELECT MEMBER_ID
        FROM (
            SELECT MEMBER_ID, COUNT(*)
            FROM REST_REVIEW
            GROUP BY MEMBER_ID
            ORDER BY 2 DESC
            )
        WHERE ROWNUM<=1
    )
ORDER BY
    3 ASC,
    2 ASC
;
*/

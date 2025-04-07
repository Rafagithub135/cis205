-- RETURNS SAILORS WHO RENTED A RED BOAT OR A GREEN BOAT.
SELECT sid, sname
FROM sailor
JOIN reservations
ON sid = sid_FK
JOIN boat
ON bid = bid_FK
WHERE
    color = "red"
-- CAN USE OR COLOR = "GREEN" AFTER FIRST DECLARATION UNDER WHERE CLAUSE.
UNION
SELECT sid, sname
FROM sailor
         JOIN reservations
              ON sid = sid_FK
         JOIN boat
              ON bid = bid_FK
WHERE
    color = "green";

-- RETURNS SAILORS WHO RENTED A RED BOAT AND A GREEN BOAT.
SELECT sid, sname
FROM sailor
         JOIN reservations
              ON sid = sid_FK
         JOIN boat
              ON bid = bid_FK
WHERE
    color = "red"
AND sid IN
(
    SELECT sid
    FROM sailor
             JOIN reservations
                  ON sid = sid_FK
             JOIN boat
                  ON bid = bid_FK
    WHERE
        color = "green"
    );

-- RETURNS SAILORS WHO RENTED A RED BOAT, BUT NOT A GREEN BOAT.
SELECT sid, sname
FROM sailor
         JOIN reservations
              ON sid = sid_FK
         JOIN boat
              ON bid = bid_FK
WHERE
    color = "red"
  AND sid NOT IN
      (
          SELECT sid
          FROM sailor
                   JOIN reservations
                        ON sid = sid_FK
                   JOIN boat
                        ON bid = bid_FK
          WHERE
              color = "green"
      );
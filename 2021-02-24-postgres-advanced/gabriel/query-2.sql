SELECT m0.username, m0.first_message
    FROM (
        SELECT m1.id, m1.username, m1.message,
        (
            SELECT MIN(m1.id)
            FROM message m2
            WHERE m2.username = m1.username
            AND NOT EXISTS (
                SELECT 1 
                FROM message m3
                WHERE m3.username <> m2.username
            )
        ) first_message
        FROM message m1
    ) m0 
GROUP BY m0.username;
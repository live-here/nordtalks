SELECT m1.username, m1.message
FROM message m1
LEFT JOIN message m2 ON (
    m1.username = m2.username AND m1.id < m2.id
)
WHERE m2.id IS NULL;
# SQL Schema
# Pandas Schema
# Table: Person

# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | personId    | int     |
# | lastName    | varchar |
# | firstName   | varchar |
# +-------------+---------+
# personId is the primary key (column with unique values) for this table.
# This table contains information about the ID of some persons and their first and last names.


SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId;

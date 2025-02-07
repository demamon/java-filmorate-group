MERGE INTO mpa AS target
USING (
    VALUES ('G'), ('PG'), ('PG-13'), ('R'), ('NC-17')
) AS source (name)
ON target.name = source.name
WHEN MATCHED THEN
    UPDATE SET name = source.name
WHEN NOT MATCHED THEN
    INSERT (name) VALUES (source.name);

MERGE INTO genres AS target
USING (
    VALUES ('Комедия'), ('Драма'), ('Мультфильм'), ('Триллер'), ('Документальный'), ('Боевик')
) AS source (name)
ON target.name = source.name
WHEN MATCHED THEN
    UPDATE SET name = source.name
WHEN NOT MATCHED THEN
    INSERT (name) VALUES (source.name);


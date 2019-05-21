CREATE TABLE "cohort" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(25),
  "start_date" DATE
);

CREATE TABLE "student" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "cohort_id" INT REFERENCES "cohort"
);

INSERT INTO "cohort" ("name", "start_date")
VALUES ('Enhydra', '4/15/2019'),
('Isurus', '7/29/2019');


INSERT INTO "student" ("name", "cohort_id")
VALUES ('Austin', 1),
('Devon', 1),
('Cory', 1),
('Isaac', 1),
('Konou', 1);

INSERT INTO "student" ("name", "cohort_id")
VALUES ('James', 2),
('Ellen', 2);

-- Select all cohorts, but no student info
SELECT * FROM "cohort";


-- Select everyone, but not their cohort info
SELECT * FROM "student";

-- Select everyone and see their cohort
SELECT * FROM "student"
JOIN "cohort" ON "cohort"."id"="student"."cohort_id";

-- Counting

SELECT count(*) FROM "student";

SELECT count(*) FROM "student"
JOIN "cohort" ON "cohort"."id"="student"."cohort_id"
WHERE "cohort"."name" = 'Enhydra';


SELECT "cohort"."name", count(*) FROM "student"
JOIN "cohort" ON "cohort"."id"="student"."cohort_id"
GROUP BY "cohort"."name";

SELECT count(*) FROM "student"
JOIN "cohort" ON "cohort"."id"="student"."cohort_id"
WHERE "cohort"."name" = 'Enhydra'
ORDER BY "student"."name" DESC;
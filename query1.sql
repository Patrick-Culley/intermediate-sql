CREATE OR REPLACE TABLE client (
    id int(11) AUTO_INCREMENT, 
    first_name varchar(255) NOT NULL, 
    last_name varchar(255) NOT NULL, 
    email varchar(255) NOT NULL, 
    PRIMARY KEY(id),
    CONSTRAINT full_name UNIQUE(first_name, last_name)
);

CREATE OR REPLACE TABLE employee (
    id int(11) AUTO_INCREMENT, 
    first_name varchar(255) NOT NULL, 
    last_name varchar(255) NOT NULL,
    start_date DATE NOT NULL,
    email varchar(255) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT full_name UNIQUE(first_name, last_name)
);

CREATE OR REPLACE TABLE project (
    id int(11) AUTO_INCREMENT, 
    title varchar(255) NOT NULL UNIQUE, 
    comments TEXT, 
    cid int, 
    PRIMARY KEY(id), 
    FOREIGN KEY(cid) REFERENCES client(id)
);

CREATE OR REPLACE TABLE works_on (
    pid int,
    eid int, 
    due_date DATE NOT NULL, 
    FOREIGN KEY(pid) REFERENCES project(id), 
    FOREIGN KEY(eid) REFERENCES employee(id), 
    PRIMARY KEY(eid, pid)
);

-- Leave the queries below untouched. These are to test your submission correctly.
-- Test that the tables were created
DESCRIBE client;
DESCRIBE employee;
DESCRIBE project;
DESCRIBE works_on;

-- Test that the correct foreign keys were created 
SELECT TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME,REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME 
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE REFERENCED_TABLE_SCHEMA = 'grade';


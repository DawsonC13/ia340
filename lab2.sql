-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS professor
(
    p_email VARCHAR(50) NOT NULL,
    p_name VARCHAR(50) NOT NULL,
    office VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY(p_email)
);

CREATE TABLE IF NOT EXISTS student
(
    p_email VARCHAR(50) NOT NULL,
    p_name VARCHAR(50) NOT NULL,
    major VARCHAR(20) NOT NULL,
    PRIMARY KEY(p_email)
);

CREATE TABLE IF NOT EXISTS course
(
    c_number VARCHAR(20) NOT NULL,
    c_name VARCHAR(50) NOT NULL,
    room VARCHAR(20) NOT NULL UNIQUE,
    p_email VARCHAR(50) NOT NULL,
    PRIMARY KEY(c_number)
);

CREATE TABLE IF NOT EXISTS enroll
(
    c_number VARCHAR(20) NOT NULL,
    p_email VARCHAR(50) NOT NULL,
    PRIMARY KEY(c_number, p_email)
);


-- Create FKs
ALTER TABLE professor
    ADD    FOREIGN KEY (p_email)
    REFERENCES course(p_email)
    MATCH SIMPLE
;
    
ALTER TABLE enroll
    ADD    FOREIGN KEY (c_number)
    REFERENCES course(c_number)
    MATCH SIMPLE
;
    
ALTER TABLE enroll
    ADD    FOREIGN KEY (p_email)
    REFERENCES student(p_email)
    MATCH SIMPLE
;
    

-- Create Indexes


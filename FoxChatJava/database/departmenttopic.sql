BEGIN;

CREATE SEQUENCE seq_department_id;
CREATE TABLE department
(
department_id integer NOT NULL DEFAULT nextval('seq_department_id'),
department_name varchar(120) NOT NULL,

CONSTRAINT pk_department PRIMARY KEY (department_id)
);

CREATE SEQUENCE seq_topic_id;
CREATE TABLE topic
(
id integer NOT NULL DEFAULT nextval('seq_topic_id'),
topic_name varchar(120) NOT NULL,
department_id integer NOT NULL,
primary_words varchar(120),
response varchar(260) NOT NULL,
description varchar(260) NOT NULL,

CONSTRAINT pk_topic PRIMARY KEY (id),
CONSTRAINT fk_topic_department FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE SEQUENCE seq_subtopic_id;
CREATE TABLE sub_topic
(
id integer NOT NULL DEFAULT nextval('seq_subtopic_id'),
topic_name varchar(120) NOT NULL,
parent_id integer NOT NULL,
primary_words varchar(120),
response varchar(260) NOT NULL,
description varchar(260) NOT NULL,


CONSTRAINT pk_sub_topic PRIMARY KEY (id),
CONSTRAINT fk_sub_topic_topic FOREIGN KEY (parent_id) REFERENCES topic(id)
);



INSERT INTO department (department_name) VALUES ('Curriculum');
INSERT INTO department (department_name) VALUES ('Motivation');
INSERT INTO department (department_name) VALUES ('Pathway');


ROLLBACK;
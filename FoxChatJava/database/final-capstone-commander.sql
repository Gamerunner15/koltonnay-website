BEGIN;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS quotes;
DROP TABLE IF EXISTS keywords_topics;
DROP TABLE IF EXISTS links_topics;
DROP TABLE IF EXISTS links;
DROP TABLE IF EXISTS sub_sub_topics;
DROP TABLE IF EXISTS sub_topics;
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS keywords;



DROP SEQUENCE IF EXISTS seq_user_id;
DROP SEQUENCE IF EXISTS seq_topics_id;
DROP SEQUENCE IF EXISTS seq_quote_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_topics_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_quote_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE departments (
  id serial,
  department_name varchar(64) NOT NULL,
  department_keyword varchar(64) NOT NULL,
  message varchar (260),
  
  CONSTRAINT pk_departments PRIMARY KEY (id)

);


CREATE TABLE topics (
  id integer NOT NULL DEFAULT nextval('seq_topics_id'),
  topic_name varchar(64) NOT NULL,
  department_id integer NOT NULL,
  message varchar(300) NOT NULL,

  
  CONSTRAINT pk_topics PRIMARY KEY (id),
  CONSTRAINT fk_topics_departments FOREIGN KEY (department_id) REFERENCES departments(id)

);


/*
CREATE TABLE links_topics
(
link_id integer NOT NULL,
topic_id integer NOT NULL,

CONSTRAINT
);
*/


CREATE TABLE sub_topics (
  id serial,
  sub_topic_name varchar(64) NOT NULL,
  topic_id integer NOT NULL,
  message varchar(260) NOT NULL,
  
  
  CONSTRAINT pk_sub_topics PRIMARY KEY (id),
  CONSTRAINT fk_sub_topics_topics FOREIGN KEY (topic_id) REFERENCES topics(id)
);
/*

CREATE TABLE sub_sub_topics (
  id integer NOT NULL DEFAULT nextval('seq_topics_id'),
  sub_sub_topic_name varchar(64) NOT NULL,
  subtopic_id integer NOT NULL,
  message varchar(260) NOT NULL,
  bubble_text varchar(64) NOT NULL,

  CONSTRAINT pk_sub_sub_topics PRIMARY KEY (id),
  CONSTRAINT fk_sub_sub_topics_sub_topics FOREIGN KEY (subtopic_id) REFERENCES sub_topics(id)
);

*/
CREATE TABLE links (
  id serial,
  link_body varchar(200) NOT NULL,
  link_name varchar(120) NOT NULL,
  
  CONSTRAINT pk_links PRIMARY KEY (id)
  
);

CREATE TABLE links_topics
(
link_id integer,
topic_id integer,

CONSTRAINT pk_links_topics PRIMARY KEY (link_id, topic_id),
CONSTRAINT fk_links_topics_links FOREIGN KEY (link_id) REFERENCES links(id),
CONSTRAINT fk_links_topics_topics FOREIGN KEY (topic_id) REFERENCES topics(id)
);

CREATE TABLE keywords (

  id serial,
  word varchar(64) NOT NULL,
  
  CONSTRAINT pk_keywords PRIMARY KEY (id)

);

CREATE TABLE keywords_topics (
 topic_id integer NOT NULL,
 keyword_id integer NOT NULL,
 
 CONSTRAINT pk_keywords_topics PRIMARY KEY (topic_id, keyword_id),
 CONSTRAINT fk_keywords_topics_topics FOREIGN KEY (topic_id) REFERENCES topics(id),
 CONSTRAINT fk_keywords_topics_keywords FOREIGN KEY (keyword_id) REFERENCES keywords(id)
);


CREATE TABLE IF NOT EXISTS quotes (
id integer NOT NULL DEFAULT nextval('seq_quote_id'),
quote_body varchar(260),

CONSTRAINT pk_quote PRIMARY KEY (id)
);


-----------------------------------------------------INSERTS-------------------------------------------------

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
-------------------QUOTES INSERTS
INSERT INTO quotes (quote_body) VALUES ('"If you want to achieve greatness stop asking for permission." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"Things work out best for those who make the best of how things work out." --John Wooden');
INSERT INTO quotes (quote_body) VALUES ('"To live a creative life, we must lose our fear of being wrong." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"If you are not willing to risk the usual you will have to settle for the ordinary." --Jim Rohn');
INSERT INTO quotes (quote_body) VALUES ('"Trust because you are willing to accept the risk, not because it''s safe or certain." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"Take up one idea. Make that one idea your life--think of it, dream of it, live on that idea." --Swami Vivekananda');
INSERT INTO quotes (quote_body) VALUES ('"All our dreams can come true if we have the courage to pursue them." --Walt Disney');
INSERT INTO quotes (quote_body) VALUES ('"Good things come to people who wait, but better things come to those who go out and get them." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"If you do what you always did, you will get what you always got." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"Success is walking from failure to failure with no loss of enthusiasm." --Winston Churchill');
INSERT INTO quotes (quote_body) VALUES ('"Just when the caterpillar thought the world was ending, he turned into a butterfly." --Proverb');
INSERT INTO quotes (quote_body) VALUES ('"Successful entrepreneurs are givers and not takers of positive energy." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"Whenever you see a successful person you only see the public glories, never the private sacrifices to reach them." --Vaibhav Shah');
INSERT INTO quotes (quote_body) VALUES ('"Opportunities don''t happen, you create them." --Chris Grosser');
INSERT INTO quotes (quote_body) VALUES ('"Try not to become a person of success, but rather try to become a person of value." --Albert Einstein');
INSERT INTO quotes (quote_body) VALUES ('"Great minds discuss ideas; average minds discuss events; small minds discuss people." --Eleanor Roosevelt');
INSERT INTO quotes (quote_body) VALUES ('"I have not failed. I''ve just found 10,000 ways that won''t work." --Thomas A. Edison');
INSERT INTO quotes (quote_body) VALUES ('"If you don''t value your time, neither will others. Stop giving away your time and talents--start charging for it." --Kim Garst');
INSERT INTO quotes (quote_body) VALUES ('"A successful man is one who can lay a firm foundation with the bricks others have thrown at him." --David Brinkley');
INSERT INTO quotes (quote_body) VALUES ('"No one can make you feel inferior without your consent." --Eleanor Roosevelt');
INSERT INTO quotes (quote_body) VALUES ('"The whole secret of a successful life is to find out what is one''s destiny to do, and then do it." --Henry Ford');
INSERT INTO quotes (quote_body) VALUES ('"If you''re going through hell keep going." --Winston Churchill');
INSERT INTO quotes (quote_body) VALUES ('"The ones who are crazy enough to think they can change the world, are the ones who do." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"Don''t raise your voice, improve your argument." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"What seems to us as bitter trials are often blessings in disguise." --Oscar Wilde');
INSERT INTO quotes (quote_body) VALUES ('"The meaning of life is to find your gift. The purpose of life is to give it away." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"The distance between insanity and genius is measured only by success." --Bruce Feirstein');
INSERT INTO quotes (quote_body) VALUES ('"When you stop chasing the wrong things, you give the right things a chance to catch you." --Lolly Daskal');
INSERT INTO quotes (quote_body) VALUES ('"I believe that the only courage anybody ever needs is the courage to follow your own dreams." --Oprah Winfrey');
INSERT INTO quotes (quote_body) VALUES ('"No masterpiece was ever created by a lazy artist." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"Happiness is a butterfly, which when pursued, is always beyond your grasp, but which, if you will sit down quietly, may alight upon you." --Nathaniel Hawthorne');
INSERT INTO quotes (quote_body) VALUES ('"If you can''t explain it simply, you don''t understand it well enough." --Albert Einstein');
INSERT INTO quotes (quote_body) VALUES ('"Blessed are those who can give without remembering and take without forgetting." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"Do one thing every day that scares you." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"What''s the point of being alive if you don''t at least try to do something remarkable." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"Life is not about finding yourself. Life is about creating yourself." --Lolly Daskal');
INSERT INTO quotes (quote_body) VALUES ('"Nothing in the world is more common than unsuccessful people with talent." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"Knowledge is being aware of what you can do. Wisdom is knowing when not to do it." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"Your problem isn''t the problem. Your reaction is the problem." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"You can do anything, but not everything." --Anonymous');
INSERT INTO quotes (quote_body) VALUES ('"Innovation distinguishes between a leader and a follower." --Steve Jobs');
INSERT INTO quotes (quote_body) VALUES ('"There are two types of people who will tell you that you cannot make a difference in this world: those who are afraid to try and those who are afraid you will succeed." --Ray Goforth');
INSERT INTO quotes (quote_body) VALUES ('"Thinking should become your capital asset, no matter whatever ups and downs you come across in your life." --A.P.J. Abdul Kalam');
INSERT INTO quotes (quote_body) VALUES ('"I find that the harder I work, the more luck I seem to have." --Thomas Jefferson');
INSERT INTO quotes (quote_body) VALUES ('"The starting point of all achievement is desire." --Napoleon Hill');
INSERT INTO quotes (quote_body) VALUES ('"Success is the sum of small efforts, repeated day-in and day-out." --Robert Collier');
INSERT INTO quotes (quote_body) VALUES ('"If you want to achieve excellence, you can get there today. As of this second, quit doing less-than-excellent work." --Thomas J. Watson');
INSERT INTO quotes (quote_body) VALUES ('"All progress takes place outside the comfort zone." --Michael John Bobak');
INSERT INTO quotes (quote_body) VALUES ('"You may only succeed if you desire succeeding; you may only fail if you do not mind failing." --Philippos');
INSERT INTO quotes (quote_body) VALUES ('"Courage is resistance to fear, mastery of fear--not absence of fear." --Mark Twain');
-------------------DEPARTMENTS INSERTS
INSERT INTO departments (department_name, department_keyword, message) VALUES ('Pathway', 'pathway', 'For help with pathway you can ask me things such as... "I need help with interviews" or "Please help with my resume!"');
INSERT INTO departments (department_name, department_keyword, message) VALUES ('Curriculum', 'curriculum', 'Try asking for help with things such as data types, loops, or arrays');
INSERT INTO departments (department_name, department_keyword) VALUES ('Motivation', 'motivation');
-------------------Topics INSERTS
-- INSERT INTO topics (topic_name, department_id, message) VALUES ();
INSERT INTO topics (topic_name, department_id, message) VALUES ('Array', 2, 'Arrays can hold primitives and strings. Creation: {Type}[] {name} = new {Type}[{Number of Indexes}];');
INSERT INTO topics (topic_name, department_id, message) VALUES ('Map', 2, 'Maps have a Key and a Value and must contain objects (not primitives). Creation: Map<{Type}> {name} = new HashMap<{Type}>();');
INSERT INTO topics (topic_name, department_id, message) VALUES ('Interview', 1, 'Interview prep should include katas, behavioral question practice, elevator pitch practice, and resume review.');
INSERT INTO topics (topic_name, department_id, message) VALUES ('Data Types', 2, 'Every variable, when created, is defined with a data type. A data type classifies the variable and indicates the type of data that a particular variable holds.');
INSERT INTO topics (topic_name, department_id, message) VALUES ('Primitive Data Types', 2, 'A primitive data type stores a simple value like 42, true, or a, that consumes a fixed amount of memory.');
INSERT INTO topics (topic_name, department_id, message) VALUES ('Variables', 2, 'Programmers use variables to store data. This allows them to write their code in a generic and reusable manner. A variable must identify what type of data it stores, be declared before it is used, be given a unique name when it is declared.');
INSERT INTO topics (topic_name, department_id, message) VALUES ('Loops', 2, 'A loop is a sequence of instructions that is repeated until a certain condition is met. Types of loops: for-loop, while-loop, do-while-loop');
INSERT INTO topics (topic_name, department_id, message) VALUES ('STAR Model', 1, 'The STAR answer model is a technique for answering behavioral questions during interviews.');
INSERT INTO topics (topic_name, department_id, message) VALUES ('Resume', 1, 'On your resume: use keywords, don''t overcomplicate the format, and save it as a plain text file.');
INSERT INTO topics (topic_name, department_id, message) VALUES ('LinkedIn', 1, 'Keep your LinkedIn professional, keep it updated, post and create content, and consider LinkedIn Premium');
INSERT INTO topics (topic_name, department_id, message) VALUES ('ArrayList', 2, 'A resizable array that can be found in the java.util package');
-------------------SubTopics INSERTS
--INSERT INTO sub_topics (sub_topic_name, topic_id, message) VALUES ('', , '');
INSERT INTO sub_topics (sub_topic_name, topic_id, message) VALUES ('Create', 11, 'First, import the class with "import java.util.ArrayList;." Then, create an ArrayList object -> "ArrayList<String> students = new ArrayList<String>();"');
INSERT INTO sub_topics (sub_topic_name, topic_id, message) VALUES ('Add', 11, 'Items can be added to an ArrayList. To do this, use the add() method. Example: students.add("Jay")');
INSERT INTO sub_topics (sub_topic_name, topic_id, message) VALUES ('Change', 11, 'To change an element in an ArrayList, use the set() method by passing in the index and the desired modification. Example: students.set(0, "Kolton")');
INSERT INTO sub_topics (sub_topic_name, topic_id, message) VALUES ('Remove', 11, 'Items can be removed from an ArrayList. The remove() method removes a specific element, example: students.remove(0). The clear() method removes all elements, example: students.clear()');
INSERT INTO sub_topics (sub_topic_name, topic_id, message) VALUES ('Get Size', 11, 'To find the size of an ArrayList, use the size() method. Example students.size()');
-------------------keywords INSERTS
-- INSERT INTO keywords (word) VALUES ('');
INSERT INTO keywords (word) VALUES ('data');
INSERT INTO keywords (word) VALUES ('primitive');
INSERT INTO keywords (word) VALUES ('array');
INSERT INTO keywords (word) VALUES ('interview');
INSERT INTO keywords (word) VALUES ('variable');
INSERT INTO keywords (word) VALUES ('loops');
INSERT INTO keywords (word) VALUES ('map');
INSERT INTO keywords (word) VALUES ('primitives');
INSERT INTO keywords (word) VALUES ('arrays');
INSERT INTO keywords (word) VALUES ('interviews');
INSERT INTO keywords (word) VALUES ('variables');
INSERT INTO keywords (word) VALUES ('loop');
INSERT INTO keywords (word) VALUES ('maps');
INSERT INTO keywords (word) VALUES ('star');
INSERT INTO keywords (word) VALUES ('resume');
INSERT INTO keywords (word) VALUES ('linkedin');
INSERT INTO keywords (word) VALUES ('list');
INSERT INTO keywords (word) VALUES ('arraylist');
INSERT INTO keywords (word) VALUES ('lists');
-------------------keywords_topic INSERTS
--INSERT INTO keywords_topics (topic_id, keyword_id) VALUES ();
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (4, 1);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (5, 2);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (1, 3);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (2, 7);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (3, 4);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (6, 5);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (7, 6);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (5, 1);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (5, 8);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (1, 9);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (3, 10);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (6, 11);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (7, 12);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (2, 13);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (8, 14);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (9, 15);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (10, 16);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (11, 3);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (11, 17);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (11, 9);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (11, 18);
INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (11, 19);
--------------links INSERTS
--INSERT INTO links (link_body, link_name) VALUES ('');
INSERT INTO links (link_body, link_name) VALUES ('https://book.techelevator.com/content/arrays-and-loops-ool.html#arrays', 'TE Book: Arrays');
INSERT INTO links (link_body, link_name) VALUES ('https://www.geeksforgeeks.org/map-interface-java-examples/', 'Geeks for Geeks: Maps');
INSERT INTO links (link_body, link_name) VALUES ('https://www.indeed.com/career-advice/interviewing/how-to-use-the-star-interview-response-technique', 'Indeed: Interview Help');
INSERT INTO links (link_body, link_name) VALUES ('https://book.techelevator.com/content/introduction-to-programming-ool.html#data-types', 'TE Book: Data Types');
INSERT INTO links (link_body, link_name) VALUES ('https://en.wikipedia.org/wiki/Primitive_data_type', 'Wiki: Primitives');
INSERT INTO links (link_body, link_name) VALUES ('https://book.techelevator.com/content/introduction-to-programming-ool.html#variables', 'TE Book: Variables');
INSERT INTO links (link_body, link_name) VALUES ('https://book.techelevator.com/content/arrays-and-loops-ool.html#loops', 'TE Book: Loops');
INSERT INTO links (link_body, link_name) VALUES ('https://github.com/yangshun/tech-interview-handbook', 'GitHub: Tech Interview Handbook');
INSERT INTO links (link_body, link_name) VALUES ('https://www.interviewcake.com/', 'Interview Cake: Tech Interview Prep');
INSERT INTO links (link_body, link_name) VALUES ('https://www.glassdoor.com/blog/anatomy-perfect-resume/', 'Glassdoor: The Perfect Resume');
INSERT INTO links (link_body, link_name) VALUES ('https://www.indeed.com/hire/c/info/star-interview-format?aceid=&gclid=CjwKCAjw97P5BRBQEiwAGflV6eTVAR9a5Lkc4JkfHzCKmWT6ejmx84hQ0na_pGekERmXZxdDGm3ByxoC55UQAvD_BwE', 'Indeed: STAR Interview Format');
INSERT INTO links (link_body, link_name) VALUES ('https://www.linkedin.com/help/linkedin/answer/112133/how-do-i-create-a-good-linkedin-profile-?lang=en', 'LinkedIn: How to craft a good profile');
INSERT INTO links (link_body, link_name) VALUES ('https://www.w3schools.com/java/java_arraylist.asp', 'W3schools: Java ArrayList');
--------------links_topics INSERTS
--INSERT INTO links_topics (link_id, topic_id) VALUES ();
INSERT INTO links_topics (link_id, topic_id) VALUES (1, 1);
INSERT INTO links_topics (link_id, topic_id) VALUES (2, 2);
INSERT INTO links_topics (link_id, topic_id) VALUES (3, 3);
INSERT INTO links_topics (link_id, topic_id) VALUES (4, 4);
INSERT INTO links_topics (link_id, topic_id) VALUES (5, 5);
INSERT INTO links_topics (link_id, topic_id) VALUES (6, 6);
INSERT INTO links_topics (link_id, topic_id) VALUES (7, 7);
INSERT INTO links_topics (link_id, topic_id) VALUES (8, 3);
INSERT INTO links_topics (link_id, topic_id) VALUES (9, 3);
INSERT INTO links_topics (link_id, topic_id) VALUES (10, 9);
INSERT INTO links_topics (link_id, topic_id) VALUES (11, 8);
INSERT INTO links_topics (link_id, topic_id) VALUES (12, 10);

ROLLBACK; 


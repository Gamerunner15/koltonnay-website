BEGIN;

CREATE SEQUENCE seq_quote_id;
CREATE TABLE IF NOT EXISTS quotes
(
quote_id integer NOT NULL DEFAULT nextval('seq_quote_id'),
quote_body varchar(260),

CONSTRAINT pk_quote PRIMARY KEY (quote_id)
);

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


COMMIT;
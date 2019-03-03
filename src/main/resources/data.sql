INSERT INTO JOB (NAME, JOB_NUMBER, JOB_INFO) VALUES ('ABC-Factory1x', '0001', '1');
INSERT INTO JOB (NAME, JOB_NUMBER, JOB_INFO) VALUES ('ABC-Factory2x', '0002', '2');
INSERT INTO JOB (NAME, JOB_NUMBER, JOB_INFO) VALUES ('ABC-Factory3x', '0003', '3');
INSERT INTO JOB (NAME, JOB_NUMBER, JOB_INFO) VALUES ('ABC-Factory4x', '0004', '4');
INSERT INTO JOB (NAME, JOB_NUMBER, JOB_INFO) VALUES ('ABC-Factory5x', '0005', '5');


INSERT INTO AGENT (TITLE) VALUES('agent-web-chrome');
INSERT INTO AGENT (TITLE) VALUES('agent-web-ie');
INSERT INTO AGENT (TITLE) VALUES('agent-api-client');
INSERT INTO AGENT (TITLE) VALUES('agent-api-cli');
INSERT INTO AGENT (TITLE) VALUES('agent-ci);

INSERT INTO PIPELINE (JOB_ID, AGENT_ID, BUILD_INFO) VALUES ((SELECT JOB_ID FROM JOB WHERE JOB_NUMBER = '0001'), (SELECT AGENT_ID FROM AGENT WHERE TITLE = 'abc-factory'), '2017-01-01');


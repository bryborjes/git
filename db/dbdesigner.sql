-- Check database exist and create
CREATE DATABASE IF NOT EXISTS 'agent';
USE 'agent';
CREATE TABLE IF NOT EXISTS 'Users'(
    'IDUser' varchar PRIMARY KEY NOT NULL,
    'NameUser' varchar NOT NULL,
    'Password' varchar NOT NULL,
    'PassModifier' date NOT NULL
);

CREATE TABLE IF NO EXISTS 'Client'(
    'IDClient' bigint PRIMARY KEY NOT NULL,
    'IDUser' varchar NOT NULL,
    'Name' varchar NOT NULL,
    'FirstName' varchar, 
    'LastName' varchar, 
    'E-mail' varchar NOT NULL, 
    'Cellphone' varchar,
    'Birthdate' date
);

CREATE TABLE IF NO EXISTS 'TaskManager'(
    'IDTask' Bigint PRIMARY KEY NOT NULL,
    'IDUser' varchar,
    'IDTaskType' int,
    'TaskDescription' text,
    'TaskDateRequired' date NOT NULL,
    'TaskDateCreate' date NOT NULL,
    'TaskDateFinished' date,
    'TaskState' bit
);

CREATE TABLE IF NOT EXISTS 'TaskType'(
    'IDTaskType' bigint
)
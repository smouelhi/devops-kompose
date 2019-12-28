SELECT datcollate FROM pg_database WHERE datname='jiradb'

select u.user_name, d.directory_name, u.email_address from cwd_user u inner join cwd_directory d on u.directory_id = d.id order by directory_name, user_name

update cwd_user set credential='uQieO/1CGMUIXXftw3ynrsaYLShI+GTcPS4LdUGWbIusFvHPfUzD7CZvms6yMMvA8I7FViHVEqr6Mj4pCLKAFQ==' where user_name='admin'

select group_id from globalpermissionentry where PERMISSION='ADMINISTER';

select group_id from globalpermissionentry where PERMISSION='SYSTEM_ADMIN';

update globalpermissionentry set group_id='jira-system-administrators' where permission='SYSTEM_ADMIN';
update globalpermissionentry set group_id='jira-administrators' where permission='ADMINISTER';
update globalpermissionentry set group_id='jira-users' where permission='USE';

insert into cwd_user values (999999,1,'localadmin','localadmin',1,'2012-01-04 19:49:05-08','2012-01-04 19:49:05-08','local','local','admin','admin','local admin','local admin','localadmin@localadmin.com','localadmin@localadmin.com','uQieO/1CGMUIXXftw3ynrsaYLShI+GTcPS4LdUGWbIusFvHPfUzD7CZvms6yMMvA8I7FViHVEqr6Mj4pCLKAFQ==',NULL,NULL);
insert into app_user values(999999,'localadmin','localadmin');

insert into cwd_group(id, group_name, lower_group_name, active, local, created_date, updated_date, description, lower_description, group_type, directory_id)
values ( '888888','jira-administrators','jira-administrators',1,0,'2011-03-21 12:20:29','2011-03-21 12:20:29',NULL,NULL,'GROUP',1);
insert into cwd_group(id, group_name, lower_group_name, active, local, created_date, updated_date, description, lower_description, group_type, directory_id)
values ( '777777','jira-users','jira-users',1,0,'2011-03-21 12:20:29','2011-03-21 12:20:29',NULL,NULL,'GROUP',1);

insert into globalpermissionentry (id, permission, group_id) values (555555,'SYSTEM_ADMIN','jira-administrators');
insert into globalpermissionentry (id, permission, group_id) values (444444,'ADMINISTER','jira-administrators');
insert into globalpermissionentry (id, permission, group_id) values (333333,'USE','jira-users');

insert into cwd_membership values (666666,888888,999999,'GROUP_USER','','jira-administrators','jira-administrators','localadmin','localadmin',1);
insert into cwd_membership values (555555,777777,999999,'GROUP_USER','','jira-users','jira-users','localadmin','localadmin',1);

update cwd_directory set active = 1 where id = 1;


select * from propertystring where id in (select id from propertyentry where PROPERTY_KEY='jira.sid.key')


SELECT PS.id, PS.propertyvalue, PE.propertytype, PE.property_key FROM propertystring AS PS
INNER JOIN propertyentry AS PE
ON PS.id = PE.id WHERE PS.propertyvalue LIKE '%localhost:8080%' AND PE.property_key LIKE '%app%';
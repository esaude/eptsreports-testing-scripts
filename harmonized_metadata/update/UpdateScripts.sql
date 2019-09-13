-- Start an instance of openmrs with a blank database.
-- The database will come with person attribute types
-- Modify the names to portugues
update person_attribute_type set name='Estado Civil' where uuid='8d871f2a-c2cc-11de-8d13-0010c6dffd0f';
update person_attribute_type set name='Nome da Mae' where uuid='8d871d18-c2cc-11de-8d13-0010c6dffd0f';
update person_attribute_type set name='Nacionalidade' where uuid='8d871afc-c2cc-11de-8d13-0010c6dffd0f';
update person_attribute_type set name='Raça' where uuid='8d871386-c2cc-11de-8d13-0010c6dffd0f';
update person_attribute_type set name='Local de Nascimento' where uuid='8d8718c2-c2cc-11de-8d13-0010c6dffd0f';
update person_attribute_type set name='Distrito' where uuid='e2e3fc10-1d5f-11e0-b929-000c29ad1d07';

-- Do desc person attribute types to see the last 2 fields



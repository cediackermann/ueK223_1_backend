-- UserProfiles
INSERT INTO user_profiles (id, address, birth_date, profile_picture_url)
VALUES ('ba804cb9-fa14-42a5-afaf-be488742fc54', '1234 Main St, Springfield, IL 62701', '1990-01-01', 'james_bond.jpg'),
       ('0d8fa44c-54fd-4cd0-ace9-2a7da57992de', '1234 Main St, Springfield, IL 62701', '1990-01-01', 'tyler_durden.jpg'),
       ('1d8fa44c-54fd-4cd0-ace9-2a7da57992de', '1234 Main St, Springfield, IL 62701', '1990-01-01', '123.jpg')
    ON CONFLICT DO NOTHING;

-- USERS
INSERT INTO users (id, email, first_name, last_name, password, user_profile_id)
VALUES ('ba804cb9-fa14-42a5-afaf-be488742fc54', 'admin@example.com', 'James', 'Bond', '$2a$10$TM3PAYG3b.H98cbRrHqWa.BM7YyCqV92e/kUTBfj85AjayxGZU7d6', 'ba804cb9-fa14-42a5-afaf-be488742fc54'), -- Password: 1234
       ('0d8fa44c-54fd-4cd0-ace9-2a7da57992de', 'user@example.com', 'Tyler', 'Durden', '$2a$10$TM3PAYG3b.H98cbRrHqWa.BM7YyCqV92e/kUTBfj85AjayxGZU7d6', '0d8fa44c-54fd-4cd0-ace9-2a7da57992de'), -- Password: 1234
       ('1d8fa44c-54fd-4cd0-ace9-2a7da57992de', '123@example.com', '123', '123', '$2a$10$TM3PAYG3b.H98cbRrHqWa.BM7YyCqV92e/kUTBfj85AjayxGZU7d6', '1d8fa44c-54fd-4cd0-ace9-2a7da57992de') -- Password: 1234
    ON CONFLICT DO NOTHING;

-- ROLES
INSERT INTO role (id, name)
VALUES ('d29e709c-0ff1-4f4c-a7ef-09f656c390f1', 'DEFAULT'),
       ('ab505c92-7280-49fd-a7de-258e618df074', 'ADMIN'),
       ('c6aee32d-8c35-4481-8b3e-a876a39b0c02', 'USER')
    ON CONFLICT DO NOTHING;

-- AUTHORITIES
INSERT INTO authority (id, name)
VALUES ('2ebf301e-6c61-4076-98e3-2a38b31daf86', 'DEFAULT'),
       ('76d2cbf6-5845-470e-ad5f-2edb9e09a868', 'USER_MODIFY'),
       ('21c942db-a275-43f8-bdd6-d048c21bf5ab', 'USER_DELETE'),
       ('9a7b8c9d-0e1f-2345-6789-abcdef012345', 'USER_PROFILE_CREATE'),
       ('7e5f6a7b-8c9d-ef01-2345-6789abcdef01', 'USER_PROFILE_READ'),
       ('8f6a7b8c-9d0e-f123-4567-89abcdef0123', 'USER_PROFILE_MODIFY'),
       ('26ffc98a-0e2c-4bb2-a083-f1bef04b6699', 'USER_PROFILE_LIST_READ')
    ON CONFLICT DO NOTHING;

-- ASSIGN ROLES TO USERS
INSERT INTO users_role (users_id, role_id)
VALUES ('ba804cb9-fa14-42a5-afaf-be488742fc54', 'd29e709c-0ff1-4f4c-a7ef-09f656c390f1'),
       ('0d8fa44c-54fd-4cd0-ace9-2a7da57992de', 'd29e709c-0ff1-4f4c-a7ef-09f656c390f1'),
       ('ba804cb9-fa14-42a5-afaf-be488742fc54', 'ab505c92-7280-49fd-a7de-258e618df074'),
       ('ba804cb9-fa14-42a5-afaf-be488742fc54', 'c6aee32d-8c35-4481-8b3e-a876a39b0c02'),
       ('1d8fa44c-54fd-4cd0-ace9-2a7da57992de', 'c6aee32d-8c35-4481-8b3e-a876a39b0c02')
    ON CONFLICT DO NOTHING;

INSERT INTO role_authority (role_id, authority_id)
VALUES
    -- Assign default authority to all roles
    ('d29e709c-0ff1-4f4c-a7ef-09f656c390f1', '2ebf301e-6c61-4076-98e3-2a38b31daf86'),
    ('ab505c92-7280-49fd-a7de-258e618df074', '2ebf301e-6c61-4076-98e3-2a38b31daf86'),
    ('c6aee32d-8c35-4481-8b3e-a876a39b0c02', '2ebf301e-6c61-4076-98e3-2a38b31daf86'),

    -- Admin authorities
    ('ab505c92-7280-49fd-a7de-258e618df074', '76d2cbf6-5845-470e-ad5f-2edb9e09a868'), -- USER_MODIFY
    ('ab505c92-7280-49fd-a7de-258e618df074', '9a7b8c9d-0e1f-2345-6789-abcdef012345'), -- USER_PROFILE_CREATE
    ('ab505c92-7280-49fd-a7de-258e618df074', '7e5f6a7b-8c9d-ef01-2345-6789abcdef01'), -- USER_PROFILE_READ
    ('ab505c92-7280-49fd-a7de-258e618df074', '8f6a7b8c-9d0e-f123-4567-89abcdef0123'), -- USER_PROFILE_MODIFY
    ('ab505c92-7280-49fd-a7de-258e618df074', '26ffc98a-0e2c-4bb2-a083-f1bef04b6699'), -- USER_PROFILE_LIST_READ

    -- User authorities
    ('c6aee32d-8c35-4481-8b3e-a876a39b0c02', '7e5f6a7b-8c9d-ef01-2345-6789abcdef01'), -- USER_PROFILE_READ
    ('c6aee32d-8c35-4481-8b3e-a876a39b0c02', '8f6a7b8c-9d0e-f123-4567-89abcdef0123'); -- USER_PROFILE_MODIFY

ON CONFLICT DO NOTHING;
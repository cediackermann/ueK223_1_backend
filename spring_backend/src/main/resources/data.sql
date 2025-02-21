-- USERS
INSERT INTO users (id, email, first_name, last_name, password)
VALUES ('ba804cb9-fa14-42a5-afaf-be488742fc54', 'admin@example.com', 'James', 'Bond', '$2a$10$TM3PAYG3b.H98cbRrHqWa.BM7YyCqV92e/kUTBfj85AjayxGZU7d6'), -- Password: 1234
       ('0d8fa44c-54fd-4cd0-ace9-2a7da57992de', 'user@example.com', 'Tyler', 'Durden', '$2a$10$TM3PAYG3b.H98cbRrHqWa.BM7YyCqV92e/kUTBfj85AjayxGZU7d6') -- Password: 1234
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
       ('3a1b2c3d-4e5f-6789-abcd-ef0123456789', 'USER_CREATE'),
       ('4b2c3d4e-5f6a-789b-cdef-0123456789ab', 'USER_READ'),
       ('5c3d4e5f-6a7b-89cd-ef01-23456789abcd', 'USER_UPDATE'),
       ('6d4e5f6a-7b8c-9def-0123-456789abcdef', 'CATEGORY_MANAGE'),
       ('7e5f6a7b-8c9d-ef01-2345-6789abcdef01', 'LIST_MANAGE'),
       ('8f6a7b8c-9d0e-f123-4567-89abcdef0123', 'PROFILE_EDIT'),
       ('9a7b8c9d-0e1f-2345-6789-abcdef012345', 'USER_DEACTIVATE')
    ON CONFLICT DO NOTHING;

-- ASSIGN ROLES TO USERS
INSERT INTO users_role (users_id, role_id)
VALUES ('ba804cb9-fa14-42a5-afaf-be488742fc54', 'd29e709c-0ff1-4f4c-a7ef-09f656c390f1'),
       ('0d8fa44c-54fd-4cd0-ace9-2a7da57992de', 'd29e709c-0ff1-4f4c-a7ef-09f656c390f1'),
       ('ba804cb9-fa14-42a5-afaf-be488742fc54', 'ab505c92-7280-49fd-a7de-258e618df074'),
       ('ba804cb9-fa14-42a5-afaf-be488742fc54', 'c6aee32d-8c35-4481-8b3e-a876a39b0c02')
    ON CONFLICT DO NOTHING;

-- ASSIGN AUTHORITIES TO ROLES
INSERT INTO role_authority (role_id, authority_id)
VALUES ('d29e709c-0ff1-4f4c-a7ef-09f656c390f1', '2ebf301e-6c61-4076-98e3-2a38b31daf86'),
       ('ab505c92-7280-49fd-a7de-258e618df074', '76d2cbf6-5845-470e-ad5f-2edb9e09a868'),
       ('c6aee32d-8c35-4481-8b3e-a876a39b0c02', '21c942db-a275-43f8-bdd6-d048c21bf5ab'),
       ('ab505c92-7280-49fd-a7de-258e618df074', '3a1b2c3d-4e5f-6789-abcd-ef0123456789'),
       ('ab505c92-7280-49fd-a7de-258e618df074', '4b2c3d4e-5f6a-789b-cdef-0123456789ab'),
       ('ab505c92-7280-49fd-a7de-258e618df074', '5c3d4e5f-6a7b-89cd-ef01-23456789abcd'),
       ('ab505c92-7280-49fd-a7de-258e618df074', '6d4e5f6a-7b8c-9def-0123-456789abcdef'),
       ('ab505c92-7280-49fd-a7de-258e618df074', '7e5f6a7b-8c9d-ef01-2345-6789abcdef01'),
       ('ab505c92-7280-49fd-a7de-258e618df074', '8f6a7b8c-9d0e-f123-4567-89abcdef0123'),
       ('ab505c92-7280-49fd-a7de-258e618df074', '9a7b8c9d-0e1f-2345-6789-abcdef012345')
    ON CONFLICT DO NOTHING;
-- USERS
INSERT INTO users (id, email, first_name, last_name, password)
VALUES
    ('ba804cb9-fa14-42a5-afaf-be488742fc54', 'admin@example.com', 'James', 'Bond', '$2a$10$TM3PAYG3b.H98cbRrHqWa.BM7YyCqV92e/kUTBfj85AjayxGZU7d6'), -- Password: 1234
    ('0d8fa44c-54fd-4cd0-ace9-2a7da57992de', 'user@example.com', 'Tyler', 'Durden', '$2a$10$TM3PAYG3b.H98cbRrHqWa.BM7YyCqV92e/kUTBfj85AjayxGZU7d6') -- Password: 1234
    ON CONFLICT DO NOTHING;

-- ROLES
INSERT INTO role (id, name)
VALUES
    ('d29e709c-0ff1-4f4c-a7ef-09f656c390f1', 'DEFAULT'),
    ('ab505c92-7280-49fd-a7de-258e618df074', 'ADMIN'),
    ('c6aee32d-8c35-4481-8b3e-a876a39b0c02', 'USER')
    ON CONFLICT DO NOTHING;

-- AUTHORITIES
INSERT INTO authority (id, name)
VALUES
    ('2ebf301e-6c61-4076-98e3-2a38b31daf86', 'DEFAULT'),
    ('76d2cbf6-5845-470e-ad5f-2edb9e09a868', 'USER_MODIFY'),
    ('21c942db-a275-43f8-bdd6-d048c21bf5ab', 'USER_DELETE'),
    ('a1b2c3d4-e5f6-7890-ab12-cd34ef56ab78', 'USER_CREATE'),
    ('b2c3d4e5-f678-9012-abcd-34ef56ab7890', 'USER_READ'),
    ('c3d4e5f6-7890-12ab-cd34-ef56ab789012', 'USER_UPDATE'),
    ('d4e5f678-9012-abcd-34ef-56ab78901234', 'CATEGORY_MANAGE'),
    ('e5f67890-12ab-cd34-ef56-ab7890123456', 'LIST_MANAGE'),
    ('f6789012-abcd-34ef-56ab-789012345678', 'PROFILE_EDIT'),
    ('67890123-4bcd-5ef6-7890-123456789abc', 'USER_DEACTIVATE')
    ON CONFLICT DO NOTHING;

-- ASSIGN ROLES TO USERS
INSERT INTO users_role (users_id, role_id)
VALUES
    ('ba804cb9-fa14-42a5-afaf-be488742fc54', 'd29e709c-0ff1-4f4c-a7ef-09f656c390f1'),
    ('0d8fa44c-54fd-4cd0-ace9-2a7da57992de', 'd29e709c-0ff1-4f4c-a7ef-09f656c390f1'),
    ('ba804cb9-fa14-42a5-afaf-be488742fc54', 'ab505c92-7280-49fd-a7de-258e618df074'),
    ('ba804cb9-fa14-42a5-afaf-be488742fc54', 'c6aee32d-8c35-4481-8b3e-a876a39b0c02')
    ON CONFLICT DO NOTHING;

-- ASSIGN AUTHORITIES TO ROLES
INSERT INTO role_authority (role_id, authority_id)
VALUES
-- User behält bestehende Authorities
('d29e709c-0ff1-4f4c-a7ef-09f656c390f1', '2ebf301e-6c61-4076-98e3-2a38b31daf86'),
('c6aee32d-8c35-4481-8b3e-a876a39b0c02', '21c942db-a275-43f8-bdd6-d048c21bf5ab'),

-- Admin bekommt alle Authorities
('ab505c92-7280-49fd-a7de-258e618df074', '76d2cbf6-5845-470e-ad5f-2edb9e09a868'),
('ab505c92-7280-49fd-a7de-258e618df074', 'a1b2c3d4-e5f6-7890-ab12-cd34ef56ab78'),
('ab505c92-7280-49fd-a7de-258e618df074', 'b2c3d4e5-f678-9012-abcd-34ef56ab7890'),
('ab505c92-7280-49fd-a7de-258e618df074', 'c3d4e5f6-7890-12ab-cd34-ef56ab789012'),
('ab505c92-7280-49fd-a7de-258e618df074', 'd4e5f678-9012-abcd-34ef-56ab78901234'),
('ab505c92-7280-49fd-a7de-258e618df074', 'e5f67890-12ab-cd34-ef56-ab7890123456'),
('ab505c92-7280-49fd-a7de-258e618df074', 'f6789012-abcd-34ef-56ab-789012345678'),
('ab505c92-7280-49fd-a7de-258e618df074', '67890123-4bcd-5ef6-7890-123456789abc')
    ON CONFLICT DO NOTHING;

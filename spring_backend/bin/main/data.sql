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
    ('1a2b3c4d-5678-90ab-cdef-123456789001', 'USER_CREATE'),
    ('1a2b3c4d-5678-90ab-cdef-123456789002', 'USER_READ'),
    ('1a2b3c4d-5678-90ab-cdef-123456789003', 'USER_UPDATE'),
    ('1a2b3c4d-5678-90ab-cdef-123456789004', 'CATEGORY_MANAGE'),
    ('1a2b3c4d-5678-90ab-cdef-123456789005', 'LIST_MANAGE'),
    ('1a2b3c4d-5678-90ab-cdef-123456789006', 'PROFILE_EDIT'),
    ('1a2b3c4d-5678-90ab-cdef-123456789007', 'USER_DEACTIVATE')
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
-- User bleibt mit bisherigen Authorities
('d29e709c-0ff1-4f4c-a7ef-09f656c390f1', '2ebf301e-6c61-4076-98e3-2a38b31daf86'),
('c6aee32d-8c35-4481-8b3e-a876a39b0c02', '21c942db-a275-43f8-bdd6-d048c21bf5ab'),

-- Admin bekommt alle Authorities
('ab505c92-7280-49fd-a7de-258e618df074', '76d2cbf6-5845-470e-ad5f-2edb9e09a868'),
('ab505c92-7280-49fd-a7de-258e618df074', '1a2b3c4d-5678-90ab-cdef-123456789001'),
('ab505c92-7280-49fd-a7de-258e618df074', '1a2b3c4d-5678-90ab-cdef-123456789002'),
('ab505c92-7280-49fd-a7de-258e618df074', '1a2b3c4d-5678-90ab-cdef-123456789003'),
('ab505c92-7280-49fd-a7de-258e618df074', '1a2b3c4d-5678-90ab-cdef-123456789004'),
('ab505c92-7280-49fd-a7de-258e618df074', '1a2b3c4d-5678-90ab-cdef-123456789005'),
('ab505c92-7280-49fd-a7de-258e618df074', '1a2b3c4d-5678-90ab-cdef-123456789006'),
('ab505c92-7280-49fd-a7de-258e618df074', '1a2b3c4d-5678-90ab-cdef-123456789007')
    ON CONFLICT DO NOTHING;

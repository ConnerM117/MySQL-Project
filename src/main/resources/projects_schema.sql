DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
	project_id INT AUTO_INCREMENT NOT NULL,
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT,
	PRIMARY KEY (project_id)
);

CREATE TABLE category (
	category_id INT AUTO_INCREMENT NOT NULL,
	category_name VARCHAR(128) NOT NULL,
	PRIMARY KEY (category_id)
);

CREATE TABLE project_category (
	project_id INT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
	UNIQUE KEY (project_id, category_id)
);

CREATE TABLE material (
	material_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	material_name VARCHAR(128) NOT NULL,
	num_required INT,
	cost DECIMAL(7,2),
	PRIMARY KEY (material_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE step (
	step_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	step_text TEXT NOT NULL,
	step_order INT NOT NULL,
	PRIMARY KEY (step_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

-- Add some data

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes)
VALUES ('Compose a piano piece', 11.00, 15.00, 4, 'You should probably know how to read music');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'pencil', 3, 0.99);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'staff paper', 10, 2.99);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'piano', 1, 2000.99);
INSERT INTO step (project_id, step_text, step_order) VALUES (3, 'Sit down at the piano', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (3, 'Play whatever comes to mind', 2);
INSERT INTO step (project_id, step_text, step_order) VALUES (3, 'Write it down', 3);
INSERT INTO category (category_name) VALUES ('Creative');
INSERT INTO category (category_name) VALUES ('Arts');
INSERT INTO category (category_name) VALUES ('Music');
INSERT INTO project_category (project_id, category_id) VALUES (1, 1);
INSERT INTO project_category (project_id, category_id) VALUES (1, 2);
INSERT INTO project_category (project_id, category_id) VALUES (1, 3);

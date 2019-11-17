-- Drop table

-- DROP TABLE public.tb_user;

CREATE TABLE public.tb_user (
	user_id varchar(10) NOT NULL,
	user_pw varchar(10) NOT NULL,
	user_nm varchar(10) NOT NULL,
	user_address varchar(100) NULL,
	user_email varchar(100) NULL,
	user_reg_dt date NULL
);

-- Permissions

ALTER TABLE public.tb_user OWNER TO postgres;
GRANT ALL ON TABLE public.tb_user TO postgres;

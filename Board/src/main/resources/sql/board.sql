-- Drop table

-- DROP TABLE public.board;

CREATE TABLE public.board (
	bbs_no int4 NOT NULL,
	bbs_title varchar(200) NULL,
	bbs_content text NULL,
	bbs_read_count int4 NULL,
	bbs_writer varchar(50) NULL,
	bbs_regdt date NULL,
	CONSTRAINT board_pk PRIMARY KEY (bbs_no)
);

-- Permissions

ALTER TABLE public.board OWNER TO postgres;
GRANT ALL ON TABLE public.board TO postgres;

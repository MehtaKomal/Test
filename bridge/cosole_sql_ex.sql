-- we don't know how to generate schema main (class Schema) :(
create table auth_group
(
	id integer not null
		primary key
		 autoincrement,
	name varchar(80) not null
		unique
)
;

create table auth_user
(
	id integer not null
		primary key
		 autoincrement,
	password varchar(128) not null,
	last_login datetime,
	is_superuser bool not null,
	username varchar(150) not null
		unique,
	first_name varchar(30) not null,
	email varchar(254) not null,
	is_staff bool not null,
	is_active bool not null,
	date_joined datetime not null,
	last_name varchar(150) not null
)
;

create table auth_user_groups
(
	id integer not null
		primary key
		 autoincrement,
	user_id integer not null
		references auth_user
			deferrable initially deferred,
	group_id integer not null
		references auth_group
			deferrable initially deferred
)
;

create index auth_user_groups_group_id_97559544
	on auth_user_groups (group_id)
;

create index auth_user_groups_user_id_6a12ed8b
	on auth_user_groups (user_id)
;

create unique index auth_user_groups_user_id_group_id_94350c0c_uniq
	on auth_user_groups (user_id, group_id)
;

create table bridge_commonexpertnews
(
	id integer not null
		primary key
		 autoincrement,
	news text,
	expert_id integer,
	is_available bool not null
)
;

create table bridge_commonnews
(
	id integer not null
		primary key
		 autoincrement,
	news text,
	student_id integer
)
;

create table bridge_expert
(
	id integer not null
		primary key
		 autoincrement,
	name varchar(50) not null,
	Designation varchar(70) not null,
	Field_of_Experience integer not null,
	Skill varchar(200),
	Personal_Email varchar(100) not null,
	about text not null,
	password varchar(20) not null,
	Icard_Picture varchar(100),
	Company_Name varchar(200) not null,
	Profile_piture varchar(100),
	Department varchar(100) not null,
	mobile integer not null
)
;

create table bridge_addlecture
(
	id integer not null
		primary key
		 autoincrement,
	title varchar(200) not null,
	description text not null,
	date date not null,
	time time not null,
	expert_id_id integer
		references bridge_expert
			deferrable initially deferred,
	update_timestamp datetime not null
)
;

create table bridge_activitystart
(
	id integer not null
		primary key
		 autoincrement,
	key varchar(200) not null,
	is_start bool not null,
	is_end bool not null,
	activity_id integer
		references bridge_addlecture
			deferrable initially deferred,
	expert_id integer
		references bridge_expert
			deferrable initially deferred
)
;

create index bridge_activitystart_activity_id_c4af07c2
	on bridge_activitystart (activity_id)
;

create index bridge_activitystart_expert_id_f1bd67c6
	on bridge_activitystart (expert_id)
;

create index bridge_addlecture_expert_id_id_87bb7ccb
	on bridge_addlecture (expert_id_id)
;

create table bridge_e2e
(
	id integer not null
		primary key
		 autoincrement,
	expert_get integer not null,
	is_connect_request bool not null,
	is_connect bool not null,
	expert_sent_id integer not null
		references bridge_expert
			deferrable initially deferred
)
;

create index bridge_e2e_expert_sent_id_37b72d55
	on bridge_e2e (expert_sent_id)
;

create table bridge_expertonlinestatus
(
	id integer not null
		primary key
		 autoincrement,
	is_online bool not null,
	expert_id integer not null
		references bridge_expert
			deferrable initially deferred
)
;

create index bridge_expertonlinestatus_expert_id_691b5e3a
	on bridge_expertonlinestatus (expert_id)
;

create table bridge_lecturehistory
(
	id integer not null
		primary key
		 autoincrement,
	student_count integer not null,
	student_list text not null,
	lecture_id_id integer not null
		references bridge_addlecture
			deferrable initially deferred,
	expert_id_id integer not null
		references bridge_expert
			deferrable initially deferred
)
;

create index bridge_lecturehistory_expert_id_id_3261294a
	on bridge_lecturehistory (expert_id_id)
;

create index bridge_lecturehistory_lecture_id_id_bd84c18a
	on bridge_lecturehistory (lecture_id_id)
;

create table bridge_newsfeed
(
	id integer not null
		primary key
		 autoincrement,
	news text not null,
	expert_id integer,
	is_available bool not null
)
;

create table bridge_student
(
	id integer not null
		primary key
		 autoincrement,
	name varchar(50) not null,
	Collage varchar(100) not null,
	Year_Experience integer not null,
	Qualification varchar(200) not null,
	mobile integer not null,
	Profile_piture varchar(100),
	password varchar(20) not null,
	Personal_Email varchar(100) not null
)
;

create table bridge_activityrequest
(
	id integer not null
		primary key
		 autoincrement,
	activity_id integer
		references bridge_addlecture
			deferrable initially deferred,
	expert_id integer
		references bridge_expert
			deferrable initially deferred,
	student_id integer
		references bridge_student
			deferrable initially deferred
)
;

create index bridge_activityrequest_activity_id_e2349626
	on bridge_activityrequest (activity_id)
;

create index bridge_activityrequest_expert_id_4b522097
	on bridge_activityrequest (expert_id)
;

create index bridge_activityrequest_student_id_803c9b07
	on bridge_activityrequest (student_id)
;

create table bridge_adminnews
(
	id integer not null
		primary key
		 autoincrement,
	news text not null,
	expert_id integer
		references bridge_expert
			deferrable initially deferred,
	student_id integer
		references bridge_student
			deferrable initially deferred
)
;

create index bridge_adminnews_expert_id_f1adc159
	on bridge_adminnews (expert_id)
;

create index bridge_adminnews_student_id_439e219a
	on bridge_adminnews (student_id)
;

create table bridge_expert_following
(
	id integer not null
		primary key
		 autoincrement,
	Is_follow text not null,
	Is_follow_accepted text not null,
	Expert_id_id integer not null
		references bridge_expert
			deferrable initially deferred,
	Student_id_id integer not null
		references bridge_student
			deferrable initially deferred
)
;

create index bridge_expert_following_Expert_id_id_71bc8d50
	on bridge_expert_following (Expert_id_id)
;

create index bridge_expert_following_Student_id_id_ea16ebd3
	on bridge_expert_following (Student_id_id)
;

create table bridge_expert_student_block
(
	id integer not null
		primary key
		 autoincrement,
	is_block text not null,
	Expert_id_id integer not null
		references bridge_expert
			deferrable initially deferred,
	Student_id_id integer not null
		references bridge_student
			deferrable initially deferred
)
;

create index bridge_expert_student_block_Expert_id_id_0b1f3f79
	on bridge_expert_student_block (Expert_id_id)
;

create index bridge_expert_student_block_Student_id_id_7b7c2cac
	on bridge_expert_student_block (Student_id_id)
;

create table bridge_expertenq
(
	id integer not null
		primary key
		 autoincrement,
	expert_id integer not null
		references bridge_expert
			deferrable initially deferred,
	student_id integer not null
		references bridge_student
			deferrable initially deferred
)
;

create index bridge_expertenq_expert_id_9f5b8320
	on bridge_expertenq (expert_id)
;

create index bridge_expertenq_student_id_9a2f6362
	on bridge_expertenq (student_id)
;

create table bridge_expertreview
(
	id integer not null
		primary key
		 autoincrement,
	as_boss integer not null,
	expert_id integer not null
		references bridge_expert
			deferrable initially deferred,
	student_id integer not null
		references bridge_student
			deferrable initially deferred
)
;

create index bridge_expertreview_expert_id_4880ba50
	on bridge_expertreview (expert_id)
;

create index bridge_expertreview_student_id_1a6759ee
	on bridge_expertreview (student_id)
;

create table bridge_student_block_count
(
	id integer not null
		primary key
		 autoincrement,
	block_count integer not null,
	Student_id_id integer not null
		references bridge_student
			deferrable initially deferred
)
;

create index bridge_student_block_count_Student_id_id_7fbad937
	on bridge_student_block_count (Student_id_id)
;

create table bridge_studentlectureattended
(
	id integer not null
		primary key
		 autoincrement,
	expert_id_id integer not null
		references bridge_expert
			deferrable initially deferred,
	lecture_id_id integer not null
		references bridge_addlecture
			deferrable initially deferred,
	student_id_id integer not null
		references bridge_student
			deferrable initially deferred
)
;

create index bridge_studentlectureattended_expert_id_id_18bea923
	on bridge_studentlectureattended (expert_id_id)
;

create index bridge_studentlectureattended_lecture_id_id_967d64de
	on bridge_studentlectureattended (lecture_id_id)
;

create index bridge_studentlectureattended_student_id_id_7cddc96d
	on bridge_studentlectureattended (student_id_id)
;

create table bridge_studentreview
(
	id integer not null
		primary key
		 autoincrement,
	communication_skill integer not null,
	domain_knowledge integer not null,
	team_skill integer not null,
	open_for_learning integer not null,
	behaviour integer not null,
	overall integer not null,
	student_id integer not null
		references bridge_student
			deferrable initially deferred
)
;

create index bridge_studentreview_student_id_cbeddf2c
	on bridge_studentreview (student_id)
;

create table bridge_user_group
(
	id integer not null
		primary key
		 autoincrement,
	Group_id_id integer not null
		references auth_group
			deferrable initially deferred,
	user_id_id integer not null
		references auth_user
			deferrable initially deferred
)
;

create index bridge_user_group_Group_id_id_e6140334
	on bridge_user_group (Group_id_id)
;

create index bridge_user_group_user_id_id_2d6bb5d1
	on bridge_user_group (user_id_id)
;

create table bridge_usercomapny
(
	id integer not null
		primary key
		 autoincrement,
	user_id_id integer not null
		references auth_user
			deferrable initially deferred,
	company_id text not null
)
;

create index bridge_usercomapny_user_id_id_263bfd2e
	on bridge_usercomapny (user_id_id)
;

create table django_content_type
(
	id integer not null
		primary key
		 autoincrement,
	app_label varchar(100) not null,
	model varchar(100) not null
)
;

create table auth_permission
(
	id integer not null
		primary key
		 autoincrement,
	content_type_id integer not null
		references django_content_type
			deferrable initially deferred,
	codename varchar(100) not null,
	name varchar(255) not null
)
;

create table auth_group_permissions
(
	id integer not null
		primary key
		 autoincrement,
	group_id integer not null
		references auth_group
			deferrable initially deferred,
	permission_id integer not null
		references auth_permission
			deferrable initially deferred
)
;

create index auth_group_permissions_group_id_b120cbf9
	on auth_group_permissions (group_id)
;

create unique index auth_group_permissions_group_id_permission_id_0cd325b0_uniq
	on auth_group_permissions (group_id, permission_id)
;

create index auth_group_permissions_permission_id_84c5c92e
	on auth_group_permissions (permission_id)
;

create index auth_permission_content_type_id_2f476e4b
	on auth_permission (content_type_id)
;

create unique index auth_permission_content_type_id_codename_01ab375a_uniq
	on auth_permission (content_type_id, codename)
;

create table auth_user_user_permissions
(
	id integer not null
		primary key
		 autoincrement,
	user_id integer not null
		references auth_user
			deferrable initially deferred,
	permission_id integer not null
		references auth_permission
			deferrable initially deferred
)
;

create index auth_user_user_permissions_permission_id_1fbb5f2c
	on auth_user_user_permissions (permission_id)
;

create index auth_user_user_permissions_user_id_a95ead1b
	on auth_user_user_permissions (user_id)
;

create unique index auth_user_user_permissions_user_id_permission_id_14a6b632_uniq
	on auth_user_user_permissions (user_id, permission_id)
;

create table django_admin_log
(
	id integer not null
		primary key
		 autoincrement,
	object_id text,
	object_repr varchar(200) not null,
	action_flag smallint unsigned not null,
	change_message text not null,
	content_type_id integer
		references django_content_type
			deferrable initially deferred,
	user_id integer not null
		references auth_user
			deferrable initially deferred,
	action_time datetime not null
)
;

create index django_admin_log_content_type_id_c4bce8eb
	on django_admin_log (content_type_id)
;

create index django_admin_log_user_id_c564eba6
	on django_admin_log (user_id)
;

create unique index django_content_type_app_label_model_76bd3d3b_uniq
	on django_content_type (app_label, model)
;

create table django_migrations
(
	id integer not null
		primary key
		 autoincrement,
	app varchar(255) not null,
	name varchar(255) not null,
	applied datetime not null
)
;

create table django_session
(
	session_key varchar(40) not null
		primary key,
	session_data text not null,
	expire_date datetime not null
)
;

create index django_session_expire_date_a5c62663
	on django_session (expire_date)
;

create table paypal_ipn
(
	id integer not null
		primary key
		 autoincrement,
	business varchar(127) not null,
	charset varchar(255) not null,
	custom varchar(256) not null,
	notify_version decimal,
	parent_txn_id varchar(19) not null,
	receiver_email varchar(254) not null,
	receiver_id varchar(255) not null,
	residence_country varchar(2) not null,
	test_ipn bool not null,
	txn_id varchar(255) not null,
	verify_sign varchar(255) not null,
	address_country varchar(64) not null,
	address_city varchar(40) not null,
	address_country_code varchar(64) not null,
	address_name varchar(128) not null,
	address_state varchar(40) not null,
	address_status varchar(255) not null,
	address_street varchar(200) not null,
	address_zip varchar(20) not null,
	contact_phone varchar(20) not null,
	first_name varchar(64) not null,
	last_name varchar(64) not null,
	payer_business_name varchar(127) not null,
	payer_email varchar(127) not null,
	payer_id varchar(13) not null,
	auth_amount decimal,
	auth_exp varchar(28) not null,
	auth_id varchar(19) not null,
	auth_status varchar(255) not null,
	exchange_rate decimal,
	invoice varchar(127) not null,
	item_name varchar(127) not null,
	item_number varchar(127) not null,
	mc_currency varchar(32) not null,
	mc_fee decimal,
	mc_gross decimal,
	mc_handling decimal,
	mc_shipping decimal,
	memo varchar(255) not null,
	num_cart_items integer,
	option_name1 varchar(64) not null,
	option_name2 varchar(64) not null,
	payer_status varchar(255) not null,
	payment_date datetime,
	payment_gross decimal,
	payment_status varchar(255) not null,
	payment_type varchar(255) not null,
	pending_reason varchar(255) not null,
	protection_eligibility varchar(255) not null,
	quantity integer,
	reason_code varchar(255) not null,
	remaining_settle decimal,
	settle_amount decimal,
	settle_currency varchar(32) not null,
	shipping decimal,
	shipping_method varchar(255) not null,
	tax decimal,
	transaction_entity varchar(255) not null,
	auction_buyer_id varchar(64) not null,
	auction_closing_date datetime,
	auction_multi_item integer,
	for_auction decimal,
	amount decimal,
	amount_per_cycle decimal,
	initial_payment_amount decimal,
	next_payment_date datetime,
	outstanding_balance decimal,
	payment_cycle varchar(255) not null,
	period_type varchar(255) not null,
	product_name varchar(255) not null,
	product_type varchar(255) not null,
	profile_status varchar(255) not null,
	recurring_payment_id varchar(255) not null,
	rp_invoice_id varchar(127) not null,
	time_created datetime,
	amount1 decimal,
	amount2 decimal,
	amount3 decimal,
	mc_amount1 decimal,
	mc_amount2 decimal,
	mc_amount3 decimal,
	password varchar(24) not null,
	period1 varchar(255) not null,
	period2 varchar(255) not null,
	period3 varchar(255) not null,
	reattempt varchar(1) not null,
	recur_times integer,
	recurring varchar(1) not null,
	retry_at datetime,
	subscr_date datetime,
	subscr_effective datetime,
	subscr_id varchar(19) not null,
	username varchar(64) not null,
	case_creation_date datetime,
	case_id varchar(255) not null,
	case_type varchar(255) not null,
	receipt_id varchar(255) not null,
	currency_code varchar(32) not null,
	handling_amount decimal,
	transaction_subject varchar(256) not null,
	ipaddress char(39),
	flag bool not null,
	flag_code varchar(16) not null,
	flag_info text not null,
	query text not null,
	response text not null,
	created_at datetime not null,
	updated_at datetime not null,
	from_view varchar(6),
	mp_id varchar(128),
	option_selection1 varchar(200) not null,
	option_selection2 varchar(200) not null,
	txn_type varchar(255) not null
)
;

create index paypal_ipn_txn_id_8fa22c44
	on paypal_ipn (txn_id)
;


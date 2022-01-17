-- O'zgarmas tablitsiya
create table "amount"(
  id serial primary key not null,
  "name" varchar(10) not null 
);

-- O'zgarmas tablitsiya
create table "shirt"(
  id serial primary key not null,
  "name" varchar(50) not null,
  img varchar(100) not null
);

-- O'zgarmas tablitsiya
create table "product"(
  id serial primary key not null,
  "name" varchar(50) not null,
  amount varchar(50) not null,
  img varchar(255) not null
);

-- O'zgarmas tablitsiya
create table "client"(
  id serial primary key not null,
  salon_name varchar(50) not null,
  salon_add varchar(255) not null,
  tel integer not null,
  seller_name varchar(50) not null
);

-- =====================================
create table "balance"(
  id serial primary key not null,
  where_given_many varchar(255),
  many varchar(50),
  "date" date not null
);

create table "costs"(
  id serial primary key not null,
  "name" varchar(30) not null,
  "count" integer not null,
  amount_id integer not null,
  price integer not null,
  where_given_many varchar(255),
  cost_type_id integer not null,
  "date" date not null,
  foreign key (amount_id) references "amount"(id),
  foreign key (cost_type_id) references "cost_type"(id)
);

create table "salesman"(
  id serial primary key not null,
  sales varchar(20) not null,
  shirt_id integer not null,
  count integer not null,
  negotiated_price integer not null,
  note varchar(255),
  given_price integer not null,
  left_balance integer not null,
  give_date date not null,
  fon_sold boolean default false not null,
  client_id integer not null,
  send_date date not null,
  delivery_type boolean default true not null,
  brides_name varchar(50),
  passport boolean default false,
  given_many_salon integer,
  foreign key (shirt_id) references "shirt"(id),
  foreign key (client_id) references "client"(id)
);

create table "delivery"(
  id serial primary key not null,
  back_commit varchar(255) not null
);

create table "warehouse"(
  id serial primary key not null,
  product_id integer not null,
  product_count integer not null,
  product_price integer,
  product_note varchar(255),
  foreign key (product_id) references "product"(id)
);
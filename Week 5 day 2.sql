create table person(
    personal_id serial primary key,
    first_name VARCHAR(50) not null,
    last_name VARCHAR(50) not null,
    address VARCHAR(100),
    email VARCHAR(50)
);

create table staff(
    title VARCHAR(50) not null ,
    personal_id INTEGER not null,
    foreign key(personal_id) references person(personal_id)
);

create table showtime(
    showing serial primary key,
    start_time TIME,
    end_time TIME
);

create table "location"(
    city_name VARCHAR(50) not null primary key,
    state VARCHAR(50) not null,
    zip_code numeric(5,0) not null
);

create table cinema(
    theater_name VARCHAR(50) not null primary key,
    total_theaters INTEGER not null,
    city_name VARCHAR(50) not null,
    foreign key(city_name) references "location"(city_name) 
);

create table movie(
    movie VARCHAR(50) not null primary key,
    description VARCHAR(50) not null,
    duration_mins INTEGER,
    "language" VARCHAR(50) not null,
    genre VARCHAR(50) not null,
    showing INTEGER not null,
    foreign key(showing) references showtime(showing)
    
);

create table theater(
    theater VARCHAR(50) not null primary key,
    total_seats INTEGER not null,
    movie VARCHAR(50) not null,
    "location" VARCHAR(50) not null,
    foreign key("location") references cinema(theater_name),
    foreign key(movie) references movie(movie)
);

create table theater_seat(
    seat_id serial primary key,
    seat_row VARCHAR(1) not null,
    seat_column VARCHAR(1) not null,
    seat_type VARCHAR(50),
    theater VARCHAR(50) not null,
    foreign key(theater) references theater(theater)
);

create table seats(
    regular BOOLEAN,
    premium BOOLEAN,
    accessable BOOLEAN,
    seat_id INTEGER,
    foreign key(seat_id) references theater_seat(seat_id)
);

create table customer(
    customer_id INTEGER,
    rewards_member BOOLEAN,
    ticket INTEGER,
    movie VARCHAR(50),
    foreign key(customer_id) references person(personal_id),
    foreign key(ticket) references ticket(ticket_num),
    foreign key(movie) references movie(movie)
);

create table ticket(
    ticket_num serial not null primary key,
    seat INTEGER not null,
    unpaid BOOLEAN,
    pending BOOLEAN,
    completed BOOLEAN,
    declined BOOLEAN,
    refunded BOOLEAN,
    theater VARCHAR(20) not null,
    movie VARCHAR(50) not null,
    foreign key(seat) references theater_seat(seat_id)
    foreign key(theater) references theater(theater),
    foreign key(movie) references movie(movie)
);

insert into person(
    first_name,
    last_name,
    address,
    email
) values (
    'Freddy',
    'Krueger',
    '123 Maple Street',
    'fkruger@dreamland.com'
);

insert into person(
    first_name,
    last_name,
    address,
    email
) values (
    'Jason',
    'Vorhees',
    '123 Crystal Lake road',
    'jvorhees@campcrystallake.com'
);

insert into person(
    first_name,
    last_name,
    address,
    email
    ) values (
    'Daniel',
    'Hansbury',
    '12 Mendon St',
    'blackholesoul@gmail.com'
    ) , (
    'Shonn',
    'Thomas',
    '123 Real Street',
    'sthomas@gmail.com'
    );

insert into staff(
    title,
    personal_id
) values (
    'owner',
    3
) , (
    'manager',
    4
)

insert into showtime(
    start_time,
    end_time 
) values (
    '15:00:00',
    '17:10:00'
), (
    '14:00:00',
    '16:10:00'
), (
    '12:00:00',
    '14:10:00'
);

insert into "location"(
    city_name,
    state,
    zip_code 
) values (
    ' Worcester',
    'MA',
    01601
) , (
    'Boston',
    'MA',
    02115
)

select * from "location";

insert into cinema(
    theater_name,
    total_theaters,
    city_name 
) values (
    'Princess Cinemas Worcester',
    '14',
    'Worcester'
) , (
    'Princess Cinemas Boston',
    '14',
    'Boston'
);

insert into movie(
    movie,
    description,
    duration_mins,
    "language",
    genre,
    showing
) values (
    'The Little Mermaid',
    'The Story of one girl search for acceptance',
    130,
    'English',
    'Musical',
    1
) , (
    'Aladdin',
    'The Story of one boy search for acceptance',
    130,
    'English',
    'Comedy',
    2
);

insert into theater(
    theater,
    total_seats,
    movie,
    "location"
) values (
    'Ariel',
    90,
    'The Little Mermaid',
    'Worcester'
) , (
    'Jasmine',
    120,
    'Aladdin',
    'Boston'
)

insert into theater_seat(
    seat_row,
    seat_column,
    seat_type,
    theater 
) values (
    'A',
    '1',
    'regular',
    'Ariel'
    ) , (
    'A',
    '2',
    'accessable',
    'Ariel'
    ) , (
    'A',
    '3',
    'premium',
    'Ariel'
    ) , (
    'A',
    '4',
    'premium',
    'Ariel'
);

insert into seats(
    regular,
    premium,
    accessable
) , (
    true,
    false,
    false
) , (
    false,
    false,
    true
) , (
    false,
    true,
    false
) , (
    false,
    true,
    false
);
    
insert into ticket(
    unpaid,
    pending,
    completed,
    declined,
    refunded,
) , (
    false,
    false,
    true,
    false,
    false,
) , (
    false,
    false,
    true,
    false,
    false,
)
 , (
    true,
    false,
    false,
    false,
    false,
) , (
    false,
    true,
    false,
    false,
    false,
)

insert into customer(
    rewards_member
) , (
    true
) , (
    true
)


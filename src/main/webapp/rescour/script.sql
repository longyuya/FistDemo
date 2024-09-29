create table dest
(
    id            bigint auto_increment comment '主键'
        primary key,
    studentnum    bigint                  null comment '学生id',
    detailAddress varchar(255)            null comment '详细地址',
    holidayname   varchar(255)            null comment '假期表id',
    leaveDate     date                    null comment '离校日期',
    isLeave       enum ('离校', '未离校') null comment '是否离校',
    shen          tinyint                 null,
    shizhou       tinyint                 null,
    xiangzhen     tinyint                 null
);

create index fk_dest_studentID
    on dest (studentnum);

create index index_isLeave
    on dest (isLeave);

create index index_leaveDate
    on dest (leaveDate);

create table holiday
(
    id          bigint auto_increment comment '主键'
        primary key,
    holidayYear year         null comment '年份',
    holidayname varchar(255) not null comment '参照字典的值',
    beginDate   datetime     not null comment '假期开始时间',
    endDate     datetime     not null comment '假期结束时间'
)
    comment '假期表';

create index index_holidayYear
    on holiday (holidayYear);

create table t_class
(
    id           bigint auto_increment comment '主键'
        primary key,
    name         varchar(100) null comment '班级名称',
    enreryear    varchar(150) null comment '入学年份',
    colleagename varchar(150) null,
    constraint name
        unique (name)
)
    comment '班级表';

create index index_enteryear
    on t_class (enreryear);

create table t_student
(
    id         bigint auto_increment comment '主键'
        primary key,
    num        varchar(100) not null comment '学号',
    name       varchar(150) not null comment '姓名',
    gender     varchar(8)   null comment '性别',
    tel        varchar(18)  null comment '电话号码',
    emerpeople varchar(150) null comment '紧急联系人',
    emertel    varchar(18)  null comment '紧急联系人号码',
    classID    bigint       null,
    province   varchar(255) null,
    city       varchar(255) null,
    village    varchar(255) null,
    vehicle    varchar(255) null,
    lixiao     varchar(150) null,
    constraint emertel
        unique (emertel),
    constraint num
        unique (num),
    constraint tel
        unique (tel),
    constraint fk_classID
        foreign key (classID) references t_class (id)
)
    comment '学生表';

create index index_name
    on t_student (name);

create table userlogin
(
    id       bigint auto_increment comment '主键'
        primary key,
    username varchar(150)                  not null comment '账号',
    name     varchar(150)                  null comment '姓名',
    pwd      varchar(255) default '123456' not null comment '密码',
    identity varchar(150)                  null comment '1为老师，2为学生'
)
    comment '账号表';



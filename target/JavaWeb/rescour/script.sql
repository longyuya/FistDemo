create table holiday
(
    id          bigint auto_increment comment '主键'
        primary key,
    holidayYear year     null comment '年份',
    holidayV    tinyint  not null comment '参照字典的值',
    beginDate   datetime not null comment '假期开始时间',
    endDate     datetime not null comment '假期结束时间'
)
    comment '假期表';

create index index_holidayV
    on holiday (holidayname);

create index index_holidayYear
    on holiday (holidayYear);

create table region
(
    id             bigint auto_increment comment '主键'
        primary key,
    num            varchar(50)  null comment '行政编码',
    name           varchar(150) not null comment '名称',
    parentRegionID bigint       null,
    constraint fk_reginID
        foreign key (parentRegionID) references region (id)
)
    comment '行政区域';

create index index_region_name
    on region (name);

create table t_colleage
(
    id   tinyint auto_increment comment '主键'
        primary key,
    code varchar(15) null comment '编码',
    name varchar(50) null comment '学院名称',
    constraint colleage_code_uindex
        unique (code),
    constraint colleage_name_uindex
        unique (name)
)
    comment '学院表';

create table t_class
(
    id         bigint auto_increment comment '主键'
        primary key,
    name       varchar(100) null comment '班级名称',
    enreryear  year         null comment '入学年份',
    colleageID tinyint      null,
    constraint name
        unique (name),
    constraint fk_colleageID
        foreign key (colleageID) references t_colleage (id)
)
    comment '班级表';

create index index_enteryear
    on t_class (enreryear);

create table t_dic
(
    id        bigint auto_increment comment '主键'
        primary key,
    tableName varchar(50)      not null comment '表名',
    filedName varchar(100)     not null comment '表字段',
    value     tinyint unsigned not null comment '表的值',
    _desc     varchar(255)     not null comment '描述',
    constraint index_dic_desc
        unique (tableName, filedName, _desc),
    constraint index_dic_v
        unique (tableName, filedName, value)
)
    comment '字典表';

create table t_student
(
    id         bigint auto_increment comment '主键'
        primary key,
    num        varchar(100)    not null comment '学号',
    name       varchar(150)    not null comment '姓名',
    gender     enum ('1', '2') null comment '性别',
    tel        varchar(18)     null comment '电话号码',
    emerpeople varchar(150)    null comment '紧急联系人',
    emertel    varchar(18)     null comment '紧急联系人号码',
    classID    bigint          null,
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

create table dest
(
    id            bigint auto_increment comment '主键'
        primary key,
    studentID     bigint          null comment '学生id',
    provincdID    bigint          not null comment '省份',
    cityID        bigint          not null comment '市州',
    countyID      bigint          not null comment '县乡',
    detailAddress varchar(255)    not null comment '详细地址',
    holidayID     bigint          not null comment '假期表id',
    leaveDate     date            null comment '离校日期',
    isLeave       enum ('1', '2') null comment '是否离校',
    constraint fk_dest_cityID
        foreign key (cityID) references region (id),
    constraint fk_dest_countyID
        foreign key (countyID) references region (id),
    constraint fk_dest_holidayID
        foreign key (holidayID) references holiday (id),
    constraint fk_dest_provincdID
        foreign key (provincdID) references region (id),
    constraint fk_dest_studentID
        foreign key (studentID) references t_student (id)
)
    comment '去向表';

create index index_isLeave
    on dest (isLeave);

create index index_leaveDate
    on dest (leaveDate);

create index index_name
    on t_student (name);

create table t_teacher
(
    id         bigint auto_increment comment '主键'
        primary key,
    num        varchar(100) null comment '工号',
    name       varchar(150) not null comment '辅导员名字',
    tel        varchar(18)  null comment '辅导员电话号码',
    colleageID tinyint      null comment '学院',
    constraint fk_teacher_colleageID
        foreign key (colleageID) references t_colleage (id)
)
    comment '辅导员表';

create index index_name
    on t_teacher (name);

create table t_teacher_class
(
    id        bigint auto_increment comment '主键'
        primary key,
    teacherID bigint null comment '辅导员主键',
    classID   bigint null comment '班级主键',
    beginDate date   null comment '开始日期',
    endDate   date   null comment '结束日期',
    constraint index_teacher_class
        unique (teacherID, classID),
    constraint fk_class
        foreign key (classID) references t_class (id),
    constraint fk_teacher
        foreign key (teacherID) references t_teacher (id)
)
    comment '辅导员班级表';

create table userlogin
(
    id       bigint auto_increment comment '主键'
        primary key,
    account  varchar(150)                  not null comment '账号',
    name     varchar(150)                  null comment '姓名',
    pwd      varchar(255) default '123456' not null comment '密码',
    identity tinyint                       null comment '1为老师，2为学生'
)
    comment '账号表';



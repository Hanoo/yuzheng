/**
    值班信息表
 */
create table duty_info(
  id                      INT AUTO_INCREMENT  NOT NULL  COMMENT '用户唯一标志id',
  p_quantity              INT                  comment '囚犯总数',
  p_real_quantity         INT                  COMMENT '实际押犯数量',
  police_quantity         INT                  COMMENT '狱警数量',
  police_on_duty_quantity INT                  COMMENT '值班狱警数量',
  chief_officer           varchar(10)          COMMENT '总值班长',
  officer                 varchar(10)          COMMENT '值班长',
  chief_officer_tel       varchar(15)          COMMENT '总值班长电话',
  officer_tel             varchar(15)          comment '值班长电话',
  p_on_duty               varchar(50)          comment '值班员',
  p_in_station            varchar(50)          COMMENT '检查站人员',
  p_in_command_center     varchar(50)          COMMENT '指挥中心人员',
  di_insert_time          DATETIME             COMMENT '纪录插入时间',
  primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
    管理信息表
 */
create table manage_info(
  id                      INT AUTO_INCREMENT  NOT NULL  COMMENT '用户唯一标志id',
  police_quantity         INT                  COMMENT '警察数量',
  prisoner_quantity       INT                  COMMENT '押犯数量',
  prison_area_quantity    INT                  COMMENT '监区数量',
  police_on_duty          INT                  COMMENT '值班警力',
  police_on_patrol        INT                  COMMENT '执勤警力',
  police_in_reserve       INT                  COMMENT '后备警力',
  prisoner_in_reprieve    INT                  COMMENT '死缓人犯数量',
  prisoner_in_life        INT                  COMMENT '无期徒刑人犯数量',
  prisoner_in_roc         INT                  COMMENT '限制减刑人犯数量',
  prisoner_recidivist     INT                  COMMENT '累惯犯数量',
  prisoner_drug_related   INT                  COMMENT '涉毒人犯数量',
  prisoner_mobdom_related INT                  COMMENT '涉黑人犯数量',
  prisoner_cult_related   INT                  COMMENT '涉及邪教人犯',
  prisoner_old_sick       INT                  COMMENT '老弱病残人犯数量',
  prisoner_outsider       INT                  COMMENT '外地人犯数量',
  prisoner_foreigner      INT                  COMMENT '外籍人犯数量',
  prisoner_parole         INT                  COMMENT '假释人犯数量',
  prisoner_probation      INT                  COMMENT '保外执行',
  prisoner_at_large       INT                  COMMENT '在逃人犯数量',
  prisoner_imprison       INT                  COMMENT '收监数量',
  prisoner_release        INT                  COMMENT '释放人数',
  prisoner_medical_parole INT                  COMMENT '保外就医人犯数量',
  prisoner_confine        INT                  COMMENT '禁闭人犯数量',
  prisoner_strick_ctrl    INT                  COMMENT '严管数量',
  meeting_quantity        INT                  COMMENT '会见人数',
  assistor_quantity       INT                  COMMENT '外协人员',
  external_vehicle        INT                  COMMENT '外部车辆',
  mi_insert_time          DATETIME             COMMENT '纪录插入时间',
  primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
    公告新闻表
 */
create table bulletin (
  id                      char(32)    not NULL comment '主键',
  publisher               varchar(20)          comment '发布人ID',
  dispaly_text            varchar(100)         comment '实际展示内容',
  publish_time            DATE                 comment '发布时间',
  primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
    系统用户表
 */
create table yuzheng_user (
  id                      int AUTO_INCREMENT not NULL comment '主键',
  user_name               VARCHAR(20)    not null comment '用户登录名',
  user_password           varchar(12)    not null comment '登录密码',
  display_name            varchar(20)             comment '展示名称',
  prison_area             varchar(2)     not null comment '所属监区',
  primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
     警力统计历史信息
 */
CREATE TABLE jingli_history (
  id                      INT AUTO_INCREMENT not NULL comment '主键',
  dept_id                 VARCHAR(2)          COMMENT '部门ID',
  dept_no                 VARCHAR(4)          COMMENT '部门编号',
  dept_name               VARCHAR(10)         COMMENT '部门名称',
  plan_count              INT                 COMMENT '应到人数',
  real_count              INT                 COMMENT '实到人数',
  percent                 VARCHAR(10)         COMMENT '出勤百分比',
  record_time             DATETIME            COMMENT '统计时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE dianming_history (
  xh                      INT AUTO_INCREMENT NOT NULL COMMENT '自增长主键',
  pname                   varchar(60),
  aid                     varchar(20),
  begintime               DATETIME,
  endtime                 DATETIME,
  pcount                  INT,
  pcountsum               INT,
  aminute                 INT,
  jkczy                   varchar(20),
  PRIMARY KEY (xh)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE xungeng_history (
  RID                     INT AUTO_INCREMENT NOT NULL COMMENT '自增长主键',
  LineID                  varchar(3),
  AddrID                  varchar(3),
  AddrName                varchar(50),
  BeginTime               DATETIME,
  EndTime                 DATETIME,
  LogTime                 DATETIME,
  LogDate                 DATETIME,
  Xgnum                   INT,
  PRIMARY KEY (RID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
    生成初始化数据
 */
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (1, 'pa01', '49', '一监区管理员', '1');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (2, 'pa02', '49', '二监区管理员', '2');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (3, 'pa03', '49', '三监区管理员', '3');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (4, 'pa04', '49', '四监区管理员', '4');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (5, 'pa05', '49', '五监区管理员', '5');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (6, 'pa06', '49', '六监区管理员', '6');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (7, 'pa07', '49', '七监区管理员', '7');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (8, 'pa08', '49', '八监区管理员', '8');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (9, 'pa09', '49', '九监区管理员', '9');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (10, 'pa10', '49', '十监区管理员', '10');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (11, 'pa11', '49', '十一监区管理员', '11');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (12, 'pa12', '49', '十二监区管理员', '12');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (13, 'pa13', '49', '十三监区管理员', '13');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (14, 'pa14', '49', '十四监区管理员', '14');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (15, 'pa15', '49', '十五监区管理员', '15');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (16, 'pa16', '49', '十六监区管理员', '16');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (17, 'pa17', '49', '十七监区管理员', '17');
INSERT INTO `db_jianyu`.`yuzheng_user` (`id`, `user_name`, `user_password`, `display_name`, `prison_area`)
    VALUES (99, 'admin', '49', '监管员', '99');
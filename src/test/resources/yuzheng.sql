/**
    值班信息表
 */
create table duty_info(
  id                      char(10)   NOT NULL  COMMENT '用户唯一标志id',
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
  primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
    管理信息表
 */
create table manage_info(
  id                      char(10)   NOT NULL  COMMENT '用户唯一标志id',
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
create table sys_user (
  id                      char(32)    not NULL comment '主键',
  user_name               VARCHAR(20) not null comment '用户登录名',
  user_password           varchar(12) not null comment '登录密码',
  display_name            varchar(20)          comment '展示名称',
  prison_area             char(2)     not null comment '所属监区',
  primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
    生成初始化数据
 */
INSERT INTO `db_jianyu`.`duty_info` (`id`) VALUES ('theOnlyRec');
INSERT INTO `db_jianyu`.`manage_info` (`id`) VALUES ('theOnlyRec');
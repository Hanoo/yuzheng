-- eyFinger
CREATE TABLE [dbo].[Ptr_MnuLog] (
  [RID] int NOT NULL IDENTITY(1,1) ,
  [AddrCardNo] varchar(50) COLLATE Chinese_PRC_CI_AS NULL DEFAULT ((0)) ,
  [AddrID] varchar(3) COLLATE Chinese_PRC_CI_AS NOT NULL ,
  [LineID] varchar(3) COLLATE Chinese_PRC_CI_AS NULL ,
  [EnrollNo] varchar(20) COLLATE Chinese_PRC_CI_AS NULL ,
  [UserID] varchar(50) COLLATE Chinese_PRC_CI_AS NULL ,
  [LogDate] datetime NOT NULL ,
  [LogTime] varchar(50) COLLATE Chinese_PRC_CI_AS NULL ,
  [RegDate] datetime NOT NULL ,
  [MachID] varchar(3) COLLATE Chinese_PRC_CI_AS NULL ,
  [EvenRec] varchar(200) COLLATE Chinese_PRC_CI_AS NULL ,
  [OpeName] varchar(50) COLLATE Chinese_PRC_CI_AS NULL ,
  [Sign] int NULL DEFAULT ((0)) ,
  CONSTRAINT [PK__Ptr_MnuL__CAFF4132766C7FFC] PRIMARY KEY ([RID])
)
ON [PRIMARY]
GO

-- IMSDB
CREATE TABLE [dbo].[Dept_JLMnu] (
  [row_id] int NOT NULL IDENTITY(1,1) ,
  [dept_id] varchar(10) COLLATE Chinese_PRC_CI_AS NULL ,
  [description] varchar(200) COLLATE Chinese_PRC_CI_AS NULL ,
  [starttime] datetime NULL ,
  [endtime] datetime NULL ,
  [operator] varchar(20) COLLATE Chinese_PRC_CI_AS NULL ,
  CONSTRAINT [PK__Dept_JLM__6965AB5741E3A924] PRIMARY KEY ([row_id])
)
ON [PRIMARY]
GO

-- zkServer
CREATE TABLE [dbo].[zte_AreaQd_MnuLog] (
  [xh] numeric(8) NOT NULL IDENTITY(1,1) ,
  [pid] varchar(20) COLLATE Chinese_PRC_CI_AS NULL ,
  [pname] varchar(60) COLLATE Chinese_PRC_CI_AS NULL ,
  [aid] varchar(20) COLLATE Chinese_PRC_CI_AS NULL ,
  [begintime] datetime NULL ,
  [endtime] datetime NULL ,
  [pcount] numeric(5) NULL ,
  [pcountsum] numeric(5) NULL ,
  [aminute] numeric(3) NULL ,
  [jkczy] varchar(20) COLLATE Chinese_PRC_CI_AS NULL ,
  [description] varchar(50) COLLATE Chinese_PRC_CI_AS NULL ,
  CONSTRAINT [PK__zte_Area__32167A8402FC7413] PRIMARY KEY ([xh])
)
ON [PRIMARY]
GO
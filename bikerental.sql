USE [master]
GO
/****** Object:  Database [carrental]    Script Date: 17-11-2021 20:17:30 ******/
CREATE DATABASE bikerental
GO
USE bikerental
GO
CREATE TABLE companies(
	[id] [int] primary key IDENTITY,
	compname [varchar](30) NULL
	)
go
 CREATE TABLE [dbo].[customers](
	[userid] [varchar](40) primary key,
	[uname] [varchar](50) NOT NULL,
	[pwd] [varchar](20) NOT NULL,
	[phone] [varchar](10) NULL,
	[gender] [varchar](12) NULL,
	[address] [varchar](40) NULL,
	[createdon] [datetime] NULL,
	[license] [varchar](20) NULL)
	go

CREATE TABLE feedbacks(
	[id] [int] primary key IDENTITY,
	[ratings] [int] NULL,
	[feedback] [varchar](1000) NOT NULL,
	[createdon] [datetime] NOT NULL,
	[customer_id] [varchar](40) foreign key references customers(userid))
GO

CREATE TABLE users(
	[userid] [varchar](40) primary key,
	[uname] [varchar](50) NOT NULL,
	[pwd] [varchar](20) NOT NULL
)
go

CREATE TABLE variants(
	[vid] [int] primary key IDENTITY,
	[title] [varchar](30) NOT NULL,
	[price] [decimal](12, 2) NOT NULL,	
	[photo] [varchar](100) NOT NULL,
	[createdon] [datetime] NOT NULL,
	comp_id [int] foreign key references companies(id),
 )
 go

 CREATE TABLE bikes(
	bikeno [varchar](12) primary key,
	[modelyear] [int] NOT NULL,
	[status] [varchar](20) NOT NULL,
	[createdon] [datetime] NOT NULL,
	varid [int] foreign key references variants(vid),
	[deleted] [bit] NULL
 )
GO

CREATE TABLE [dbo].[bookings](
	[bid] [int] primary key IDENTITY,
	[advance] [decimal](15, 2) NOT NULL,
	[fromdate] [date] NOT NULL,
	[todate] [date] NOT NULL,
	[message] [varchar](400) NOT NULL,
	[bookingdate] [date] NOT NULL,
	[status] [varchar](20) NOT NULL,
	[billamount] [decimal](12, 2) NOT NULL,
	varid [int] foreign key references variants(vid),
	bikeid [varchar](12) foreign key references bikes(bikeno) null,
	[customer_id] [varchar](40) foreign key references customers(userid)
)

GO


CREATE TABLE [dbo].[payments](
	[pid] [int] primary key IDENTITY(1,1) NOT NULL,
	[pymtdate] [date] NOT NULL,
	[cardno] [varchar](20) NULL,
	[remarks] [varchar](50) NULL,
	[amount] [decimal](14, 2) NOT NULL,
	[booking_id] [int] foreign key references bookings(bid),
	[nameoncard] [varchar](40) NULL,
	[complete] [bit] NOT NULL)

GO



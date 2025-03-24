CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Salimbriar1203';

-- Create database scoped credential
CREATE DATABASE SCOPED CREDENTIAL credent
WITH IDENTITY = 'MANAGED IDENTITY'
GO

-- Create external data source
CREATE EXTERNAL DATA SOURCE mydatasrc WITH (
    LOCATION = 'abfss://gold@endtoendstoresyn.dfs.core.windows.net',
    CREDENTIAL = credent
)
GO

-- Create external file format
CREATE EXTERNAL FILE FORMAT ParquetFileFormat1
WITH (
    FORMAT_TYPE = PARQUET
);


--Create External Table gold_df
CREATE EXTERNAL TABLE [dbo].[gold_df]
(
[Video_id] NVARCHAR(4000) NULL,
[Title] NVARCHAR(4000) NULL,
[Published_at] DATE,
[Channel_id] NVARCHAR(4000) NULL,
[Channel_title] NVARCHAR(4000) NULL,
[Category_id] INT NULL,
[Tags] NVARCHAR(4000) NULL,
[View_count] INT NULL,
[Likes] INT NULL,
[Dislikes] INT NULL,
[Comment_count] INT NULL,
[Thumbnail_link] NVARCHAR(4000) NULL,
[Description] NVARCHAR(4000) NULL,
[Sentiment] NVARCHAR(4000) NULL
)
WITH
(
	LOCATION = 'gold_df/',
	DATA_SOURCE = mydatasrc,
	FILE_FORMAT = "ParquetFileFormat1"
)

SELECT * FROM dbo.gold_df


--Create External Table gold_df_avg_view_count
CREATE EXTERNAL TABLE [dbo].[gold_df_avg_view_count]
(
[Sentiment] NVARCHAR(4000) NULL,
[Average_View_Count] INT NULL
)
WITH
(
	LOCATION = 'gold_df_avg_view_count/',
	DATA_SOURCE = mydatasrc,
	FILE_FORMAT = "ParquetFileFormat1"
)

SELECT * FROM dbo.gold_df_avg_view_count


--Create External Table gold_df_avg_likes
CREATE EXTERNAL TABLE [dbo].[gold_df_avg_likes]
(
[Sentiment] NVARCHAR(4000) NULL,
[Average_Likes] INT NULL
)
WITH
(
	LOCATION = 'gold_df_avg_likes/',
	DATA_SOURCE = mydatasrc,
	FILE_FORMAT = "ParquetFileFormat1"
)

SELECT * FROM dbo.gold_df_avg_likes


--Create External Table gold_df_avg_dislikes
CREATE EXTERNAL TABLE [dbo].[gold_df_avg_dislikes]
(
[Sentiment] NVARCHAR(4000) NULL,
[Average_Dislikes] INT NULL
)
WITH
(
	LOCATION = 'gold_df_avg_dislikes/',
	DATA_SOURCE = mydatasrc,
	FILE_FORMAT = "ParquetFileFormat1"
)

SELECT * FROM dbo.gold_df_avg_dislikes


--Create External Table gold_df_avg_comment_count
CREATE EXTERNAL TABLE [dbo].[gold_df_avg_comment_count]
(
[Sentiment] NVARCHAR(4000) NULL,
[Average_Comment_Count] INT NULL
)
WITH
(
	LOCATION = 'gold_df_avg_comment_count/',
	DATA_SOURCE = mydatasrc,
	FILE_FORMAT = "ParquetFileFormat1"
)

SELECT * FROM dbo.gold_df_avg_comment_count
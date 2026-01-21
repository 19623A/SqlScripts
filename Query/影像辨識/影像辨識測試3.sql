USE [WEBRO]
GO

INSERT INTO [dbo].[SF_CartonRecognition]
           ([id]
           ,[CameNO]
           ,[ProdType]
           ,[MarkType]
           ,[Time]
           ,[PurchaseOrderNO]
           ,[CustomerPtnNo]
           ,[PrtSize]
           ,[Ctnno]
           ,[TotalPairs]
           ,[TotalText]
           --,[PairsCtn]
           --,[SalesNoteNO]
           --,[ItemNO]
           --,[LotNo]
           --,[img_path]
           --,[tState]
           )
     VALUES
          ('jap748'
           ,2
           ,0
           ,'Side'
           ,'2026-01-20 18:02:13'
           ,null
           ,'11GT250214'
           ,25.5
           ,'0090'
           ,120
           ,'ITEMNO.11GT250214¡USIZE: 23.5¡UQTY: 10 PRS 4.5¡UC/NO.: 0090 OF120 37¡UN.W.: 7.5 KGS 23.5 35¡UG.W.: 8.2 KGS¡UMEAS:59.0X34.5 X31.5 CM¡UJAPAN¡UCIC2601YD 06'
           --,<PairsCtn, int,>
           --,<SalesNoteNO, varchar(30),>
           --,<ItemNO, char(2),>
           --,<LotNo, tinyint,>
           --,<img_path, varchar(100),>
           --,<tState, char(1),>
           )
GO



USE [WEBRO]
GO

SELECT [id]
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
      ,[PairsCtn]
      ,[SalesNoteNO]
      ,[ItemNO]
      ,[LotNo]
      ,[img_path]
      ,[tState]
  FROM [dbo].[SF_CartonRecognition]
  where [Time] like '2026%'¡@ORDER BY [Time] desc
  --WHERE id='U1235'
GO



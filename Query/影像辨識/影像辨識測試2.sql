Declare 
	@CustomerPtnNo nvarchar(50) = '1B1072S1P'
	,@Ctnno char(4) = '0099'
	,@PurchaseOrderNO char(50) = 'A25-4998                                          '
	,@PrtSize decimal(3, 1) = 42.0

SELECT 
	--TOP 1 WITH TIES
	cp.SalesNoteNO
	,cp.ItemNO
	,cp.LotNO
	,oss.PurchaseOrderNO
	,oss.OrderNO
	,osr.CustomerPtnNo
	,cp.CTNNO
	,bm.PrtSize -- 避免 NULL 影響比對
	,cp.PairsCtn
	,osr.RTD
	,ROW_NUMBER() OVER ( PARTITION BY osr.CustomerPtnNo , cp.CTNNO ORDER BY ABS ( DATEDIFF ( DAY, osr.RTD, GETDATE()))) AS rn
FROM 
	[WEBERP].[WEBERP].[dbo].[CP_OrderSizeBarDetail] cp
INNER JOIN 
	[WEBERP].[WEBERP].[dbo].[CP_OrderSizeRun] osr 
ON 
	cp.SalesNoteNO = osr.SalesNoteNO 
	AND cp.ItemNO = osr.ItemNO 
	AND cp.LotNO = osr.LotNO
INNER JOIN 
	[WEBERP].[WEBERP].[dbo].[CP_OrderSheet] oss 
ON 
	cp.SalesNoteNO = oss.SalesNoteNO
LEFT JOIN 
	[WEBERP].[WEBERP].[dbo].[BM_StdSize] bm 
ON 
	osr.SizeType = bm.SizeTypeID 
	AND cp.OrderSize = bm.StdSizeCode
WHERE　
	osr.CustomerPtnNo =　@CustomerPtnNo
	AND cp.CTNNO = @Ctnno
	AND(
		(@PurchaseOrderNO IS NOT NULL AND ( oss.PurchaseOrderNO = @PurchaseOrderNO OR oss.OrderNO = @PurchaseOrderNO))
		OR
		(@PurchaseOrderNO IS NULL AND bm.PrtSize = @PrtSize)  -- 當 PurchaseOrderNO 為 NULL 時，用 PrtSize 匹配
	) 

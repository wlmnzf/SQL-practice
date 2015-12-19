Create Procedure  CountDocument
(
  @proId int=0,  
  @startDate smalldatetime, 
  @endDate smalldatetime
)  
as  
select '进货数量' as Title, SUM(Count)as Count from PurchaseProduction where ProId=@proId and(select count(1) from PurchaseDocument where SerialNumbers=PurchaseProduction.SerialNumbers and PurchaseDocument.PurchaseDate>=@startDate and PurchaseDocument.PurchaseDate<=@endDate )>0
select '销售数量' as Title, SUM(Count)as Count from SellProduction where ProId=@proId and(select count(1) from SellDocument where SerialNumbers=SellProduction.SerialNumbers and SellDocument.SellDate>=@startDate and SellDocument.SellDate<=@endDate ) >0






create Procedure  CountProduction
(
  @startDate smalldatetime, 
  @endDate smalldatetime
)  
as  
select ProId, SUM(Count)as Count from PurchaseProduction where (select count(1) from PurchaseDocument where SerialNumbers=PurchaseProduction.SerialNumbers and PurchaseDocument.PurchaseDate>=@startDate and PurchaseDocument.PurchaseDate<=@endDate )>0 group by ProId
select ProId, SUM(Count)as Count from SellProduction where (select count(1) from SellDocument where SerialNumbers=SellProduction.SerialNumbers and SellDocument.SellDate>=@startDate and SellDocument.SellDate<=@endDate ) >0  group by ProId



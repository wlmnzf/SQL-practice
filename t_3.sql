Go
CREATE VIEW document_view
AS
   SELECT DocumentId, SerialNumbers,'销售单'as DocumentType,SellDate, Remark
   FROM SellDocument where convert(nvarchar(6),getdate(),112)=convert(nvarchar(6),SellDate,112)
union
   SELECT DocumentId, SerialNumbers,'销售退货单据'as DocumentType,SellDate,Remark
 from SellRefundDocument where convert(nvarchar(6),getdate(),112)=convert(nvarchar(6),SellDate,112)


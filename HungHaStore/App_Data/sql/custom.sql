USE [hung_ha_store]
GO

INSERT INTO [dbo].[nguoi_dung]([tai_khoan],[mat_khau],[email],[tg_tao]) VALUES (<tai_khoan, nvarchar(255),>,<mat_khau, nvarchar(255),>,<email, nvarchar(255),><tg_tao, date,>)
GO


USE [hung_ha_store]
GO

SELECT * FROM [dbo].[nguoi_dung] where tai_khoan = 'mitt.hai.7356' and mat_khau = '123456'

GO


SELECT * FROM [dbo].[nguoi_dung] where tai_khoan = 'mitt.hai.7356' and mat_khau = '123456'

USE [hung_ha_store]
GO

DELETE FROM [dbo].[nguoi_dung]


select * from san_pham where ten = N'K? ?? sách báo g? MDF ph? melamine GHS-2397'






USE [hung_ha_store]
GO

UPDATE [dbo].[san_pham]
   SET id_kho = 674
 WHERE id = 225



 USE [hung_ha_store]
GO

INSERT INTO [dbo].[kho]
           ([so_luong])
     VALUES(0)
         
GO






 USE [hung_ha_store]
GO

DELETE FROM [dbo].[san_pham]
      WHERE id = 223
GO




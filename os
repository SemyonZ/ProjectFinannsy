SELECT
                                    sotr.id as [strEmplID1C],
                                    CAST(Sotr.Code as int) AS [nInternalID], 
                                    Sotr.Descr as [strFio],
                                    dol.descr as [strPosition]
                                    FROM 
                                    [fs6].[ZPL_Filial].[dbo].[sc442] as Sotr
                                    LEFT JOIN [fs6].[ZPL_Filial].[dbo].[sc157] as dol on dol.id = (
                                    select top 1
                                    left(c386_vv.value, 9)
                                    from
                                    [fs6].[ZPL_Filial].[dbo].[_1sconst] as c386_vv  
                                    where
                                    c386_vv.id = 386 and
                                    c386_vv.objid = Sotr.id and
                                    (c386_vv.date <= @dDate)
                                    --order by c386_vv.date desc, c386_vv.time desc, c386_vv.docid desc, c386_vv.row_id desc
                                    )
                                    WHERE (
                                    select top 1
                                    left(c416_vv.value, 9)
                                    from
                                    [fs6].[ZPL_Filial].[dbo].[_1sconst] as c416_vv  
                                    where
                                    c416_vv.id = 416 and
                                    c416_vv.objid = Sotr.id and
                                    (c416_vv.date <= @dDate)
                                   -- order by c416_vv.date desc, c416_vv.time desc, c416_vv.docid desc, c416_vv.row_id desc
                                    ) IN ('   10Z   ','   110   ')
UNION ALL
SELECT
                                    [Empl].id AS [strEmplID1C],
                                    CAST([Empl].code as int) AS [nInternalID],
                                    [Empl].descr AS [strFio],
                                    [pos].descr AS [strPosition]
                                    FROM [ZPL_3Park].[dbo].[sc16] AS [Empl]
                                    LEFT JOIN [ZPL_3Park].[dbo].[sc193] AS [pos] 
	                                    ON [pos].id = (
				                                    select top 1
				                                    left(c175_vv.value, 9)
				                                    from [ZPL_3Park].[dbo].[_1sconst] as c175_vv 
				                                    where c175_vv.id = 175 and
				                                    c175_vv.objid = [Empl].id and
				                                    (c175_vv.date <= @dDate)
				                                   -- order by c175_vv.date desc, c175_vv.time desc, c175_vv.docid desc, c175_vv.row_id desc
				                                    )
                                    WHERE [Empl].isfolder = 2
	                                    AND (
		                                    select top 1
		                                    left(c220_vv.value, 9)
		                                    from
		                                    [ZPL_3Park].[dbo].[_1sconst] as c220_vv  
		                                    where
		                                    c220_vv.id = 220 and
		                                    c220_vv.objid = [Empl].id and
		                                    (c220_vv.date <= @dDate)
		                                  --  order by c220_vv.date desc, c220_vv.time desc, c220_vv.docid desc, c220_vv.row_id desc
		                                    ) in ('    66   ','    68   ')

UNION ALL
SELECT 
[fe].[IDFrom1C] AS [strEmplID1C],
[fe].[InternalID] AS [nInternalID],
[fe].[FIO] AS [strFio],
(SELECT 'форт') AS [strPosition]
FROM [PE-1C].[dbo].[FortEmployees] as [fe]
END



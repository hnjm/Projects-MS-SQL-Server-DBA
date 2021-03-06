﻿

create view [inf].[vLocks] as
/*
	ГЕМ: Сведения о блокировках
*/
SELECT 
        t1.resource_type,
        t1.resource_database_id,
        t1.resource_associated_entity_id,
        t1.request_mode,
        t1.request_session_id,
        t2.blocking_session_id
    FROM sys.dm_tran_locks as t1
    INNER JOIN sys.dm_os_waiting_tasks as t2
        ON t1.lock_owner_address = t2.resource_address;


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Сведения о блокировках экземпляра MS SQL Server', @level0type = N'SCHEMA', @level0name = N'inf', @level1type = N'VIEW', @level1name = N'vLocks';


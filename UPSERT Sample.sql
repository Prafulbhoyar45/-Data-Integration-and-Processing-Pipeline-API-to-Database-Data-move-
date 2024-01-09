/****** Object:  StoredProcedure [KB4].[Employee_Table_Load]    Script Date: 3/7/2023 1:09:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [KB4].[Employee_Table_Load] AS 
/*
	Created:	12/14/2021	Trevor White

	This SP will insert/update records from [ExternalTables].[KB4_Employee]  to [KB4].[Employee] on a daily basis 
									
*/

BEGIN
MERGE KB4.Employee AS Target
    USING [ExternalTables].[KB4_Employee]	AS Source
    ON Source.id = Target.id

    
    -- For Inserts
    WHEN NOT MATCHED BY Target THEN
        INSERT ([id]
      ,[employee_number]
      ,[first_name]
      ,[last_name]
      ,[job_title]
      ,[email]
      ,[phish_prone_percentage]
      ,[phone_number]
      ,[extension]
      ,[mobile_phone_number]
      ,[location]
      ,[division]
      ,[manager_name]
      ,[manager_email]
      ,[adi_manageable]
      ,[adi_guid]
      ,[current_risk_score]
      ,[joined_on]
      ,[last_sign_in]
      ,[status]
      ,[organization]
      ,[department]
      ,[language]
      ,[comment]
      ,[employee_start_date]
      ,[archived_at]
      ,[custom_field_1]
      ,[custom_field_2]
      ,[custom_field_3]
      ,[custom_field_4]
      ,[custom_date_1]
      ,[custom_date_2]
      ,[pull_date]) 
        
	   VALUES (
	   source.[id]
      ,source.[employee_number]
      ,source.[first_name]
      ,source.[last_name]
      ,source.[job_title]
      ,source.[email]
      ,source.[phish_prone_percentage]
      ,source.[phone_number]
      ,source.[extension]
      ,source.[mobile_phone_number]
      ,source.[location]
      ,source.[division]
      ,source.[manager_name]
      ,source.[manager_email]
      ,source.[adi_manageable]
      ,source.[adi_guid]
      ,source.[current_risk_score]
      ,source.[joined_on]
      ,source.[last_sign_in]
      ,source.[status]
      ,source.[organization]
      ,source.[department]
      ,source.[language]
      ,source.[comment]
      ,source.[employee_start_date]
      ,source.[archived_at]
      ,source.[custom_field_1]
      ,source.[custom_field_2]
      ,source.[custom_field_3]
      ,source.[custom_field_4]
      ,source.[custom_date_1]
      ,source.[custom_date_2]
      ,source.[pull.date]
	  )
	  
 
    -- For Updates
    WHEN MATCHED THEN UPDATE SET
      Target.[employee_number] = source.[employee_number]
      ,Target.[first_name] = source.[first_name]
      ,Target.[last_name] = source.[last_name]
      ,Target.[job_title] = source.[job_title]
      ,Target.[email] = source.[email]
      ,Target.[phish_prone_percentage] = source.[phish_prone_percentage]
      ,Target.[phone_number] = source.[phone_number]
      ,Target.[extension] = source.[extension]
      ,Target.[mobile_phone_number] = source.[mobile_phone_number]
      ,Target.[location] = source.[location]
      ,Target.[division] = source.[division]
      ,Target.[manager_name] = source.[manager_name]
      ,Target.[manager_email] = source.[manager_email]
      ,Target.[adi_manageable] = source.[adi_manageable]
      ,Target.[adi_guid] = source.[adi_guid]
      ,Target.[current_risk_score] = source.[current_risk_score]
      ,Target.[joined_on] = source.[joined_on]
      ,Target.[last_sign_in] = source.[last_sign_in]
      ,Target.[status] = source.[status]
      ,Target.[organization] = source.[organization]
      ,Target.[department] = source.[department]
      ,Target.[language] = source.[language]
      ,Target.[comment] = source.[comment]
      ,Target.[employee_start_date] = source.[employee_start_date]
      ,Target.[archived_at] = source.[archived_at]
      ,Target.[custom_field_1] = source.[custom_field_1]
      ,Target.[custom_field_2] = source.[custom_field_2]
      ,Target.[custom_field_3] = source.[custom_field_3]
      ,Target.[custom_field_4] = source.[custom_field_4]
      ,Target.[custom_date_1] = source.[custom_date_1]
      ,Target.[custom_date_2] = source.[custom_date_2]
      ,Target.[pull_date] = source.[pull.date];
END
GO



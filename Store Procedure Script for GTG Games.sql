/****** Object:  StoredProcedure [GTG].[MVP_Data_Load]  ******/
CREATE PROCEDURE [GTG].[MVP_Data_Load] AS MVP_Data_Loading
BEGIN
MERGE GTG.MVP_Data AS Target
    USING GTG.MVP_Data_Staging	AS Source
    ON Source.game_id = Target.game_id
    -- For Inserts
    WHEN NOT MATCHED BY Target THEN
        INSERT ([game_type]
      ,[game_id]
      ,[game_name]
      ,[total_games_started]
      ,[total_games_finished]
      ,[total_game_time_sec]
      ,[avg_game_time_sec])
      
      VALUES (
	   source.[game_type]
      ,source.[game_id]
      ,source.[game_name]
      ,source.[total_games_started]
      ,source.[total_games_finished]
      ,source.[total_game_time_sec]
      ,source.[avg_game_time_sec])
      
      -- For Updates
    WHEN MATCHED THEN UPDATE SET
      Target.[game_type] = source.[game_type]
      ,Target.[game_id] = source.[game_id]
      ,Target.[game_name] = source.[game_name]
      ,Target.[total_games_started] = source.[total_games_started]
      ,Target.[total_games_finished] = source.[total_games_finished]
      ,Target.[total_game_time_sec] = source.[total_game_time_sec]
      ,Target.[avg_game_time_sec] = source.[avg_game_time_sec];
END
GO

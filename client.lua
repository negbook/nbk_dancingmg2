local json = "[141000,15479,[4,0],[4,540],[4,590],[1,1088],[4,1048],[3,1073],[3,540],[3,523],[1,1167],[3,1065],[2,1058],[4,1062],[2,1165],[1,1020],[2,1154],[2,567],[4,555],[2,1087],[3,992],[1,1137],[1,556],[3,541],[2,1121],[2,497],[3,537],[2,1091],[4,468],[2,588],[4,1108],[1,996],[4,1148],[1,522],[4,578],[1,562],[3,480],[3,551],[1,537],[2,1086],[3,519],[2,545],[2,554],[4,584],[2,516],[4,543],[4,1049],[4,987],[3,1242],[1,420],[3,454],[2,1229],[2,1073],[4,1125],[1,337],[4,617],[2,1234],[1,563],[3,537],[4,505],[2,514],[2,512],[4,533],[4,1100],[1,539],[4,549],[3,531],[4,555],[2,527],[1,580],[3,1051],[2,530],[3,510],[2,1120],[1,1086],[2,1073],[4,539],[2,516],[2,1134],[3,505],[1,505],[2,1139],[4,538],[3,516],[1,545],[4,598],[3,499],[2,511],[1,1169],[3,518],[4,552],[2,1140],[3,513],[1,506],[2,1065],[4,517],[3,545],[4,503],[2,649],[4,499],[3,564],[1,502],[2,563],[3,1048],[4,1110],[2,523],[1,545],[2,1134],[4,474],[3,594],[4,545],[1,551],[4,520],[2,556],[1,523],[3,498],[2,539],[3,637],[4,456],[2,597],[1,535],[3,500],[2,1121],[2,537],[2,550],[4,1122],[3,418],[1,461],[3,1232],[4,545],[2,592],[1,492],[3,599],[4,468],[1,592],[2,1034],[2,561],[2,538],[3,1130],[2,490],[1,455],[4,1167],[1,552],[3,541],[4,1148],[1,584],[4,454],[2,606],[1,554],[3,517],[4,516],[1,525],[2,535],[2,436],[1,557],[3,518],[4,616],[4,602],[1,501],[3,1184],[3,490],[1,473],[4,1203],[1,527],[4,520],[4,1104],[4,487],[3,524],[2,572],[1,611],[3,519],[1,565],[4,1004],[1,641],[3,437]]"										

local showScore = true 
Citizen.CreateThread(function()
    

	while true do 
	
		Citizen.Wait(1000)
		if scaleform then 

				BeginScaleformMovieMethod(scaleform, "GET_CURRENT_RESULT")
				local value = EndScaleformMovieMethodReturn()
				while not IsScaleformMovieMethodReturnValueReady(value) do
					Wait(0)
				end
				local cb = GetScaleformMovieMethodReturnValueInt(value)
				print("result:"..cb)
				BeginScaleformMovieMethod(scaleform, "GET_CURRENT_SCORE")
				local value = EndScaleformMovieMethodReturn()
				while not IsScaleformMovieMethodReturnValueReady(value) do
					Wait(0)
				end
				local cb = GetScaleformMovieMethodReturnValueInt(value)
				print("score:"..cb)
				BeginScaleformMovieMethod(scaleform, "GET_MUSIC_STATE")
				local value = EndScaleformMovieMethodReturn()
				while not IsScaleformMovieMethodReturnValueReady(value) do
					Wait(0)
				end
				local cb = GetScaleformMovieMethodReturnValueInt(value)
				print("music state:"..cb)
				
				
		end 
		
	end 

end)
Citizen.CreateThread(function()
	
	
		while true do

	  	Wait(0)
			 if scaleform ~= nil then 

				DrawScaleformMovieFullscreen(scaleform ,255, 255, 255, 120)
			end 
			EnableControlAction(2, 188, 1);
			EnableControlAction(2, 187, 1);
			EnableControlAction(2, 189, 1);
			EnableControlAction(2, 190, 1);
			
			if scaleform then 
			if (IsControlJustPressed(2, 188))  
			then
				
				PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT")
				PushScaleformMovieFunctionParameterInt(8)
				PopScaleformMovieFunctionVoid()
				
			end 
			if (IsControlJustPressed(2, 187))
			then
				PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT")
				PushScaleformMovieFunctionParameterInt(9)
				PopScaleformMovieFunctionVoid()
			end
			if (IsControlJustPressed(2, 189))
			then
				PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT")
				PushScaleformMovieFunctionParameterInt(10)
				PopScaleformMovieFunctionVoid()
			end 
			if (IsControlJustPressed(2, 190))
			then
				PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT")
				PushScaleformMovieFunctionParameterInt(11)
				PopScaleformMovieFunctionVoid()
			end
			end 
			if IsControlJustReleased(0, 154) then
				
				TriggerMusicEvent("APT_SUDDEN_DEATH_START_MUSIC")
				scaleform = RequestScaleformMovie("NBK_DANCINGMG2")
				while not HasScaleformMovieLoaded(scaleform) do
					Citizen.Wait(0)
				end
				--18129-2650,
				PushScaleformMovieFunction(scaleform, "START_DANCE_TIME_MODE2")
				PushScaleformMovieFunctionParameterString(json)
				PopScaleformMovieFunctionVoid()
                
                PushScaleformMovieFunction(scaleform, "SET_SCORES_DISPLAY")
				PushScaleformMovieFunctionParameterString(showScore)
				PopScaleformMovieFunctionVoid()
			end
			if IsControlJustReleased(0, 145) then
				
				TriggerMusicEvent("APT_SUDDEN_DEATH_MUSIC_END")
				
				SetScaleformMovieAsNoLongerNeeded(scaleform)
				scaleform = nil 
			end
			
		end 
end)
class DiceController < ApplicationController
  
  def welcome
  	@target = 0
  end

  def roll
    @target = params["target_point"].to_i

    @dice1 = 1 + rand(6)
  	@dice2 = 1 + rand(6)   
    
  	if @target == 0	
      @cur_point = @dice1 + @dice2
  		if @cur_point == 7 || @cur_point == 11
  			@message = "YOU WIN!"
  			@next_step = "Start Over"
  			@target = 0
        
  		elsif @cur_point == 2 || @cur_point == 3 || @cur_point == 12		 	 
  			@message = "YOU LOSE." 	
  			@next_step = "Start Over"	
  			@target = 0	
        
  		else
  			@message = "Your goal is now #{@cur_point}."
  			@message_supp = "Now try to get #{@cur_point} before you roll a 7."
  			@next_step = "Roll the dice"
  			@target = @cur_point       
  		end
  	else
      @cur_point = @dice1 + @dice2
      if @cur_point == 7
        @message = "YOU LOSE." 	
  			@next_step = "Start Over"	
  			@target = "0"		
      elsif @cur_point == @target
        @message = "YOU WIN!"
        @next_step = "Start Over"
        @target = "0"
      else 
  		  @message = "Your goal is now #{@target}."
        @message_supp = "Now try to get #{@target} before you roll a 7."
  		  @next_step = "Roll the dice"
      end
  	end
  end
  
end

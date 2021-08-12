<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
    </head>
    <body>
        
        <hr />
        <hr style="background-color:#a2b7cd; height:20px">
        <div style="background-color:#ffcf03"><br><br>
	        <h1 align="center"><font color="#373737"><b>대여하실 일정을 선택해주세요<b></b></h1><br>
	        <div class="text" align="center">
		        <tr><td>
		        <label for="start"><font color="white" style="font-size:1.5em">대여 시작일 :&nbsp;</font></label>
		
				<input style="size:1.5em; width:160px; height:32px" type="date" id="start_date" name="start_date"
				       value="대여 시작일"
				       min="2021-01-01" max="2121-12-31">
				
				<script>
					document.getElementById('start_date').valueAsDate = new Date();
				</script>
	
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		        <label for="end"><font color="white" style="font-size:1.5em">대여 종료일 :&nbsp;</font></label>
		
				<input style="size:1.5em; width:160px; height:32px" type="date" id="end_date" name="end_date"
				       value='대여 종료일'
				       min="2021-01-01" max="2121-12-31">
				          
				<script>
					document.getElementById('end_date').valueAsDate = new Date();
				</script>
				
			    </td></tr>
		    
		    </div>
		    <br><br>
		    <div class="text-center">
			    <button style="background-color:white; border-color:black; color:black; font-size:1.5em" type="reset" name="date_reset" id="date_reset"><img src="images/" alt="">날짜 초기화</button>
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <button style="background-color:#373737; border-color:black; color:white; font-size:1.5em" type="submit" name="date_submit" id="date_submit" onClick="location.href='/zikcam/prod/rentalTent'"><img src="images/" alt="">확인</button>
			</div>
		    <br><br>
	    </div>
	    <hr style="background-color:#a2b7cd; height:20px"><hr />
        
       
    </body>
</html>

<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
</script>
<script type="text/javascript" src="js/sha.js"></script>
<%
		String SALTCHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		 StringBuffer salt = new StringBuffer();
		 java.util.Random rnd = new java.util.Random();
		 // build a random 9 chars salt 
		 while (salt.length() < 16)
		 {
		   int index = (int) (rnd.nextFloat() * SALTCHARS.length());
		   salt.append(SALTCHARS.substring(index, index+1));
		 }
		 String saltStr=salt.toString();
		 session.setAttribute("phash",saltStr);
		%>
<script type="text/javascript">
	$(document).ready(function() {
    	$("input[name='savebutton']").click(function(){
    		var sPassword = $('#newPassword').val();
        	//alert($('#firstName').val()  + "hello");
   <!-- 			04-03-2020 start AK --> 
 		  if($('#password').val()=="")
			{
			
 			  alert("Please Enter Existing Password");	
				return false;
			}	
   	
   
        	if($('#newPassword').val()=="")
        		{
        			alert("Please Enter New Password");	
        			return false;
        		}
        	else if(!validatePassowrd(sPassword))
			{
   				alert('Password should be between 8-16 alphanumeric characters & must contain one upper,lower case & a special character');
   				//e.preventDefault();
   				return false;
   			}
        	else if ($('#reTypeNewPassword').val()=="")
    		{
    			alert("Please Enter Re-type New Password");	
    			return false;
    		}
        	/* else if($('#newPassword').val()!=$('#reTypeNewPassword').val())
    		{
    			alert("Not Same");	
    			return false;
    		} */
    		<!-- 			04-03-2020 end AK -->   	
        	else 
        		{
        		var ps = this.form.password.value;
        		var newPs = this.form.newPassword.value;
        		var NewPsRet = this.form.reTypeNewPassword.value;
        		//alert(ps);
        		//alert(newPs);
        		var salt = '<%=session.getAttribute("phash").toString()%>';
				var hashObj = new jsSHA("SHA-1","TEXT",{numRounds:parseInt(1,10)});
				hashObj.update(ps);
				var saltedPs1 = hashObj.getHash("B64");
				
				var hashObjPs = new jsSHA("SHA-1","TEXT",{numRounds:parseInt(1,10)});
				hashObjPs.update(saltedPs1+salt);
				var saltedPs = hashObjPs.getHash("B64");
				
				//alert(saltedPs);
				var hashObj1 = new jsSHA("SHA-1","TEXT",{numRounds:parseInt(1,10)});
				hashObj1.update(newPs);
				var saltedNewPs = hashObj1.getHash("B64");
				
				var hashObj4 = new jsSHA("SHA-1","TEXT",{numRounds:parseInt(1,10)});
				hashObj4.update(NewPsRet);
				var saltedNewPsRet = hashObj4.getHash("B64");
				
				
				//alert(saltedNewPs);
				
				document.changePassword.password.value = saltedPs;
				document.changePassword.newPassword.value = saltedNewPs;
				document.changePassword.reTypeNewPassword.value = saltedNewPsRet;
				
        		document.changePassword.action="changePasswordSubmit";
    			document.changePassword.submit();
    			//return false;
        		}
    	});
		
		
		 	
	});      
	
	/* 
	$(function() {
		("#changePassword").validate({
			$.validator.addMethod("pwcheck",
					function(value, element) {
				return /^[A-Za-z0-9\d=!\-@._*]+$/.test(value);
			}
		});
	}); */
		function validatePassowrd(sPassword){
			var filter = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{7,17}$/;
			if (filter.test(sPassword)) {
				return true;
				}
			else {
				return false;
			}
		}
</script>
<%-- <s:actionerror/> --%>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:form theme="simple" 	 name="changePassword" id="changePassword">
	<table border = "0">
		<tr><th colspan="7" class="mainheading">Change Password</th></tr>
		<tr>
			<td width="20%">Existing Password<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"><input type="password" size="22" name="password" id="password"/></td>
			<td width="2%"></td>
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>
		</tr>
		<tr>
			<td>New Password<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><input type="password" size="22" name="newPassword" id="newPassword"/></td>	
		</tr>
		<tr>
			<td>Re-Type New Password<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><input type="password" size="22" name="reTypeNewPassword" id="reTypeNewPassword"/></td>	
		</tr>
		<tr><td colspan="7"><span class="tooltip">Note : Password should be between 8-16 alphanumeric characters & must contain one upper case & special character</span></td></tr>
		<tr><td colspan="7"></td></tr>
		<tr><td colspan="7" align="right"><input type="submit" id="savebutton"  name="savebutton" value="Change Password" class="formbutton" />&nbsp;&nbsp;<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;<s:submit type="submit" id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/></td></tr>
	</table>
	<s:token/>
</s:form>	
            	
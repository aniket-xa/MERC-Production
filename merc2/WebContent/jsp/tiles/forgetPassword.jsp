<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
</script>
<script type="text/javascript">
	$(document).ready(function() {
		
		
    	$("input[name='savebutton']").click(function(){
    		var filterLoginId = /^([0-9a-zA-Z]+)$/;
    		var sEmail = $('#email').val();
    		if($('#userId').val()=="" )
    		{
    			alert("Please enter Login Id.");
    			$('#userId').focus();
    			return false;
    		}
    		/* else if($('#email').val()!="" && !validateEmail(sEmail))
    		{
    			alert('Invalid Email Address.');
       			//e.preventDefault();
       			$('#email').focus();
       			return false;
       		} */
       		else if(filterLoginId.test($('#userId').val())==false)
			{					
				alert("Login Id should be alphanumeric.");
				$('#userId').focus();
				return false;
			}
    		else
    		{
    			document.forgetPassword.action="forgetPasswordSubmit";
    			document.forgetPassword.submit();
    		}
    	});		 	
	});
/* 	function validateEmail(sEmail)
	{
		var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (filter.test(sEmail)) {
			return true;
		}
		else {
			return false;
		}
	} */
</script>


<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:form theme="simple" name="forgetPassword" id="forgetPassword">
	<table border = "0">
		<tr><th colspan="7" class="mainheading">Forgot Password</th></tr>
		<tr>
			<td width="20%">Login Id<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"><s:textfield size="22" name="userName" id="userId"/></td>
			<td width="2%"></td>
			<td width="15%"><img src="Captcha.jpg" border="0"/></td>
			<td width="6%">Enter Text</td>
			<td width="28%"><s:textfield label="Code" name="captchaResponse" id="captchaResponse" size="24" maxlength="10"/></td>
		</tr>
		<!-- <tr>
			<td></td>
			<td></td>
			<td colspan="5">OR</td>	
		</tr> -->
		<%-- <tr>
			<td>Email Address<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><input type="text" size="22" name="email" id="email"/></td>	
		</tr> --%>
		<tr><td colspan="7"></td></tr>
		<tr><td colspan="7"><span class="tooltip"><s:actionmessage/></span></td></tr>
		<tr><td colspan="7"></td></tr>
		<tr>
		<td colspan="7" align="right">
			<input type="submit" id="savebutton"  name="savebutton" value="Forgot Password" class="formbutton" />&nbsp;&nbsp;
			<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
			<s:a href="/cerc/"><input type="button" id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton"/></s:a>
		</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
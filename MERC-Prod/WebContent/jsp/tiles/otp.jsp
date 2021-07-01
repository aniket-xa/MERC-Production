<%@ page import="com.nic.cerc.pojo.registration.CercUser" %>
<%@ taglib uri="/struts-tags"  prefix="s" %>
<%@ page session="true" %>
<script type="text/javascript">
<!-- 			04-14-2020 start AK -->
function Backfunction(){
// 	alert("");
	document.otpVerification.action="newRegistration?struts.token.name=token&token=<s:property value="token"/>";
	document.otpVerification.submit();
}

// <!-- 		04-14-2020 end AK -->

// function resendfunction(){
// 	alert("otp");
// 	document.otpVerification.action="Resendotp";
// 	document.otpVerification.submit();
// }

$(document).ready(function() {
	
	
	$("#reportWindow").click(function(event) {
	    	   event.preventDefault();
	           event.stopPropagation();
	           winddd = window.open(this.href,"report",'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no');
	       });
	});
</script>	       

<h3>OTP VERIFICATION</h3>
<table width="100%" border="0">
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:form theme="simple" name="otpVerification" action="otpVerification" id="otpVerification" method="post" enctype="multipart/form-data">
<tr><td width="30%"><h3>Please enter the otp sent on</h3></td><td>
<%-- <s:property value="mobile"/> --%>
<!-- 			04-14-2020 start AK -->
<% try{ CercUser cercUser = (CercUser)session.getAttribute("cercUser");
String phoneNumber = cercUser.getMobile();
String mobile=request.getParameter("mobile"); 
out.print( phoneNumber);
// session.getAttribute("mobile"); 
// out.print("fromsessionmobile "+ mobile);
}
catch(Exception e){
}
%>
<!-- 			04-14-2020 end AK -->
</td></tr>
	  		<tr>
				<td colspan="7">
					<s:textfield label="Code" name="otp" id="otp" size="24" maxlength="10" value=""/>				
	  			</td>
	  		</tr>
<tr><td colspan="7"></td></tr>
<tr><td colspan="7" align="right">
<input type="submit" id="savebutton"  name="savebutton" value="Save" class="formbutton"/>&nbsp;&nbsp;
<!-- 			04-14-2020 start AK -->
<input type="button" id="Back" value="Back" class="formbutton" onClick="Backfunction()"/>&nbsp;&nbsp;
<!-- 			04-14-2020 start AK -->
<!-- 			04-14-2020 start AK -->
 <s:submit value="Resend Otp" id="Resend" name="Resend" class="formbutton" action="Resendotp"/>
 <!-- 			04-14-2020 start AK -->
<input type="button" id="cancelbutton" value="Cancel" class="formbutton"  onClick="location.href='/'"/>
</td>
</tr>
<s:token/>
</s:form>
</table>

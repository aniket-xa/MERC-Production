<%@ page import="com.nic.cerc.pojo.registration.CercUser" %>
<%@ taglib uri="/struts-tags"  prefix="s" %>
<%@ page session="true" %>
<script type="text/javascript">
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
<s:form theme="simple" name="otpVerification" action="updateMobileSave" id="otpVerification" method="post" enctype="multipart/form-data">
<tr><td width="30%"><h3>Please enter the otp sent on</h3></td><td><s:property value = "#session.mobile"/>
</td></tr>
	  		<tr>
				<td colspan="7">
					<s:textfield label="Code" name="otp" id="otp" size="24" maxlength="10" value=""/>				
	  			</td>
	  		</tr>
<tr><td colspan="7"></td></tr>
<tr><td colspan="7" align="right">
<input type="submit" id="savebutton"  name="savebutton" value="Save" class="formbutton"/>&nbsp;&nbsp;
<s:submit id="Back" value="Back" class="formbutton" action = "editUserProfile"/>&nbsp;&nbsp;
 <s:submit value="Resend Otp" id="Resend" name="Resend" class="formbutton" action="updateMobileNoResendOtp"/>
<s:submit id="cancelbutton" value="Cancel" class="formbutton"  action = "welcome"/>
</td>
</tr>
<s:token/>
</s:form>
</table>

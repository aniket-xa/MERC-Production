<script type="text/javascript">
$(document).ready(function() {
// 	<!-- 	04-14-2020 start AK -->
	if(sessionStorage.length>=0){
// 		alert("Submittedalert"+sessionStorage.length);
		sessionStorage.clear();
	}
// 	<!-- 			04-14-2020 end AK -->
	$("#reportWindow").click(function(event) {
	    	   event.preventDefault();
	           event.stopPropagation();
	           winddd = window.open(this.href,"report",'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no');
	       });
	});
</script>	       
<%@ taglib uri="/struts-tags" prefix="s" %>
<h3>Registration Status</h3>
<h1>Congratulations...</h1>
<h3>Your Credentials have been successfully submitted to MERC e-Filing portal and registration process is in progress</h3>
<table width="100%" border="0">
<tr><td width="30%">User Id:</td><td><s:property value="#session.cercUser.getUserId()"/></td></tr>
<tr><td>User Password:</td><td><s:property value="#session.uPass"/></td></tr>
<tr><td colspan="2">Given password is temporary and need to be changed on first login.</td></tr>
<s:if test="#session.cercUser.userType=='O'">
	<tr><td colspan="2">Your Registration code for further user registration under your organization is:</td></tr>
	<tr><td>Registration Code:</td><td><s:property value="#session.cercUser.getRefOrganisationId().getUserRegistrationCode()"/></td></tr>
</s:if>
<tr><td colspan="2"><s:url value="" var="homeURL"/><s:a href="/">Click to login</s:a></td></tr>
<tr>
<td colspan="2">Given Credentials has also been sent to your registered cell phone and email address.</td>
</tr>

<tr>
<td colspan="2"></td>
</tr>
<tr>
<td colspan="2">
<s:if test="#session.userType=='A'">
	<s:a id="reportWindow" href="/run?__report=registrationFormAdvocate.rptdesign&userName=%{cercUser.id}&__format=pdf">
		<input type="button" id="printbutton" name="printbutton" value="Print Registration Form" class="formbutton"/>
	</s:a>
</s:if>
<s:if test="#session.userType=='E'">
	<s:a id="reportWindow" href="/run?__report=registrationFormEmployee.rptdesign&userName=%{cercUser.id}&__format=pdf">
		<input type="button" id="printbutton" name="printbutton" value="Print Registration Form" class="formbutton"/>
	</s:a>
</s:if>
<s:if test="#session.userType=='I'">
	<s:a id="reportWindow" href="/run?__report=registrationFormIndividual.rptdesign&userName=%{cercUser.id}&__format=pdf">
		<input type="button" id="printbutton" name="printbutton" value="Print Registration Form" class="formbutton"/>
	</s:a>
</s:if>
<s:if test="#session.userType=='O'">
	<s:a id="reportWindow" href="/run?__report=registrationFormOrganisation.rptdesign&userName=%{cercUser.id}&__format=pdf">
		<input type="button" id="printbutton" name="printbutton" value="Print Registration Form" class="formbutton"/>
	</s:a>
</s:if>
</td>
</tr>


</table>

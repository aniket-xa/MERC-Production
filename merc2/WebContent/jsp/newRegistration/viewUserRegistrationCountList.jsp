<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<s:form theme="simple" name="newUserRegistration">
	<table border = "0">
	<tr><th class="mainheading" colspan="9">Users For Verification</th></tr>
	<s:if test="userRegistrationCountList.size>0">
	<tr class="subheading">
	<td>Sr. No.</td>
	<td>User Type</td>
	<td>Name</td>
	<td>E-Mail</td>
	<td>Mobile</td>
	<td>Status</td>
	<td>Registered On</td>
	<td>Updated On</td>
	</tr>
	<s:iterator value="userRegistrationCountList" status="rowstatus">
	<s:set name="niceDate"><s:date name="userRegisteredOn" nice="true" format="dd/MM/yyyy"/></s:set>
	<s:if test="refStatusId.statusCode=='I'">
	<%-- ?struts.token.name=token&token=<s:property value="token"/>&id=<s:property value="id"/> --%>
	<s:url var="url" action="inProcess">
		<s:param name="struts.token.name">token</s:param>
		<s:param name="token" value="token"/>
		<s:param name="cercUserId" value="id"/>
	</s:url>
	</s:if>
	<s:else>
	<s:url var="url" action="forClarification">
		<s:param name="struts.token.name">token</s:param>
		<s:param name="token" value="token"/>
		<s:param name="cercUserId" value="id"/>
	</s:url>
	</s:else>
	
	
	<tr class='<s:if test="%{#niceDate.substring(0,#niceDate.indexOf(' ')) > 30}">blink_td</s:if><s:elseif test="#rowstatus.even">colored_td</s:elseif><s:else>white_td</s:else>'>
	<td><s:a href="%{url}"><s:property value="#rowstatus.count"/></s:a></td>
	<td><s:property value="userType"/></td>
	<td><s:if test="userType=='O'"><s:property value="firstName"/> (<s:property value="lastName"/>)</s:if><s:else><s:property value="firstName"/>, <s:property value="lastName"/></s:else></td>
	<td><s:property value="email"/></td>
	<td><s:property value="mobile"/></td>
	<td><s:property value="refStatusId.statusName"/>
		<s:if test="refStatusId.statusType=='R' and refStatusId.statusCode=='C'">
			<s:url var="rejectClarification" action="forClarificationRejection">
				<s:param name="struts.token.name">token</s:param>
				<s:param name="token" value="token"/>
				<s:param name="cercUserId" value="id"/>
			</s:url><br/>
			<s:a href="%{rejectClarification}" title="Click to Reject">
			Reject
			</s:a>
		</s:if>
		<%-- <s:else>
			<s:property value="refStatusId.statusName"/>
		</s:else> --%>
	</td>
	<td><s:date name="userRegisteredOn" format="dd/MM/yyyy"/><br/><s:date name="userRegisteredOn" format="hh:mm a"/></td>
	<td><s:date name="updatedOn" format="dd/MM/yyyy"/><br/><s:date name="updatedOn" format="hh:mm a"/></td>
	</tr>
	
	</s:iterator>
	</s:if>
	<s:else>
	<tr align="center">
				<td colspan="6"><span class="required">No Record Found.</span></td>
			</tr>
	</s:else>
	</table>
</s:form>	
            	
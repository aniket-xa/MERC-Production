<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
</script>

	<s:form theme="simple" name="alertList">
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Alerts List</th>
		</tr>
		<tr>
			<td colspan="7">
				<table border = "0" >
					<tr class="subheading">
						<td width="6%">S. No.</td>
						<td width="20%">From</td>
						<td width="*">Subject</td>
						<td width="14%">Date</td>
						<!-- <td width="20%">Mark as Read</td> -->
						
					</tr>
					<s:if test="alertCountList.size()>0">
					<s:iterator value="alertCountList" status="rowstatus">
					<tr class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
						<s:url var="alertDetailsView" action="alertDetailsView">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="cercEmailCommunicationId" value="cercEmailCommunicationId.id"/>
						</s:url>
						<td><s:a href="%{alertDetailsView}"><s:property value="#rowstatus.count"/></s:a></td>
						<td><s:property value="cercEmailCommunicationId.emailAddress"/></td>
						<td><s:property value="cercEmailCommunicationId.subject"/></td>
						<td><s:date name="cercEmailCommunicationId.updatedOn" format="dd/MM/yyyy hh:mm a"/></td>
						<%-- <td><s:property value="orderType"/></td>
						<s:url var="filingCourtDetailsDelete" action="filingCourtDetailsDelete">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="filingBeanId" value="filingBeanId"/>
							<s:param name="courtDetailsId" value="id"/>
						</s:url>
						<td><s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'"><s:a href="%{filingCourtDetailsDelete}" onClick="return deleteConfirmation();">Delete</s:a></s:if></td> --%>
					</tr>
					</s:iterator>
					</s:if>
				</table>
			</td>
			</tr>
		<tr>
			<td align="right" colspan="7">
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	

            	
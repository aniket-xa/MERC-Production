<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
</script>

	<s:form theme="simple" name="alertList">
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Alerts Details</th>
		</tr>
		<tr>
			<td colspan="7">
				<table border = "0" >
					<!-- <tr class="subheading">
						<td width="20%">From</td>
						<td width="*">Subject</td>
						<td width="14%">Date</td>
					</tr> -->
					<s:if test="alertCountList.size()>0">
					<s:iterator value="alertCountList" status="rowstatus">
					<tr>
						<td>From: <s:property value="emailAddress"/></td>
					</tr>
					<tr>
						<td>Subject: <s:property value="subject"/></td>
					</tr>
					<tr>
						<td>Sent On: <s:date name="updatedOn" format="dd/MM/yyyy hh:mm a"/></td>
					</tr>
					<tr>
						<td colspan="3"><hr/></td>
					</tr>
					<tr>
						<td colspan="3"><s:property value="emailContent" escapeHtml="false"/></td>
					</tr>
					</s:iterator>
					</s:if>
				</table>
			</td>
			</tr>
		<tr>
			<td align="right" colspan="7">
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="viewAlertCount"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	

            	
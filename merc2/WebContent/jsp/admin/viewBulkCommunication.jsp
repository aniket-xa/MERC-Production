<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="js/inputFieldValidationFilter.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:form theme="simple" name="utrMaster" action="composeMailSave" method="post" enctype="multipart/form-data">
	<table border="0">
		<s:if test="hasActionMessages()">
			<tr align="left">
				<td colspan="3"><font color="red" size="3pt"><s:actionmessage/></font></td>
			</tr>
		</s:if>
		<tr>
			<th colspan="3" class="mainheading">View Bulk Communication</th>
		</tr>
		<s:iterator value="cercBulkCommunicationList" status="rowstatus">
		<tr>
			<td width="15%">To</td>
			<td width="1%">:</td>
			<td width="*"><s:property value="emailAddress"/></td>
		</tr>
		<tr>
			<td width="15%">Subject</td>
			<td width="1%">:</td>
			<td width="*"><s:property value="subject"/></td>
		</tr>
		<tr>
			<td>E-Mail Content<span class="required">*</span></td>
			<td>:</td>
			<td><s:property value="emailContent"/></td>
		</tr>
		<tr>
			<td valign="top">Attachment</td>
			<td valign="top">:</td>
			<td valign="top">
				<s:iterator value="cercBulkCommunicationDocumentsList">
				<s:url action="viewBulkcommunicationAttachment" var="url">
				<s:param name="attachmentName" value="%{fileName}"/>
				</s:url>
				<s:a href="%{url}"><s:property value="fileNameDisplay"/></s:a>
				</s:iterator>
			</td>
		</tr>
		</s:iterator>
		<tr>
			<td align="right" colspan="3">
				<s:submit id="searchbutton" value="Back" cssClass="formbutton" action="cercBulkCommunicationList"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>
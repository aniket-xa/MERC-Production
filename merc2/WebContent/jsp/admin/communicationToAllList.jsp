<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<script type="text/javascript">
	function feeReceiptReportWindow() {
		alert(this.href);
		/* winddd = window.open(url,"report",'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no');
		winddd.focus(); */
	}

function deleteConfirmation() 
{
    var x=confirm('Are you sure you want to delete ?');
    if (x) 
    {
    	return true;
    } 
    else 
    {
        return false;
    }
    
}
</script>
<s:form theme="simple" name="newUserRegistration">
	<table border="0">
		<tr>
			<th colspan="9" class="mainheading">Bulk Communication</th>
		</tr>
		<tr>
			<td colspan="9">
				<s:a action="composeMail">
				<s:param name="struts.token.name" value="%{'token'}"/>
   				<s:param name="token" value="token"/>
   				Compose Mail</s:a>
			</td>
		</tr>
		<s:if test="cercBulkCommunicationList.size>0">
			<tr>
				<td colspan="9">Sent Mail List:</td>
			</tr>
			<tr>
				<td colspan="9">
					<display:table export="false" id="bulkCommunication" name="cercBulkCommunicationList" pagesize="20" requestURI="">
						<s:url var="url" action="viewBulkCommunication">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token" />
							<s:param name="communicationId" value="%{#attr.bulkCommunication.id}" />
						</s:url>
						<display:column property="updatedOn" format="{0,date,dd/MM/yyyy}" title="Sent Date" sortable="true"/>
						<display:column title="Subject" sortable="true">
							<s:a href="%{url}">
								<s:property value="%{#attr.bulkCommunication.subject}"/>
							</s:a>
						</display:column>
						<display:column property="updatedBy.userName" title="Sent By" sortable="true"/>
					</display:table>
				</td>
			</tr>
		</s:if>
		<s:else>
			<tr align="center">
				<td colspan="9"><span class="required">No Record Found.</span></td>
			</tr>
		</s:else>
	</table>
	<br/>
	<s:token/>
</s:form>

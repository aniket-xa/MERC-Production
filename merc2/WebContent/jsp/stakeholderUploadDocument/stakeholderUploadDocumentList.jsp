<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>

<script type="text/javascript">
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
	<s:form theme="simple" name="stakeholderUploadDocumentList">
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Document List</th>
		</tr>
		<tr>
			<td colspan="7">
				<table border = "0" >
					<tr class="subheading">
						<td width="4%">S. No.</td>
						<td width="16%">Reference. No.</td>
						<td width="16%">Name</td>
						<td width="16%">Regulation</td>
						<!-- <td width="16%">Document Type</td> -->
						<td width="16%">Description</td>
						<!-- <td width="13%">Document Description</td> -->
						<td width="16%">FileName</td>
						<td width="16%">Uploaded On</td>
					</tr>
					<s:if test="stakeholderCommunicationDocumentsList.size()>0">
					<s:iterator value="stakeholderCommunicationDocumentsList" status="rowstatus">
					<tr class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'> 
					
					<s:url var="url" action="openUploadedDocument">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token" />
							<s:param name="fileName">
							<s:property value="fileName" />
							</s:param>
				   </s:url>
				   
				   <s:url var="url1" action="openStakeholderUploadDocumentSummaryReport">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token" />
							<s:param name="documentReferenceNumber">
							<s:property value="documentReferenceNumber" />
							</s:param>
				   </s:url>
					
						
						<td><s:a href = "%{url1}"><s:property value="#rowstatus.count"/></s:a></td>
						<td><s:a href = "%{url1}"><s:property value="documentReferenceNumber"/></s:a></td>
						<td><s:property value="cercUserId.userName"/></td>
						<td><s:property value="refRegulationId.regulationDescription"/></td>
						<%-- <td><s:property value="refDocumentId.documentName"/></td> --%>
						<td><s:property value="description"/></td>
						<%-- <td><s:property value="documentDescription"/></td> --%>
						<td><s:a href = "%{url}"><s:property value="fileNameDisplay"/></s:a></td>
						<td><s:date name="updatedOn" format="dd/MM/yyyy"/><!-- <br/> -->  at   <s:date name="updatedOn" format="hh:mm a"/></td>
				  </tr>
					</s:iterator>
					</s:if>	
					</table>
					Important Note:<span class="tooltip">Please Click on Serial Number and Reference. No. to print Acknowledgement Slip And FileName to Download the file </span>	
			</td>
		</tr>
		<%-- <tr>
			<td align="right" colspan="7">
			    <s:hidden name="reportName" value="petitionSummary.rptdesign"/>
				<s:submit id="printbutton" name="printbutton" value="Print" class="formbutton" action="openStakeholderUploadDocumentSummaryReport"/>
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/>
			</td>
		</tr> --%>
	</table>
	<s:token/>
</s:form>	

            	
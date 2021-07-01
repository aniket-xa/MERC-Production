<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

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
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:form theme="simple" name="documentAuthorisation">
	<table border="0">
		<tr>
			<th colspan="5" class="mainheading">Petitioner Document Authorisation List</th>
		</tr>
		<tr>
			<td colspan="5">
				<s:a action="documentAuthorisation">
				<s:param name="struts.token.name" value="%{'token'}"/>
   				<s:param name="token" value="token"/>
   				Block Document</s:a>
			</td>
		</tr>
		<s:if test="cercPetitionAuthorisationList.size>0">
			<tr>
				<td colspan="5">
					<display:table export="false" id="cercPetitionAuthorisation" name="cercPetitionAuthorisationList" pagesize="20" requestURI="">
						<display:column title="User Name" sortable="true">
							<s:property value="%{#attr.cercPetitionAuthorisation.cercUserId.firstName}"/>
							<s:property value="%{#attr.cercPetitionAuthorisation.cercUserId.middleName}"/>
							<s:property value="%{#attr.cercPetitionAuthorisation.cercUserId.lastName}"/>
						</display:column>
						<display:column title="Petition" sortable="true">
							<s:property value="%{#attr.cercPetitionAuthorisation.cercPetitionId.diaryNumberDisplay}"/> 
						</display:column>
						
						<display:column title="Block For" sortable="true">
							<s:property value="%{#attr.cercPetitionAuthorisation.restrictedTableName}"/>
							<s:if test="%{#attr.cercPetitionAuthorisation.restrictedTableId!=null}">
								of <s:property value="%{#attr.cercPetitionAuthorisation.restrictDocumentType}"/>
							</s:if>
							<%-- <s:else>
								<s:property value="%{#attr.cercPetitionAuthorisation.restrictDocumentType}"/>
							</s:else> --%>
						</display:column>
						<s:url var="documentAuthorisationDelete" action="documentAuthorisationDelete">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="documentAuthorisationId" value="%{#attr.cercPetitionAuthorisation.id}"/>
						</s:url>
						<display:column title="Delete">
							<s:a href="%{documentAuthorisationDelete}" onClick="return deleteConfirmation();">Delete</s:a>
						</display:column>
						
						<%-- <display:column title="Block For" sortable="true">
							<s:if test="%{#attr.cercPetitionAuthorisation.restrictedTableName=='cerc_petition_reply'}">
								<s:if test='%{#arrr.cercPetitionAuthorisation.restrictDocumentType=="R"}'>Reply</s:if>
								<s:elseif test='%{#arrr.cercPetitionAuthorisation.restrictDocumentType=="C"}'>Comment</s:elseif>
							</s:if>
							<s:elseif test="%{#attr.cercPetitionAuthorisation.restrictedTableName=='cerc_petition_rejoinder'}">
								<s:if test='%{#attr.cercPetitionAuthorisation.restrictDocumentType=="S"}'>Response</s:if>
								<s:elseif test='%{#attr.cercPetitionAuthorisation.restrictDocumentType=="J"}'>Rejoinder</s:elseif>
							</s:elseif>
							<s:elseif test="%{#attr.cercPetitionAuthorisation.restrictedTableName=='cerc_petition_additional_information'}">Additional Information</s:elseif>
							<s:elseif test="%{#attr.cercPetitionAuthorisation.restrictedTableName=='cerc_petition_submission'}">Submission</s:elseif>
							of <s:property value="%{#attr.cercPetitionAuthorisation.restrictedTableId}"/>
						</display:column> --%>
						
						<%-- <display:column property="restrictedTableId" title="User" sortable="true"/> --%>
						
						<%-- <s:url var="respondentMappingDelete" action="respondentMappingDelete">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="refRespondentMappingId" value="%{#attr.refPetitionerRespondentMapping.id}"/>
						</s:url>
						<display:column title="Delete" sortable="false">
							<s:a href="%{respondentMappingDelete}" onClick="return deleteConfirmation();">Delete</s:a>
						</display:column>	 --%>
						<%-- <display:column media="csv excel" title="URL"/>
    					<display:setProperty name="export.pdf" value="true" />
    					<display:setProperty name="export.excel.name" value="org.displaytag.export.ExcelView"/> --%>
    					
    					
    					<%-- <display:setProperty name="decorator.media.html" value="org.displaytag.sample.decorators.HtmlTotalWrapper"/>
      					<display:setProperty name="decorator.media.pdf" value="org.displaytag.sample.decorators.ItextTotalWrapper"/>
      					<display:setProperty name="export.pdf.filename" value="example.pdf"/>
      					<display:setProperty name="decorator.media.rtf" value="org.displaytag.sample.decorators.ItextTotalWrapper"/>
      					<display:setProperty name="export.rtf.filename" value="example.rtf"/>
      					<display:setProperty name="decorator.media.excel" value="org.displaytag.sample.decorators.HssfTotalWrapper"/>
      					<display:setProperty name="export.excel.filename" value="example.xls"/>
      					<display:setProperty name="export.csv" value="false"/>
      					<display:setProperty name="export.xml" value="false"/> --%>
    					<%-- <display:setProperty name="export.excel.class" value="org.displaytag.export.ExcelExportView"/>
    					<display:setProperty name="export.excel.filename" value="example.xls"/>
    					<display:setProperty name="export.excel.include_header" value="true"/> --%>
    					
    					
    					
    					
					</display:table>
				</td>
			</tr>
		</s:if>
		<s:else>
			<tr align="center">
				<td colspan="5"><span class="required">No Record Found.</span></td>
			</tr>
		</s:else>
	</table>
</s:form>

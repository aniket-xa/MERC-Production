<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<script src="js/inputFieldValidationFilter.js"></script>
<script type="text/javascript">
function searchDraftCase(){
		if($('#referenceNumberSearch').val()=="")
		{
			alert("Please enter Reference number.");
			$('#referenceNumberSearch').focus();
			return false;
		}
		else if(filterNumeric.test($('#referenceNumberSearch').val())==false)
		{					
			alert("Invalid reference number.");
			$('#referenceNumberSearch').focus();
			return false;
		}
		else if($('#referenceYearSearch').val()=="")
		{
			alert("Please select Reference Year.");
			$('#referenceYearSearch').focus()
			return false;
		}
		else
		{
			//return true;
			document.draftPetitionsCountList.action="searchDraftCase?struts.token.name=token&token=<s:property value="token"/>";
			document.draftPetitionsCountList.submit();
		}
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
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:form theme="simple" name="draftPetitionsCountList">
			<table border="0">
			<tr>
				<th colspan="7" class="mainheading">Draft Petitions Serach</th>
			</tr>
			<tr>
			<td colspan="7">
				Reference&nbsp;Number&nbsp;<span class="required">*</span>:&nbsp;
				<s:textfield type="text" size="10" name="referenceNumberSearch" id="referenceNumberSearch"/>
				&nbsp;&nbsp;Reference&nbsp;Year&nbsp;<span class="required">*</span>:&nbsp;
				<s:select  name="referenceYearSearch" id="referenceYearSearch" list="yearList" headerValue="- Select -" headerKey=""/>
				&nbsp;&nbsp;
				<input type="submit" name="searchbutton" id="searchbutton" value="Search" class="formbutton" onclick="return searchDraftCase();" />
			</td>		
			</tr>
			<s:if test="hasActionMessages()">
			<tr align="left">
				<td colspan="7"><span class="required"><s:actionmessage/></span></td>
			</tr>
			</s:if>
		<s:if test="draftPetitionsCountList.size>0">
			<tr>
				<th colspan="6" class="mainheading">Draft Petitions Search</th>
			</tr>
			<tr>
				
				<td colspan="6">
					<display:table export="false" id="draftPetitions" name="draftPetitionsCountList" pagesize="20" requestURI="">
						<display:column property="refPetitionTypeId.petitionTypeCode" title="Type" sortable="true" style="width:4%"/>
						<s:url var="url" action="filingGeneralInformation">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token" />
							<s:param name="filingBeanId" value="%{#attr.draftPetitions.id}" />
						</s:url>
						<display:column title="Reference Number" sortable="true" style="width:8%">
							<s:a href="%{url}">
								<s:property value="%{#attr.draftPetitions.referenceNumber}"/>/<s:property value="%{#attr.draftPetitions.referenceYear}"/>
							</s:a>
						</display:column> 
						<display:column title="Subject" sortable="true" style="text-align: justify;text-justify: inter-word;width:50%">
						<%-- <s:property value="%{#attr.draftPetitions.refSubjectId.subject}"/><br/> --%>
						<s:property value="%{#attr.draftPetitions.subject}"/>
						</display:column>
						<display:column title="Petitioner Name" sortable="true" style="width:25%">
							<s:property value="%{#attr.draftPetitions.cercUserPetitionerId.userName}"/>
							<%-- <s:property value="%{#attr.draftPetitions.cercUserPetitionerId.firstName}"/>
							<s:property value="%{#attr.draftPetitions.cercUserPetitionerId.middleName}"/>
							<s:property value="%{#attr.draftPetitions.cercUserPetitionerId.lastName}"/> --%>
						</display:column>
						<display:column property="referenceNumberGeneratedOn" format="{0,date,dd/MM/yyyy}" title="Generated On" sortable="true" style="width:8%"/>
						<s:url var="filingDraftPetitionDelete" action="filingDraftPetitionDelete" id="filingDraftPetitionDelete">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="filingBeanId" value="%{#attr.draftPetitions.id}"/>														
						</s:url>
						<display:column title="" style="width:5%"><s:a href="%{filingDraftPetitionDelete}" onClick="return deleteConfirmation();">Delete</s:a></display:column>				
					</display:table>
				</td>
			</tr>	
			
			<%-- <tr class="subheading">
				<td width="5%">S.No.</td>
				<td width="5%">Type</td>
				<td width="20%">Reference Number/Year</td>
				<td width="38%">Petitioner Name</td>
				<td width="15%">Ref. Generated On</td>
				<td width="10%">Status</td>
				<td width="7%">Delete</td>
			</tr>
			<s:iterator value="draftPetitionsCountList" status="rowstatus">
				<s:url var="url" action="filingGeneralInformation">
					<s:param name="struts.token.name">token</s:param>
					<s:param name="token" value="token" />
					<s:param name="filingBeanId" value="id" />
				</s:url>
				<tr class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
					<td><s:property value="#rowstatus.count" /></td>
					<td><s:property value="refPetitionTypeId.petitionTypeCode"/></td>
					<td><s:a href="%{url}">
							<s:property value="referenceNumberDisplay" />
						</s:a>
					</td>
					
					<td><s:property value="cercUserPetitionerId.firstName"/> <s:property value="cercUserPetitionerId.middleName"/> <s:property value="cercUserPetitionerId.lastName"/></td>
					<td><s:date name="referenceNumberGeneratedOn" format="dd/MM/yyyy"/></td>					
					<td><s:property value="refStatusId.statusName" /></td>
					<s:url var="filingDraftPetitionDelete" action="filingDraftPetitionDelete">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="filingBeanId" value="id"/>														
						</s:url>
					<td><s:a href="%{filingDraftPetitionDelete}" onClick="return deleteConfirmation();">Delete</s:a></td>
				</tr>

			</s:iterator> --%>
		</s:if>
		<s:else>
			<tr align="center">
				<td colspan="6"><span class="required">No Record Found.</span></td>
			</tr>
		</s:else>
	</table>
</s:form>

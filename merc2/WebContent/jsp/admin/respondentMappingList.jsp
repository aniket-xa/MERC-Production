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
<s:form theme="simple" name="newUserRegistration">
	<table border="0">
		<tr>
			<th colspan="5" class="mainheading">Petitioner Respondent Mapping</th>
		</tr>
		<tr>
			<td colspan="5">
				<s:a action="respondentMapping">
				<s:param name="struts.token.name" value="%{'token'}"/>
   				<s:param name="token" value="token"/>
   				Map Respondent</s:a>
			</td>
		</tr>
		<s:if test="refPetitionerRespondentMappingList.size>0">
			<tr>
				<td colspan="5">
					<display:table export="false" id="refPetitionerRespondentMapping" name="refPetitionerRespondentMappingList" pagesize="20" requestURI="">
						<display:column title="Respondent Name" sortable="true">
							<s:property value="%{#attr.refPetitionerRespondentMapping.cercUserRespondentId.firstName}"/>
							<s:property value="%{#attr.refPetitionerRespondentMapping.cercUserRespondentId.middleName}"/>
							<s:property value="%{#attr.refPetitionerRespondentMapping.cercUserRespondentId.lastName}"/>
						</display:column>
						<display:column property="representedBy" title="Represented By" sortable="true"/>
						<display:column title="Address" sortable="true">
							<s:property value="%{#attr.refPetitionerRespondentMapping.cercUserRespondentId.address}"/>,<br/> 
							<s:property value="%{#attr.refPetitionerRespondentMapping.cercUserRespondentId.refCityId.cityName}"/>,<br/> 
							<s:property value="%{#attr.refPetitionerRespondentMapping.cercUserRespondentId.refStateId.stateName}"/> - 
							<s:property value="%{#attr.refPetitionerRespondentMapping.cercUserRespondentId.pinCode}"/>
						</display:column>
						<display:column property="cercUserRespondentId.email" title="Email" sortable="true"/>
						<display:column property="cercUserRespondentId.mobile" title="Mobile" sortable="true"/>
						
						<s:url var="respondentMappingDelete" action="respondentMappingDelete">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="refRespondentMappingId" value="%{#attr.refPetitionerRespondentMapping.id}"/>
						</s:url>
						<display:column title="Delete" sortable="false">
							<s:a href="%{respondentMappingDelete}" onClick="return deleteConfirmation();">Delete</s:a>
						</display:column>	
						<s:token/>								
					</display:table>
				</td>
			</tr>
			<%-- <tr class="subheading">
				<td width="8%">S. No.</td>
				<td width="30%">Respondent</td>
				<td width="32%">Address</td>
				<td width="10%">Mobile</td>
				<td width="15%">E-Mail</td>
				<td width="5%">Delete</td>
			</tr>
			<s:iterator value="refPetitionerRespondentMappingList" status="rowstatus">
				<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
					<td><s:property value="#rowstatus.count" /></td>
					<td><s:property value="cercUserRespondentId.firstName"/> <s:property value="cercUserRespondentId.middleName"/> <s:property value="cercUserRespondentId.lastName"/></td>
					<td><s:property value="cercUserRespondentId.address"/>, <s:property value="cercUserRespondentId.refCityId.cityName"/>, <s:property value="cercUserRespondentId.refStateId.stateName"/> - <s:property value="cercUserRespondentId.pinCode"/></td>
					<td><s:property value="cercUserRespondentId.mobile"/></td>
					<td><s:property value="cercUserRespondentId.email"/></td>
					<s:url var="respondentMappingDelete" action="respondentMappingDelete">
						<s:param name="struts.token.name">token</s:param>
						<s:param name="token" value="token"/>
						<s:param name="refRespondentMappingId" value="id"/>
					</s:url>
					<td><s:a href="%{respondentMappingDelete}" onClick="return deleteConfirmation();">Delete</s:a></td>
				</tr>

			</s:iterator> --%>
		</s:if>
		<s:else>
			<tr align="center">
				<td colspan="5"><span class="required">No Record Found.</span></td>
			</tr>
		</s:else>
	</table>
</s:form>

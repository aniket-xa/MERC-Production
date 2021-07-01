<%@ taglib uri="/struts-tags" prefix="s"%>
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
<s:form theme="simple" name="newUserRegistration">
	<table border="0">
		<tr>
			<th colspan="10 class="mainheading"">Generation Station / Project Name</th>
		</tr>
		<tr>
			<td colspan="10">
				<s:url action="addNewGenerationTransmission" var="addNewGenerationTransmission">
					<s:param name="struts.token.name">token</s:param>
					<s:param name="token" value="token"/>
			</s:url>
			<s:a href="%{addNewGenerationTransmission}">Add Project/Station</s:a>
			</td>
		</tr>
		<s:if test="hasActionMessages()">
		<tr align="left">
			<td colspan="5"><font color="red" size="3pt"><s:actionmessage/></font></td>
		</tr>
		</s:if>
		<s:if test="refGenerationTransmissionList.size>0">
			<tr class="subheading">
				<td width="6%">Sr. No.</td>
				<td width="15%">Region</td>
				<td width="15%">Type</td>
				<td width="15%">Party Name</td>
				<td width="55%">Name</td>
				<td width="9%">Delete</td>
			</tr>
			<s:iterator value="refGenerationTransmissionList" status="rowstatus">
				<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
					<td align="middle"><s:property value="#rowstatus.count" /></td>
					<td>
					<s:if test="#rowstatus.index==0 or refGenerationTransmissionList[#rowstatus.index].refRegionId.region!=refGenerationTransmissionList[#rowstatus.index-1].refRegionId.region">
					<s:property value="refRegionId.region"/>
					</s:if>
					</td>
					<td>
					<s:if test="#rowstatus.index==0 or refGenerationTransmissionList[#rowstatus.index].refPetitionTypeId.petitionType!=refGenerationTransmissionList[#rowstatus.index-1].refPetitionTypeId.petitionType">
					<s:property value="refPetitionTypeId.petitionTypeCode"/>
					</s:if>
					</td>
					<td>
					<s:property value="cercUserOwnerId.firstName"/> - <s:property value="cercUserOwnerId.lastName"/>
					</td>
					
					<td>
					<s:property value="generationTransmissionName"/>
					</td>
					<td>
						<s:url var="projectStationMasterDelete" action="projectStationMasterDelete">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="projectStationMasterId" value="id"/>
						</s:url>
						<s:a href="%{projectStationMasterDelete}" onClick="return deleteConfirmation();">Delete</s:a>
					</td>
				</tr>

			</s:iterator>
		</s:if>
		<s:else>
			<tr align="center">
				<td colspan="6"><span class="required">No Record Found.</span></td>
			</tr>
		</s:else>
	</table>
	<br/>
	<s:token/>
</s:form>

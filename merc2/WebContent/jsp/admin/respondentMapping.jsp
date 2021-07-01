<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
function chkValidation(lisize){
	
	for (var i = 0; i < lisize; i++) 
	{
		if(document.getElementById("respondentMappingBeanList["+i+"].isRespondent").checked)
		{
			return true;
			break;
		}	
	}
		alert("Please check at least one respondent");
		return false;
}
</script>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:form theme="simple" name="respondentMapping" action="respondentMappingSave">
<s:hidden name="filingBeanId" value="%{filingBeanId}"/>
	<table border="0">
		<tr>
			<th colspan="7" class="mainheading">Respondent List</th>
		</tr>
		<tr><td colspan="7"></td></tr>
		<s:if test="respondentMappingBeanList.size>0">
			<tr  class="subheading">
				<td width="8%">Sr. No.</td>
				<td width="30%">Respondent</td>
				<td width="10%">Represented By</td>
				<td width="22%">Address</td>
				<td width="10%">Mobile</td>
				<td width="15%">E-Mail</td>
				<td width="5%">Add</td>
			</tr>
			<s:iterator value="respondentMappingBeanList" status="rowstatus">
				<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
					<s:hidden name="respondentMappingBeanList[%{#rowstatus.index}].respondentId.id"/>
					<td><s:property value="#rowstatus.count" /></td>
					<td><s:property value="respondentId.userName"/></td>
					<td><s:textfield type="text" size="24" name="respondentMappingBeanList[%{#rowstatus.index}].representedBy" id="respondentMappingBeanList[%{#rowstatus.index}].representedBy"/></td>
					<td><s:property value="respondentId.address"/>, <s:property value="respondentId.refCityId.cityName"/>, <s:property value="respondentId.refStateId.stateName"/> - <s:property value="respondentId.pinCode"/></td>
					<td><s:property value="respondentId.mobile"/></td>
					<td><s:property value="respondentId.email"/></td>					
					<td><s:checkbox name="respondentMappingBeanList[%{#rowstatus.index}].isRespondent" id="respondentMappingBeanList[%{#rowstatus.index}].isRespondent"/></td>
				</tr>

			</s:iterator>
		<tr><td colspan="7"></td></tr>
		<tr><td colspan="7" align="right">
	<!-- 			04-01-2020 start AK -->
		<input type="submit" id="savebutton" value="Save" class="formbutton" onclick="return chkValidation(<s:property value="respondentMappingBeanList.size"/>);"/>&nbsp;&nbsp;
		<input type="reset" id="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
		<s:if test="filingBeanId!=null">
			<s:submit id="cancelbutton" value="Cancel" cssClass="formbutton" action="filingPartyDetailsList"/>
		</s:if>
		<s:else>
			<s:submit id="cancelbutton" value="Cancel" cssClass="formbutton" action="respondentMappingList"/>
		</s:else>
		<!-- 			04-01-2020 end AK -->
		</td></tr>
		</s:if>
		<s:else>
			<tr align="center">
				<td colspan="6"><span class="required">No Record Found.</span></td>
			</tr>
		</s:else>
	</table>
	<s:token/>
</s:form>
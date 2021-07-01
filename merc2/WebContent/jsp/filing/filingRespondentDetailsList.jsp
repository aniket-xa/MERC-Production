<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
function chkValidation(lisize){
	var representedBy ="true";
	for (var i = 0; i < lisize; i++) 
	{
		if(document.getElementById("cercRespondentBeanList["+i+"].isRespondent").checked)
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
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
	<s:form theme="simple" name="filingRespondentDetailsList" action="filingMappingRespondentDetailsSave">
	<s:hidden name="filingBeanId"/>
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Respondent List</th>
		</tr>
		<s:if test="registrationNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Petition No. : <s:property value="registrationNumberDisplay"/></td>
			</tr>
			<tr>
				<td colspan="3" align="left">Diary No. : <s:property value="diaryNumberDisplay"/></td>
				<td colspan="1" align="center"></td>
				<td colspan="3" align="right">Reference No. : <s:property value="referenceNumberDisplay"/></td>									
			</tr>
		</s:if>
		<s:elseif test="diaryNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Diary No. : <s:property value="diaryNumberDisplay"/></td>													
			</tr>
			<tr>
				<td colspan="3" align="left"></td>
				<td colspan="1" align="center"></td>
				<td colspan="3" align="right">Reference No. : <s:property value="referenceNumberDisplay"/></td>									
			</tr>
		</s:elseif>
		<s:elseif test="referenceNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Reference No. : <s:property value="referenceNumberDisplay"/></td>									
			</tr>
		</s:elseif>
		<s:hidden name="referenceNumber"/>
		<s:hidden name="referenceYear"/>
		<s:hidden name="referenceNumberDisplay"/>
		<s:hidden name="diaryNumber"/>
		<s:hidden name="diaryYear"/>
		<s:hidden name="diaryNumberDisplay"/>
		<s:hidden name="registrationNumber"/>
		<s:hidden name="registrationYear"/>
		<s:hidden name="registrationNumberDisplay"/>
		
		<tr>
			<td colspan="7"><s:a action="respondentMapping">
								<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="filingBeanId" value="filingBeanId"/>
			Map Respondent</s:a></td>
		</tr>
		<tr>									
			<td colspan="7"><s:a action="filingOtherResponentDetails">
								<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="filingBeanId" value="filingBeanId"/>
			Add Respondent not Registered</s:a></td>
		</tr>
		<s:if test="cercRespondentBeanList.size()>0">
		<tr>
			<td colspan="7">
			<table>
				<tr class="subheading">
					<td width="5%">S. No.</td>
					<td width="81%">Name</td>
					<td width="10%">Represented By</td>
					<td width="4%">Select</td>
				</tr>
				<s:iterator value="cercRespondentBeanList" status="rowstatus">
				<tr class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
					<s:hidden name="cercRespondentBeanList[%{#rowstatus.index}].cercPetitionId.id"/>
					<s:hidden name="cercRespondentBeanList[%{#rowstatus.index}].refRespondentId.id"/>
					<td><s:property value="#rowstatus.count"/></td>
					<td><s:property value="refRespondentId.firstName"/> <s:property value="refRespondentId.lastName"/></td>
					<td><s:textfield type="text" size="24" name="cercRespondentBeanList[%{#rowstatus.index}].representedBy" id="cercRespondentBeanList[%{#rowstatus.index}].representedBy" value="%{representedBy}"/></td>
					<td><s:checkbox name="cercRespondentBeanList[%{#rowstatus.index}].isRespondent" id="cercRespondentBeanList[%{#rowstatus.index}].isRespondent" /></td>
				</tr>
				</s:iterator>
			</table>
			</td>			
		</tr>
		</s:if>		
		<tr><td colspan="7"></td></tr>
		<tr><td colspan="7" align="right">
		<input type="submit" id="savebutton" value="Save" class="formbutton" onclick="return chkValidation(<s:property value="cercRespondentBeanList.size"/>);"/>&nbsp;&nbsp;
		<input type="submit" id="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
		<s:submit type="submit" id="cancelbutton" value="Cancel" class="formbutton" action="filingPartyDetailsList"/></td></tr>
	</table>
	<s:token/>
</s:form>	
            	
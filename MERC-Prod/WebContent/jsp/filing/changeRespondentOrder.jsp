<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">
	
	function filingGeneralInformation(){
		document.filingPartyDetailsList.action="filingGeneralInformation?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.filingPartyDetailsList.submit();
	}
	
	function filingCourtDetailsList(){
		document.filingPartyDetailsList.action="filingCourtDetailsList?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.filingPartyDetailsList.submit();
	}  
	
	function filingSummary(){
		document.filingPartyDetailsList.action="filingSummary?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.filingPartyDetailsList.submit();
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
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="filingPartyDetailsList" action="changeRespondentOrderSave">

	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Change Respondent Order</th>
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
		<s:hidden name="filingBeanId"/>
		
		<tr>
			<td colspan="7">
				<table border = "0">
					<tr class="subheading">
						<td width="5%">S. No.</td>
						<td width="26%">Name</td>
						<td width="10%">Represented By</td>
						<td width="25%">Address</td>
						<!--
						<td width="8%">Type</td>
						-->
						<td width="12%">Mobile</td>
						<td width="18%">e-Mail</td>
						<td width="4%"><s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'  or #session.CERC_USER.refOrganisationId.id==1">Change Order</s:if></td>
					</tr>
					<s:if test="cercRespondentList.size()>0">
					<s:iterator value="cercRespondentList" status="rowstatus">
					<s:hidden name="cercRespondentList[%{#rowstatus.index}].id"/>
					<s:if test='cercUserId!=null and partyType!="P" and partyType!="OP"'>
					<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
						<td><s:property value="#rowstatus.count"/></td>
						<td><s:property value="cercUserId.userName"/></td>
						<td><s:property value="representedBy"/></td>
						<td>
						<s:property value="cercUserId.address"/>,<br/>
						<s:property value="cercUserId.refCityId.cityName"/>,<br/>
						<s:property value="cercUserId.refStateId.stateName"/> - <s:property value="cercUserId.pinCode"/></td>
						<td><s:property value="cercUserId.mobile"/></td>
						<td><s:property value="cercUserId.email"/></td>
						<td><s:select name="cercRespondentList[%{#rowstatus.index}].respondentSequence" list="respondentSequenceList" value="respondentSequence"/></td>
					</tr>
					</s:if>
					<s:else>
					<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
						<td><s:property value="#rowstatus.count"/></td>
						<td><s:property value="partyName"/></td>
						<td><s:property value="representedBy"/></td>
						<td>
						<s:property value="address"/>,<br/>
						<s:property value="refCityId.cityName"/>,<br/>
						<s:property value="refStateId.stateName"/> - <s:property value="pinCode"/></td>
						<td><s:property value="mobile"/></td>
						<td><s:property value="email"/></td>
						<td>
<%-- 							<s:if test="partyType!='OR'"> --%>
								<s:select name="cercRespondentList[%{#rowstatus.index}].respondentSequence" list="respondentSequenceList" value="respondentSequence"/>
<%-- 							</s:if> --%>
						</td>
					</tr>
					</s:else>
					</s:iterator>
					</s:if>
				</table>
			</td>
		</tr>	
		<tr>
			<td align="right" colspan="7">
			
<%-- 				<s:if test = "filingBean.noRespondents == true">			 --%>
				<s:submit id="submitbutton" name="cancelbutton" value="Submit" class="formbutton"/>&nbsp;
<%-- 				</s:if> --%>
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="filingPartyDetailsList"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
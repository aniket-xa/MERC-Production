<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
	function reportWindow(event) {
		winddd = window.open(event,"report",'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no');
		winddd.focus();
	}
	
</script>

		<s:if test="cercPetition.registrationNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Petition No. : <s:property value="cercPetition.registrationNumberDisplay"/></td>
			</tr>
			<tr>
				<td colspan="3" align="left">Diary No. : <s:property value="cercPetition.diaryNumberDisplay"/></td>
				<td colspan="1" align="center"></td>
				<td colspan="3" align="right">Reference No. : <s:property value="cercPetition.referenceNumberDisplay"/></td>									
			</tr>
		</s:if>
		<s:elseif test="cercPetition.diaryNumber!=null">
			<tr  class="subheading">
				<td colspan="7" align="center">Diary No. : <s:property value="cercPetition.diaryNumberDisplay"/></td>													
			</tr>
			<tr>
				<td colspan="3" align="left"></td>
				<td colspan="1" align="center"></td>
				<td colspan="3" align="right">Reference No. : <s:property value="cercPetition.referenceNumberDisplay"/></td>									
			</tr>
		</s:elseif>
		<s:elseif test="referenceNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Reference No. : <s:property value="cercPetition.referenceNumberDisplay"/></td>									
			</tr>
		</s:elseif>
		
		
		
		
		<tr class="subheading">
			<td colspan="7">Petition Details</td>
		</tr>
		<tr>
			<td width="20%">Diary Number</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercPetition.diaryNumberDisplay"/></td>
			<td width="2%"></td>
			<td width="20%">Petition Number</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercPetition.registrationNumberDisplay"/></td>					
		</tr>
		<tr>
			<td>Petitioner Name</td>
			<td>:</td>
			<td><s:property value="cercPetition.cercUserPetitionerId.userName"/></td>
			<td></td>
			<td>Respondent Name</td>
			<td>:</td>
			<td>
			<s:if test="cercMainRepondentList.size>0">
			<s:property value="cercMainRepondentList[0].cercUserId.userName"/> 
			<s:if test="cercMainRepondentList.size>1"> and <s:property value="cercMainRepondentList.size-1"/> others</s:if>
			</s:if>
			</td>								
		</tr>
		<tr>
			<td>Petition Type</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercPetition.refPetitionTypeId.petitionType"/> (<s:property value="cercPetition.refPetitionTypeId.petitionTypeCode"/>)</td>											
		</tr>
		<tr>
			<td>Last Hearing Date</td>
			<td>:</td>
			<td><s:date name="cercPetitionListingDetails.lastHearingDate" format="dd/MM/yyyy"/></td>
			<td></td>
			<td>Next Hearing Date</td>
			<td>:</td>
			<td><s:date name="cercPetitionListingDetails.hearingDate" format="dd/MM/yyyy"/></td>											
		</tr>
		<s:if test="cercPetitionLicenceDetails!=null">
 			<tr>
				<td width="15%">License Details</td>
				<td width="1%">:</td>
				<td width="*" colspan="5"><s:property value="cercPetitionLicenceDetails.licenceNumber"/>, Valid from <s:date name="cercPetitionLicenceDetails.licenceDate" format="dd/MM/yyyy"/></td>
			</tr>
		</s:if>
		<tr>
			<td valign="top">Subject</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercPetition.subject"/></td>								
		</tr>
		<s:if test="#session.CERC_USER.userType=='I'">
		<tr>
			<td valign="top" colspan="7">&nbsp;</td>
		</tr>
		</s:if>
		<s:else>
		<tr>
			<td valign="top" colspan="7">
			<s:a action="openPetitionSummary">
	   			<s:param name="struts.token.name" value="%{'token'}"/>
				<s:param name="token" value="token"/>
				<s:param name="filingBeanId" value="%{cercPetition.id}"/>
				<s:param name="userId" value="%{#session.CERC_USER.id}"/>
				<s:param name="reportName" value="%{'petitionSummary.rptdesign'}"/>
				View Petition Summary
			</s:a>
			</td>											
		</tr>
		</s:else>
		

<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
	$(document).ready(function() {
		
	});
	
</script>
<s:form theme="simple" name="viewPetitionUnderScrutinyHardCopyRecieved" action="viewPetitionUnderScrutinyHardCopyRecievedDateSave">
	<s:hidden name="filingBeanId1"/>
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Petition Under Scrutiny Hard Copy Details <s:if test="cercPetition.isMigrated == true"><font color="red"><b>(MIGRATED PETITION)</b></font></s:if></th>
		</tr>
		<s:if test="cercPetition.referenceNumber!=null">
		<tr class="subheading">
			<td colspan="7" align="center">Petition Under Scrutiny Summary</td>									
		</tr>
		<s:hidden name=".referenceNumber"/>
		<s:hidden name="referenceYear"/>
		<s:hidden name="referenceNumberDisplay"/>
		<s:hidden name="diaryNumber"/>
		<s:hidden name="diaryYear"/>
		<s:hidden name="diaryNumberDisplay"/>
		<s:hidden name="registrationNumber"/>
		<s:hidden name="registrationYear"/>
		<s:hidden name="registrationNumberDisplay"/>
		
		</s:if>
		<s:if test="hasActionMessages()">
		<tr align="left">
		<td colspan="7"><font color="red" size="3pt"><s:actionmessage/></font></td>
		</tr>
		</s:if>
		
		<tr>
		<td colspan="7">
			<table border="1" cellspacing="0" cellpadding="0">
				<tr valign="top">
					<td width="20%">Reference No.</td>
					<td width="30%"><s:property value="cercPetition.referenceNumberDisplay"/></td>
					<td width="35%">Reference No. Generation Date</td>
					<td width="15%"><s:date name="cercPetition.referenceNumberGeneratedOn" format="dd/MM/yyyy"/></td>
				</tr>
				<tr valign="top">
					<td>Diary No.</td>
					<td><s:property value="cercPetition.diaryNumber"/>/<s:property value="cercPetition.diaryYear"/></td>
					<td>Diary No. Generation Date</td>
					<td><s:date name="cercPetition.filedOn" format="dd/MM/yyyy"/></td>
				</tr>
				<tr valign="top">
					<td>Petition No.</td>
					<td><s:property value="cercPetition.registrationNumberDisplay"/></td>
					<td>Petition No. Generation Date</td>
					<td><s:date name="cercPetition.registeredOn" format="dd/MM/yyyy"/></td>
				</tr>
			</table>
			</td>					
		</tr>
		<tr>
		<td width="15%">Petition Type</td>
		<td width="1%">:</td>
		<td width="*" colspan="5"><s:property value="cercPetition.refPetitionTypeId.petitionType"/> - <s:property value="cercPetition.refPetitionSubtypeId.petitionSubType"/></td>
		</tr>
		<tr>
		<td width="15%">Region</td>
		<td width="1%">:</td>
		<td width="*" colspan="5"><s:property value="cercPetition.refRegionId.region"/> </td>
		</tr>
		<s:if test="cercPetitionLicenceDetails!=null">
 			<tr>
				<td width="15%">License Details</td>
				<td width="1%">:</td>
				<td width="*" colspan="5"><s:property value="cercPetition.cercPetitionLicenceDetails.licenceNumber"/>, Valid from <s:date name="cercPetition.cercPetitionLicenceDetails.licenceDate" format="dd/MM/yyyy"/></td>
			</tr>
		</s:if>
		<tr>
		<td width="15%">Subject</td>
		<td width="1%">:</td>
		<td width="*" colspan="5"><s:property value="cercPetition.subject"/> </td>
		</tr>
		<tr>
		<td width="15%">Petition Status</td>
		<td width="1%">:</td>
		<td width="*" colspan="5"><div class="blink" style="color: red;">
			<s:property value="cercPetition.refStatusId.refStatusPublicDomainId.statusName"/>
			<s:if test="cercPetition.refStatusId.isDivisionConcat==true">
			<s:if test="cercPetitionStatusDivisionList.size()>0">
			<s:iterator value="cercPetitionStatusDivisionList" status="rowstatus">
			<s:if test='refDivisionId.divisionCode==6 or refDivisionId.divisionCode==7'>
			<s:if test='cercPetitionStatusDivisionList.size()>1 and #rowstatus.count<cercPetitionStatusDivisionList.size()'>
			 <s:property value="refDivisionId.divisionName"/> and 
			 </s:if>
			 <s:else>
			 <s:property value="refDivisionId.divisionName"/>
			 </s:else>
			</s:if>
			</s:iterator>
			</s:if>
			</s:if>
			</div>
		</td>
		</tr>
		<tr>
		    <s:if test="#session.CERC_USER.refOrganisationId.id==1">
			<td>Whether Hard Copy Recieved ?<%-- <span class="required">*</span> --%></td></s:if>
			<s:else>
			<td>Whether Hard Copy Recieved By MERC ?<%-- <span class="required">*</span> --%></td></s:else>
			<td>:</td>
			<td colspan="5">
				<%-- <s:radio list="refStatusList" name="cercPetition.refStatusId.id" id="refStatusId" listKey="id" listValue="statusName" theme="simple" value="cercPetition.refStatusId.id" />  --%>
			    <s:property value="cercPetition.checkStatus" /><br>
			    <s:if test="#session.CERC_USER.refDivisionId.divisionCode.trim()==12">
			    <s:radio list="#{'Yes':'Yes','No':'No'}" name="checkStatus" id="checkStatus" theme="simple" value="%{cercPetition.checkStatus}"/></s:if>
			</td> 
		</tr>
		
		<tr valign="top">
			<td>Date of Recieving Hard Copy</td>
			<td>:</td>
			<td><s:date name="cercPetition.dateOfRecieving" format="dd/MM/yyyy"/><br>
			<s:if test="#session.CERC_USER.refDivisionId.divisionCode.trim()==12">
			<s:textfield type="text" size="10" name="dateOfRecieving" id="dateOfRecieving" class="tcal" cssStyle="width:130pt"/></s:if></td>
		</tr>
		<s:if test="cercPetitionList.size()>0">
		<tr valign="top">
		 <th colspan="7" class="mainheading">List Of Related Referred Back Petitions</th>
		</tr>
		
		<tr>
			<td colspan="7">
				<table border = "0">
					<tr class="subheading">
						<td width="4%">S. No.</td>
						<td width="16%">Diary Number</td>
						<td width="*">Status</td>
						
					</tr>
					<s:if test="cercPetitionList.size()>0">
					<s:iterator value="cercPetitionList" status="rowstatus">
					<tr class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'> 
					
					<s:url var="url" action="filingSummary">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token" />
							<s:param name="filingBeanId" value="id" />
						</s:url>
					
						
						<td><s:a href = "%{url}"><s:property value="#rowstatus.count"/></s:a></td>
						<td><s:a href = "%{url}">
							<s:property value="diaryNumberDisplay"/> </s:a>
						</td>
						<td><s:property value="refStatusId.refStatusPublicDomainId.statusName"/></td>
						
					</tr>
					</s:iterator>
					</s:if>
					
				</table>
			</td>
		</tr>
		</s:if>
		<%-- <s:if test="cercPetitionList.size()>0">
		<tr valign="top">
		<s:if test="#session.CERC_USER.refDivisionId.divisionCode.trim()==12">
			<td>Enter Related Referred Back Petition If Any</td></s:if>
			<s:else><td>Related Referred Back Petition</td></s:else>
			<td>:</td>
			<td><s:property value="cercPetition.referredbackPetition"/><br>
			<s:if test="#session.CERC_USER.refDivisionId.divisionCode.trim()==12">
			<s:textfield type="text" size="50" name="referredbackPetition" id="referredbackPetition" cssStyle="width:130pt"/></s:if></td>
		</tr>
		</s:if> --%>
		
		<tr>
			<td colspan="7" align="right"><s:if test="#session.CERC_USER.refDivisionId.divisionCode.trim()==12"><s:submit id="savebutton"
					name="savebutton" value="Save" class="formbutton" /></s:if>&nbsp;&nbsp; 
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel"
					class="formbutton" action="viewFiledPetitionsCount" /></td>
		</tr>
 </table>
	<s:token/>
</s:form>	

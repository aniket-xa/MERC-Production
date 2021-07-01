<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">
$(document).ready(function() {
});
</script>
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="annualFeeDetailsSave">
<s:hidden name="filingBeanId"/>
<s:hidden name="feePeriodFrom"/>
<s:hidden name="feePeriodTo"/>
<s:hidden name="tariffPeriod"/>
<s:hidden name="cercPetition.refPetitionTypeId.petitionTypeCode" id="petitionTypeCode"/>
<s:hidden name="licenceDate"/>
	<table border = "0" valign="top">
		<tr>
			<th colspan="7" class="mainheading">Annual Fee - Details</th>
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
		
		
		
		<%-- <s:if test="hasActionMessages()">
			<tr align="left">
				<td colspan="7"><font color="red" size="3pt"><s:actionmessage/></font></td>
			</tr>
		</s:if> --%>
		<%-- <s:if test="refFeeStructure.calculationType=='C' or cercPetition.refPetitionTypeId.petitionTypeCode=='TL'"> --%>
		<tr class="subheading">
			<td colspan="7">
			For <s:property value="cercPetition.refPetitionTypeId.petitionType"/>
			</td>									
		</tr>
		<tr>
			<td colspan="7">
			Map asset related to petition
			</td>									
		</tr>
		<tr>
			<td width="20%">
				<s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='GT'">
				Generation Station
				</s:if>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TT'">
				Project Name
				</s:elseif>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TL'">
				Project Name
				</s:elseif>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TD'">
				Category
				</s:elseif>
				</td>
			<td width="1%">:</td>
			<td width="38%">
			<s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='TD'">
				<s:select list="refLicensingCategoryList" name="refLicensingCategoryId.id" id="refLicensingCategoryId" listKey="id" listValue="licensingCategoryDescription" headerKey="" headerValue="-- Select --"/>
				<%-- <s:property value="cercPetition.refLicensingCategoryId.licensingCategoryDescription"/> --%>
			</s:if>
			<s:else>
			<s:if test="refGenerationTransmissionList.size()>0">
			<s:select list="refGenerationTransmissionList" name="refGenerationTransmission.id" id="refGenerationTransmissionId" listKey="id" listValue="generationTransmissionName" headerKey="" headerValue="-- Select --"/>
			<%-- <s:property value="refGenerationTransmission.generationTransmissionName"/> --%>
			</s:if>
			<s:else>No project added in project master
			</s:else>
			</s:else>
			</td>
			<td width="2%"></td>
			<td width="10%"></td>
			<td width="1%"></td>
			<td width="18%"></td>
		</tr>
		
		<tr>
			<td>Tariff Period</td>
			<td>:</td>
			<td colspan="5">
				<s:property value="refTariffPeriodBean.periodDisplay"/>
			</td>						
		</tr>
		<tr><td colspan="7"></td></tr>
		<tr>
			<td colspan="7" align="right">
					<s:submit id="savebutton" name="savebutton" value="Get Assets" class="formbutton" action="submitUnmappedAsset" theme="simple"/>&nbsp;&nbsp;
					<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="annualFee" theme="simple"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
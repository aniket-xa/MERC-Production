<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
$(document).ready(function() {
	$("select[name='tariffPeriod']").change(function(){
		$("#feePeriodFrom").get(0).options.length = 0;
		$("#feePeriodFrom").get(0).options[0] = new Option("- Select -", "");
		$("#feePeriodTo").get(0).options.length = 0;
		$("#feePeriodTo").get(0).options[0] = new Option("- Select -", "");
        
		
		var tariffPeriod = $(this).val();
	$.ajax({
		url:'getFromTofDateAjax',
		data: {tariffPeriod:tariffPeriod},
		dataType: "json",
		 success: function (data) {
			 //alert(data);
			 $.each(data, function(id,year){
         		$("#feePeriodFrom").get(0).options[$("#feePeriodFrom").get(0).options.length] = new Option(year,year);
         		$("#feePeriodTo").get(0).options[$("#feePeriodTo").get(0).options.length] = new Option(year,year);
				});
		 },
	});
	});
	
	$("input[name='savebutton']").click(function(){
		if($('#tariffPeriod').val()=="")
			{
				alert("Please select Tariff Period.");
				return false;
			}
			else if($('#feePeriodFrom').val()=="")
			{
				alert("Please enter From Year.");
				return false;
			}
			else if($('#feePeriodTo').val()=="")
			{
				alert("Please enter To Year.");
				return false;
			}
	});
});
</script>
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="annualFee">
<s:hidden name="filingBeanId"/>
<s:hidden name="cercPetition.refPetitionTypeId.petitionTypeCode" id="petitionTypeCode"/>
	<table border = "0" valign="top">
		<tr>
			<th colspan="7" class="mainheading">Filing - Fee Details</th>
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
		
		
<%-- 		<s:if test="hasActionMessages()">
			<tr align="left">
				<td colspan="7"><font color="red" size="2pt"><s:actionmessage/></font></td>
			</tr>
		</s:if>
 --%>		<tr class="subheading">
			<td colspan="7">Annual Fee Calculation</td>									
		</tr>
		<s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='TD' or cercPetition.refPetitionTypeId.petitionTypeCode=='TL'">
		<tr align="left"><s:hidden name="licenceDate" value="%{cercPetitionLicenceDetails.licenceDate}"/>
			<td width="10%">Licence No</td>
			<td width="2%">:</td>
			<td width="20%"><s:property value="cercPetitionLicenceDetails.licenceNumber"/></td>
			<td width="10%">Valid From: </td><td><s:date name="cercPetitionLicenceDetails.licenceDate" format="dd/MM/yyyy"/></td>
			<td width="10%">Valid Till: </td><td><s:date name="cercPetitionLicenceDetails.validTill" format="dd/MM/yyyy"/></td>						
		</tr>
		</s:if>
		<tr>
		<td colspan="7" align="left">
		<table width="20%" border="0">
		<tr align="left"> 
		<td width="15%">Tariff Period<span class=required>*</span></td><td width="2%">:</td><td colspan="4"><s:select name="tariffPeriod" id="tariffPeriod" list="tariffPeriodList" listKey="id" listValue="periodDisplay" headerKey="" headerValue="- Select -"/></td>
		</tr>
		<tr>
		<td>From Year<span class=required>*</span></td><td>:</td><td width="12%"><s:select name="feePeriodFrom" id="feePeriodFrom" list="feePeriodList" headerKey="" headerValue="- Select -"/></td>
		<td width="12%">To Year<span class=required>*</span></td><td width="2%">:</td><td><s:select name="feePeriodTo" id="feePeriodTo" list="feePeriodList" headerKey="" headerValue="- Select -"/></td>
		</tr>
		</table>
		</td>
		</tr>
		<tr>
			<td colspan="3">
			</td>
			<td colspan="4" align="right">
				<!-- <input type="button" id="previousbutton" name="previousbutton" value=" &lt;&lt; Previous" class="formbutton" onClick="filingPrayerDetailsList()"/>&nbsp;&nbsp;
				<input type="button" id="nextbutton" name="nextbutton" value="Next &gt;&gt;" class="formbutton" onClick="filingDocumentDetailsList()"/>&nbsp;&nbsp; -->
				<%-- <s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'"> --%>
				<s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='TT'">
					<s:submit id="savebutton" name="savebutton" value="Get Assets" cssClass="formbutton" action="assetsForAnnualFee"/>&nbsp;&nbsp;
				</s:if>
				<s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='GT'">
					<s:submit id="savebutton" name="savebutton" value="Get Assets" cssClass="formbutton" action="assetsForAnnualFee"/>&nbsp;&nbsp;
				</s:if>
				<s:else>
					<s:submit id="savebutton" name="savebutton" value="Get Fee" cssClass="formbutton" onclick="return chkValidation()" action="annualFeeDetails"/>&nbsp;&nbsp;
					<!-- <input type="submit" id="savebutton" name="savebutton" value="Get Fee" class="formbutton" />&nbsp;&nbsp; -->
				</s:else>
					<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				<%-- </s:if> --%>
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/>
			</td>
		</tr>
		<s:if test="">
		<tr>
		<td colspan="4"><div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div></td>
		</tr>
		</s:if>
	</table>
	<s:if test="cercPetitionAnnualFeeList.size>0">
	<table border="0">
		<tr class="subheading">
			<td width="5%">S.No.</td>
			<td width="15%">Tariff Period</td>
			<td width="10%">From Year</td>
			<td width="10%">To Year</td>
			<td width="15%">Fee Paid</td>
			<td width="30%">Paid By</td>
			<td width="15%">Paid On</td>
		</tr>
		<s:iterator value="cercPetitionAnnualFeeList" status="rowstatus">
		<tr>
			<td><s:property value="%{#rowstatus.count}"/></td>
			<td><s:property value="refTariffPeriodId.periodDisplay"/></td>
			<td><s:property value="feePeriodFrom"/></td>
			<td><s:property value="feePeriodTo"/></td>
			<td><s:property value="feePaid"/></td>
			<td><s:property value="updatedBy.firstName"/></td>
			<td><s:date name="updatedOn" format="dd/MM/yyyy"/></td>
		</tr>
		</s:iterator>
	</table>
	</s:if>
	<s:token/>
</s:form>	
            	
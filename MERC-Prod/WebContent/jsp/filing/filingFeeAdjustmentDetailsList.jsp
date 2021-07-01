<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">

	$(document).ready(function() {
		$(".delete").hide();
		
		var totalAdjustmentAmount = 0;
		var totalRevisedTariff = 0;
		var totalRevisedFee = 0;
		var totalRoundedOffFee = 0;
		var totalFeeAlreadyPaid = 0;
		var listSize = $('#listSize').val();
		for(var i=0 ;i<listSize;i++){
			var tmp = $('#netFeePayable'+i).val();
			var tmp1 = $('#roundedOffFee'+i).val();
			var tmp2 = $('#revisedFee'+i).val();
			var tmp3 = $('#revisedTariff'+i).val();
			var tmp4 = $('#feeAlreadyPaid'+i).val();
			
			if(tmp!=null && tmp!=""){totalAdjustmentAmount += parseInt(tmp);}
			if(tmp1!=null && tmp1!=""){totalRoundedOffFee += parseInt(tmp1);}
			if(tmp2!=null && tmp2!=""){totalRevisedFee = parseFloat(totalRevisedFee) + parseFloat(tmp2);}
			if(tmp3!=null && tmp3!=""){totalRevisedTariff += parseInt(tmp3);}
			if(tmp4!=null && tmp4!=""){totalFeeAlreadyPaid += parseInt(tmp4);}
		}
		$('#totalRoundedOffFee').val(totalRoundedOffFee);
		$('#totalRevisedFee').val(totalRevisedFee.toFixed(2));
		$('#totalRevisedTariff').val(totalRevisedTariff);
		$('#totalFeeAlreadyPaid').val(totalFeeAlreadyPaid);
		$('#totalAdjustmentAmount').val(totalAdjustmentAmount);
	});
	
	function calculateAdjustment(listSize,index,petitionType){
		var revisedTariff = $('#revisedTariff'+index).val();
		var revisedRate = $('#revisedRate'+index).val();
		var revisedFee = $('#revisedFee'+index).val();
		var roundedOffFee = $('#roundedOffFee'+index).val();
		var netFeePayable = $('#netFeePayable'+index).val();
		var feeAlreadyPaid = $('#feeAlreadyPaid'+index).val();
		var totalAdjustmentAmount = 0;
		var totalRevisedTariff = 0;
		var totalRevisedFee = 0;
		var totalRoundedOffFee = 0;
		var totalFeeAlreadyPaid = 0;
		
		if(revisedTariff!=null && revisedRate!=null && feeAlreadyPaid!=null &&
				revisedTariff!="" && revisedRate!="" && feeAlreadyPaid!=""){
			if(petitionType=='GT'){
				revisedFee = revisedTariff*revisedRate;
			}
			else{
				revisedFee = revisedTariff*revisedRate/100;
				var yearFromTo = $("#yearFromTo"+index).val();
				/* alert(yearFromTo); */
				var minFee = 0;
				if(parseInt(yearFromTo)<=2012){
					minFee = 40000;
				}
				else{
					minFee = 100000;
				}
				/* alert(minFee); */
				if(revisedFee<minFee && revisedFee>0){
					revisedFee=minFee;
				}
				
			}
			
			
			var roundUpTo = 100;
			var mod = revisedFee%roundUpTo;
			if(mod>=(roundUpTo/2))
				roundedOffFee = revisedFee+(roundUpTo-mod);
			else
				roundedOffFee = revisedFee-mod;
			$('#roundedOffFee'+index).val(roundedOffFee);
			netFeePayable = roundedOffFee-feeAlreadyPaid;
			$('#revisedFee'+index).val(revisedFee.toFixed(2));
			$('#netFeePayable'+index).val(netFeePayable);
		for(var i=0 ;i<listSize;i++){
			var tmp = $('#netFeePayable'+i).val();
			var tmp1 = $('#roundedOffFee'+i).val();
			var tmp2 = $('#revisedFee'+i).val();
			var tmp3 = $('#revisedTariff'+i).val();
			var tmp4 = $('#feeAlreadyPaid'+i).val();
			
			if(tmp!=null && tmp!=""){totalAdjustmentAmount += parseInt(tmp);}
			if(tmp1!=null && tmp1!=""){totalRoundedOffFee += parseInt(tmp1);}
			if(tmp2!=null && tmp2!=""){totalRevisedFee = parseFloat(totalRevisedFee) + parseFloat(tmp2);}
			if(tmp3!=null && tmp3!=""){totalRevisedTariff += parseInt(tmp3);}
			if(tmp4!=null && tmp4!=""){totalFeeAlreadyPaid += parseInt(tmp4);}
		}
		$('#totalRoundedOffFee').val(totalRoundedOffFee);
		$('#totalRevisedFee').val(totalRevisedFee.toFixed(2));
		$('#totalRevisedTariff').val(totalRevisedTariff);
		$('#totalFeeAlreadyPaid').val(totalFeeAlreadyPaid);
		$('#totalAdjustmentAmount').val(totalAdjustmentAmount);
	}
	}	
	function fidAdd() {
		$('.fidRepeat:first').clone().insertAfter(".fidRepeat:last").find("#petitionNumber").val("");
		var fidLength = $(".fidRepeat").length;
		$( (".fidRepeat") ).each(function(i) {
			if (i < (fidLength-1)) {
				$(".delete").show();
				$(".add").hide();
			}
			else {
				$("span.delete:last").hide();
				$("span.add:last").show();
			}
		});
	}

	function fidDelete(e) {
		$(e).parents(".fidRepeat").remove();		
	}
	
	function chkValidation()
	{
		
	 if($('#utr').val()=="")
		{
			alert("Please select UTR No.");
			$('#utr').focus();
			return false;
		}
		else
		{
			return true;
		}
	}

</script>
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="filingFeeAdjustmentDetails" action="filingFeeAdjustmentDetailsListSave">
<s:hidden name="filingBeanId"/>
<s:hidden name="cercPetition.refPetitionTypeId.petitionTypeCode" id="petitionTypeCode"/>
	<table border = "0" valign="top">
		<tr>
			<th colspan="7" class="mainheading">Filing - Fee Adjustment Details</th>
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
				<td colspan="17" align="center">Reference No. : <s:property value="referenceNumberDisplay"/></td>									
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
		<s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'">
		<tr>
			<td colspan="5">
			<s:a action="filingFeeAdjustmentDetails">
			<s:param name="struts.token.name" value="%{'token'}"/>
   				<s:param name="token" value="token"/>
   				<s:param name="filingBeanId" value="filingBeanId"/>
   				Add/Edit Fee Adjustment</s:a></td>
   				<td align="right" colspan="2">(Rs.)
		</tr>
		</s:if>
		<s:if test="hasActionMessages()">
		<tr align="left">
			<td colspan="7"><font color="red" size="2pt"><s:actionmessage/></font></td>
		</tr>
		</s:if>
		<s:hidden name="listSize" id="listSize" value="%{filingFeeAdjustmentDetailsList.size()}"/>
		<s:if test="filingFeeAdjustmentDetailsList.size>0">
		<tr><td colspan="7">
		<table border="1" cellspacing="0" cellpadding="0">
					<tr class="subheading" valign="middle" align="center">
						<td width="10%" rowspan="2">Financial Year</td>
						<td width="15%" rowspan="2">Petition Number</td>
						<s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='GT'">
							<td width="15%" rowspan="2">Unit Name</td>
						</s:if>
						<s:else>
							<td width="15%" rowspan="2">Assets Name</td>
						</s:else>
						<td width="10%">Filing fees already paid</td>
						<s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='GT'">
							<td width="10%">Capacity<br/>(in MW)</td>
						</s:if>
						<s:else>
							<td width="10%">Revised Tariff</td>
						</s:else>
						
						
						<td width="10%">Revised Rate</td>
						<td width="10%">Revised Filing fees</td>
						<td width="10%">Round off</td>
						<td width="10%">Net fee Payable</td>
					</tr>
					<tr class="subheading" valign="middle" align="center">
						<td width="10%">A</td>
						<td width="10%">B</td>
						<td width="10%">C</td>
						<td width="10%">B x C</td>
						<td width="10%">D</td>
						<td width="10%">D - A</td>
					</tr>
					<s:iterator value="filingFeeAdjustmentDetailsList" status="rowstatus">
					<s:hidden name="filingFeeAdjustmentDetailsList[%{#rowstatus.index}].id"/>
					<s:hidden name="filingFeeAdjustmentDetailsList[%{#rowstatus.index}].petitionName"/>
					<s:hidden name="filingFeeAdjustmentDetailsList[%{#rowstatus.index}].assetName"/>
					<tr>	
						<td>
							<s:hidden id="yearFromTo%{#rowstatus.index}" value="%{yearTo}"/>
							<s:property value="yearFrom"/>-<s:property value="yearTo"/>
						</td>
						<td><s:property value="petitionName"/></td>
						<td><s:property value="assetName"/></td>
						<td><s:textfield name="filingFeeAdjustmentDetailsList[%{#rowstatus.index}].feeAlreadyPaid" size="10" id="feeAlreadyPaid%{#rowstatus.index}" onchange="calculateAdjustment(%{filingFeeAdjustmentDetailsList.size()},%{#rowstatus.index},'%{cercPetition.refPetitionTypeId.petitionTypeCode}')"/></td>
						<td><s:textfield name="filingFeeAdjustmentDetailsList[%{#rowstatus.index}].revisedTariff" size="10" id="revisedTariff%{#rowstatus.index}" onchange="calculateAdjustment(%{filingFeeAdjustmentDetailsList.size()},%{#rowstatus.index},'%{cercPetition.refPetitionTypeId.petitionTypeCode}')"/></td>
						<td><s:textfield name="filingFeeAdjustmentDetailsList[%{#rowstatus.index}].revisedRate" size="10" id="revisedRate%{#rowstatus.index}" onchange="calculateAdjustment(%{filingFeeAdjustmentDetailsList.size()},%{#rowstatus.index},'%{cercPetition.refPetitionTypeId.petitionTypeCode}')"/></td>
						<td><s:textfield name="filingFeeAdjustmentDetailsList[%{#rowstatus.index}].revisedFee" size="10" id="revisedFee%{#rowstatus.index}" readonly="true"/></td>
						<td><s:textfield name="filingFeeAdjustmentDetailsList[%{#rowstatus.index}].roundedOffFee" size="10" id="roundedOffFee%{#rowstatus.index}" readonly="true"/></td>
						<td><s:textfield name="filingFeeAdjustmentDetailsList[%{#rowstatus.index}].netFeePayable" size="10" id="netFeePayable%{#rowstatus.index}" readonly="true"/></td>
					</tr>
					</s:iterator>
					<tr valign="middle" align="left">
						<td colspan="3">Total</td>
						<td><s:textfield name="totalFeeAlreadyPaid" id="totalFeeAlreadyPaid" size="10" readonly="true"/></td>
						<td><s:textfield name="totalRevisedTariff" id="totalRevisedTariff" size="10" readonly="true"/></td>
						<td></td>
						<td><s:textfield name="totalRevisedFee" id="totalRevisedFee" size="10" readonly="true"/></td>
						<td><s:textfield name="totalRoundedOffFee" id="totalRoundedOffFee" size="10" readonly="true"/></td>
						<td><s:textfield name="totalAdjustmentAmount" id="totalAdjustmentAmount" size="10" readonly="true"/></td>
					</tr>
				</table>
		</td></tr>
		<tr>
			<td>UTR No.<span class="tooltip">*</td>
			<td>:</td>
			<td colspan="5">
				<s:select list="refUtrList" name="utr" id="utr" listKey="id" listValue="utrNumber+' [Balance:'+balanceAmount+' INR]'" headerKey="" headerValue="- Select -" cssStyle="width:284pt"/>				
			</td>
		</tr>
		</s:if>
		<tr><td colspan="7"></td></tr>
		<tr>
			<td colspan="3">
			</td>
			<td colspan="4" align="right">
				<s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'">
					<input type="submit" id="savebutton" name="savebutton" value="Save" class="formbutton" onclick="return chkValidation()"/>&nbsp;&nbsp;
					<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				</s:if>
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
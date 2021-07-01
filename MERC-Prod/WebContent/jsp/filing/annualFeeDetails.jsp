<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">
$(document).ready(function() {
	$('#courtFeecalculated').attr("readonly", true); 
	$('#courtFeeSurcharge').attr("readonly", true);  
	$('#courtFeeTotal').attr("readonly", true);

	$("#courtFeePaid").on('keypress', function (e){
	    //alert("1 :"+e.keyCode);
	    	if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57)) 
	        {
	    		
	        	$("#courtFeePaiderrmsg").html("Digits Only").hide();
                return true;
    		}
	    	else 
    		{
    			$("#courtFeePaiderrmsg").html("Digits Only").show();
    			e.preventDefault(); 
    		}
	    });
	$("#courtFeeBalance").on('keypress', function (e){
	    //alert("1 :"+e.keyCode);
	    	if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57)) 
	        {
	    		
	        	$("#courtFeeBalanceerrmsg").html("Digits Only").hide();
                return true;
    		}
	    	else 
    		{
    			$("#courtFeeBalanceerrmsg").html("Digits Only").show();
    			e.preventDefault(); 
    		}
	    });
	
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
	
	$('#savebutton').click(function(){
		if($('#utr').val()=="")
		{
			alert("Please select UTR.");
			return false;
		}
		
	});
});

function fidAdd() {
	
	$('.fidRepeat:first').clone().insertAfter(".fidRepeat:last").find("#utr").val("");
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


</script> 
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="annualFeeDetailsSave" action="annualFeeDetailsSave">
<s:hidden name="filingBeanId"/>
<s:hidden name="feePeriodFrom"/>
<s:hidden name="feePeriodTo"/>
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
		
		
		
		<s:if test="hasActionMessages()">
			<tr align="left">
				<td colspan="7"><font color="red" size="3pt"><s:actionmessage/></font></td>
			</tr>
		</s:if>
		<%-- <s:if test="refFeeStructure.calculationType=='C' or cercPetition.refPetitionTypeId.petitionTypeCode=='TL'"> --%>
		<tr class="subheading">
			<td colspan="7">
			For <s:property value="cercPetition.refPetitionTypeId.petitionType"/>
			</td>									
		</tr>
		<tr>
			<td width="20%"><s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='GT'">
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
			<td width="28%">
			<s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='TD'">
				<s:property value="cercPetition.refLicensingCategoryId.licensingCategoryDescription"/>
			</s:if>
			<s:else><s:property value="refGenerationTransmission.generationTransmissionName"/>
			<s:property value="refGenerationTransmission.generationTransmissionName"/>
			</s:else>
			</td>
			<td width="2%"></td>
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>
		</tr>
		
		<tr>
			<td>Tariff Period</td>
			<td>:</td>
			<td colspan="5">
				<s:property value="refTariffPeriodBean.periodDisplay"/>
			</td>						
		</tr>
		<s:if test="cercAssetList.size>0">
		<tr class="subheading">
			<td colspan="7">
				<s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='GT'">
				Unit Details
				</s:if>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TT'">
				Asset Details
				</s:elseif>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TL'">
				Line Details
				</s:elseif>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TD'">
				Category Details
				</s:elseif>
			</td>												
		</tr>
		<tr>
			<td colspan="7">
				<table border="0">
				<s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='GT'">
					<tr class="subheading" align="center">
						<td width="2%">S.No.</td>
						<td width="16%">Unit Name</td>
						<td width="10%">Unit Type</td>
						<td width="10%">Capacity(MW)</td>
						<td width="16%">Anti. DOCO Date</td>
						<td width="18%">Actual DOCO Date</td>
						<td width="8%">Fees</td>
						<td width="10%">From</td>
						<td width="10%">To</td>						
					</tr>
				</s:if>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TT'">
					<tr class="subheading" align="center">
						<td width="2%">S.No.</td>
						<td width="16%">Asset Name</td>
						<td width="10%">Asset Type</td>
						<td width="10%">ATC</td>
						<td width="16%">Anti. DOCO Date</td>
						<td width="18%">Actual DOCO Date</td>
						<td width="*%">Fees</td>
						<td width="10%">From</td>
						<td width="10%">To</td>
					</tr>
				</s:elseif>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TL'">
				<tr class="subheading" align="center">
						<td width="2%">S.No.</td>
						<td width="16%">Line Name</td>
						<td width="10%">Asset Type</td>
						<td width="10%">ATC</td>
						<td width="16%">Anti. DOCO Date</td>
						<td width="18%">Actual DOCO Date</td>
						<td width="*%">Fees</td>
						<td width="10%">From</td>
						<td width="10%">To</td>
					</tr>
					</s:elseif>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TD'">
				<tr class="subheading" align="center">
						<td width="2%">S.No.</td>
						<td width="40%">Category</td>
						<td width="20%">From</td>
						<td width="20%">To</td>
					</tr>
					</s:elseif>
					<s:iterator value="cercAssetList" status="rowstatus">
					<s:hidden name="cercAssetList[%{#rowstatus.index}].id"/>
					<s:hidden name="cercAssetList[%{#rowstatus.index}].assetName"/>
					<s:hidden name="cercAssetList[%{#rowstatus.index}].assetType"/>
					<s:hidden name="cercAssetList[%{#rowstatus.index}].capacity"/>
					<s:hidden name="cercAssetList[%{#rowstatus.index}].cercPetitionId.id"/>
					<s:hidden name="cercAssetList[%{#rowstatus.index}].feeCalculated"/>
					<s:hidden name="cercAssetList[%{#rowstatus.index}].refGenerationTransmissionId.id"/>
					<s:hidden name="cercAssetList[%{#rowstatus.index}].feePeriodFrom"/>
					<s:hidden name="cercAssetList[%{#rowstatus.index}].feePeriodTo"/>
					<s:hidden name="cercAssetList[%{#rowstatus.index}].refTariffPeriodId.id"/>
					<s:hidden name="cercAssetList[%{#rowstatus.index}].refAssetsId.id"/>
					<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
						<td><s:property value="#rowstatus.count"/> </td>
						<td><s:property value="assetName"/></td>
						<td>
						<s:if test='assetType=="E"'>Existing</s:if><s:else>New</s:else>
						</td>
						<td><s:property value="getText('{0,number,#,##0.##}',{capacity})"/></td>
						<td><s:date name="anticipatedDocoDate" format="dd/MM/yyyy"/></td>
						<td><s:date name="actualDocoDate" format="dd/MM/yyyy"/></td>
						<td align="right"><s:property value="getText('{0,number,#,##0}',{feeCalculated})"/></td>
						<td align="right">
						<s:property value="#request.feePeriodFrom"/>
						</td>
						<td align="right">
						<s:property value="feePeriodTo"/>
						</td>						
					</tr>
					</s:iterator>
				</table>
			</td>
		</tr>	
		</s:if>
		<%-- </s:if> --%>
		<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TD'">
		<tr>
			<td>Annual Fee For</td>
			<td>:</td>
			<td colspan="5"><s:property value="feePeriodFrom"/>-<s:property value="feePeriodTo"/></td>
		</tr>
		<%-- <tr>
			<td colspan="7">
				<table border="0">
				<tr>
			<td width="20%">
				Category
				</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="refFeeStructure.refLicensingCategoryId.licensingCategoryDescription"/></td>
			<td width="2%"></td>
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>
			</tr>
			<tr>
			<td>Tariff Period</td>
			<td>:</td>
			<td colspan="5"><s:property value="refTariffPeriodBean.periodDisplay"/></td>						
			</tr>
		</table>
			</td>
		</tr> --%>
		</s:elseif>
		
		<tr class="subheading">
			<td colspan="7">Fee Calculation</td>									
		</tr>
		<%-- <tr>
			<td>UTR No.<span class="tooltip">*</td>
			<td>:</td>
			<td colspan="5">
				<s:select list="refUtrList" name="utr" id="utr" listKey="id" listValue="utrNumber+' [Balance:'+balanceAmount+' INR]'" headerKey="" headerValue="- Select -" cssStyle="width:284pt"/>				
			</td>
		</tr> --%>
		
		<tr>
			<td colspan="7">
			<s:if test="utr.length>0">
			<s:iterator value="utr" status="rowstatus">
				<div class="fidRepeat">
					UTR No.
					<span class="required">*</span> 
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;
					<s:select list="refUtrList" name="utr" id="utr" listKey="id" listValue="utrNumber+' [Balance:'+balanceAmount+' INR]'" headerKey="" headerValue="- Select -" cssStyle="width:284pt" value="%{utr[#rowstatus.index]}"/>
					<s:if test="%{#rowstatus.count!=utr.size()}">
					<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>
					</s:if>
					<s:else>
					<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>
					<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
					</s:else>
				</div>	
			</s:iterator>
			</s:if>
			<s:else>
				<div class="fidRepeat">
					UTR No.
					<span class="required">*</span> 
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;
					<s:select list="refUtrList" name="utr" id="utr" listKey="id" listValue="utrNumber+' [Balance:'+balanceAmount+' INR]'" headerKey="" headerValue="- Select -" cssStyle="width:284pt" value="%{utr[#rowstatus.index]}"/>
					<s:if test="%{#rowstatus.count!=utr.size()}">
					<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>
					</s:if>
					<s:else>
					<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>
					<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
					</s:else>
				</div>	
			</s:else>
			</td>
		</tr>
		<tr>
			<td colspan="7">
				<table border="0">
					<tr class="subheading" align="center">
						<td width="20%">Calculated</td>
						<td width="20%">Surcharge*</td>
						<td width="20%">Total Fee</td>
						<td width="20%">Fee Paid</td>
						<td width="20%">Balance</td>
					</tr>
					<tr>
					<s:hidden name="cercPetitionAnnualFee.refTariffPeriodId.id"/>
					<s:hidden name="cercPetitionAnnualFee.cercPetitionId.id"/>
					<s:hidden name="cercPetitionAnnualFee.isDeleted"/>
					<s:hidden name="cercPetitionAnnualFee.id"/>
					<s:hidden name="cercPetitionAnnualFee.feePeriodFrom"/>
					<s:hidden name="cercPetitionAnnualFee.feePeriodTo"/>
						<td width="20%"><s:textfield type="text" size="22" name="cercPetitionAnnualFee.feeCalculated"  id="courtFeecalculated"  /></td>
						<td width="20%"><s:textfield type="text" size="22" name="cercPetitionAnnualFee.surcharge"  id="courtFeeSurcharge"  /></td>
						<td width="20%"><s:textfield type="text" size="22" name="cercPetitionAnnualFee.totalFee"  id="courtFeeTotal"  /></td>
						<td width="20%"><s:textfield type="text" size="22" name="cercPetitionAnnualFee.feePaid"  id="courtFeePaid"  /><br><span id="courtFeePaiderrmsg"></span></td>
						<td width="20%"><s:textfield type="text" size="22" name="cercPetitionAnnualFee.balanceFee"  id="courtFeeBalance"  /><br><span id="courtFeeBalanceerrmsg"></span></td>
					</tr>
				</table>
			</td>
		</tr>			
		<tr>
			<td colspan="7"><span class="tooltip">*Surcharge if any (@ 1% per month or part of month)</span></td>			
		</tr>
		<tr valign="top">
			<td>Remarks</td>
			<td>:</td>
			<td colspan="5">
				<s:textarea name="cercPetitionAnnualFee.remarks" id="remarks" cols = "100" />				
			</td>
		</tr>
		<tr><td colspan="7"></td></tr>
		<tr>
			<td colspan="3">
			</td>
			<td colspan="4" align="right">
				<!-- <input type="button" id="previousbutton" name="previousbutton" value=" &lt;&lt; Previous" class="formbutton" onClick="filingPrayerDetailsList()"/>&nbsp;&nbsp;
				<input type="button" id="nextbutton" name="nextbutton" value="Next &gt;&gt;" class="formbutton" onClick="filingDocumentDetailsList()"/>&nbsp;&nbsp; -->
				<%-- <s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'"> --%>
					<input type="submit" id="savebutton" name="savebutton" value="Save" class="formbutton"/>&nbsp;&nbsp;
					<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				<%-- </s:if> --%>
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="annualFee"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
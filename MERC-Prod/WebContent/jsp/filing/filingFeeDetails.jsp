<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">

var unsaved = false;

function deleteConfirmation() 
{
    var x=confirm('All Asset will be deleted. Are you sure you want to delete ?');
    if (x) 
    {
    	return true;
    } 
    else 
    {
        return false;
    }
    
}
function chkValidation()
{
	var beanSize='<s:property value="%{cercAssetsBeanList.size()}"/>';
	if($('#isApplicableForWaiverId').prop('checked')==true && $('#refWaiverGroundsId').val()=="")
	{
		alert("Please select waiver reason");
		$('#refWaiverGroundsId').focus(); 
		return false;
	}
	else if(beanSize==0 && ($('#petitionTypeCode').val()=="TT" || $('#petitionTypeCode').val()=="GT"))
	{
		alert("Please add assets / units.");
		return false;
	} 
	else if($('#isApplicableForWaiverId').prop('checked')==false && $('#utr').val()=="")
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


$(document).ready(function() 
{ 
	
// 	28-04-2020 start SH
	$(":input").change(function(){ 
    	unsaved = true;
	});
	
// 	alert(unsaved);
// 	28-04-2020 end SH
	$('.wv').hide();
	$(".delete").hide();
	if($('#isApplicableForWaiverId').prop('checked')==true){
		$('.waiver').show();
	}
	else{
		$('.waiver').hide();
	}
	$('#courtFeecalculated').attr("readonly", true); 
	$('#courtFeeSurcharge').attr("readonly", true);  
	$('#courtFeeTotal').attr("readonly", true);
	$('input[name="cercPetition.isApplicableForWaiver"]').click(function ()
	{
		if($('#isApplicableForWaiverId').prop('checked')==true)
		{
			$('.waiver').show();
			$('#courtFeePaid').val("0");
			$('#courtFeePaid').attr("readonly", true);
			$('#utr').val("");
		}
		else
		{
			$('#courtFeePaid').attr("readonly", false);
			$('#refWaiverGroundsId').val("");
			$('.waiver').hide();
		}
	});
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
});

	

	function filingAssetDetails(){
		if(unsaved){
			var confo = confirm("Are you sure you want to leave this page? There is unsaved data on this page");
			if(confo != true){
				$("#nextbutton").blur();
				return false;
			}
		
		}
		document.filingFeeDetails.action="filingAssetDetails?struts.token.name=token&token=<s:property value="token"/>";
		document.filingFeeDetails.submit();
	}
	
	function filingDocumentDetailsList(){
		if(unsaved){
			var confo = confirm("Are you sure you want to leave this page? There is unsaved data on this page");
			$("#previousbutton").blur();
			if(confo != true){
				return false;
			}
		
		}
		document.filingFeeDetails.action="filingDocumentDetailsList?struts.token.name=token&token=<s:property value="token"/>";
		document.filingFeeDetails.submit();
	}
	
	function filingSummary(){
		if(unsaved){
			var confo = confirm("Are you sure you want to leave this page? There is unsaved data on this page");
			$("#nextbutton").blur();
			if(confo != true){
				return false;
			}
		
		}
		document.filingFeeDetails.action="filingSummary?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.filingFeeDetails.submit();
	}
	
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
	
	function payutrMaster(){
		
// 		document.filingFeeDetails.action="payutrMaster?struts.token.name=token&token=<s:property value="token"/>";
		document.filingFeeDetails.action="payutrMaster?struts.token.name=token&token=<s:property value="token"/>";
		document.filingFeeDetails.submit();
	}
	
	      	
</script>
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="filingFeeDetails" action="filingFeeDetailsSave">
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
		<%-- <s:if test="refFeeStructure.calculationType=='C' or cercPetition.refPetitionTypeId.petitionTypeCode=='TL'">--%>
		<tr>
			<td colspan="7">
				<s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'">
					<s:a action="filingAssetsDetailList">
					<s:param name="struts.token.name" value="%{'token'}"/>
   				<s:param name="token" value="token"/>
   				<s:param name="filingBeanId" value="filingBeanId"/>
					<s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='GT'">
					Add Units
					</s:if>
					<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TT'">
					Add Assets
					</s:elseif>
					<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TL'">
					Add Assets
					</s:elseif>
					</s:a>
				</s:if>
			</td>
		</tr>
		<%-- </s:if>--%> 
		<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TD'">
				<tr>
			<td colspan="7">
				<%-- <s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'">
					<s:a action="filingAssetsDetailList">
					<s:param name="struts.token.name" value="%{'token'}"/>
   				<s:param name="token" value="token"/>
   				<s:param name="filingBeanId" value="filingBeanId"/>
					Add Category
					</s:a>
				</s:if> --%>
			</td>
		</tr>
		</s:elseif>
		<s:if test="hasActionMessages()">
		<tr align="left">
		<td colspan="7"><font color="red" size="3pt"><s:actionmessage/></font></td>
		</tr>
		</s:if>
<!-- 		<tr class="subheading"> -->
<!-- 			<td colspan="7">Waiver Details</td>									 -->
<!-- 		</tr> -->
		<tr class = "wv">
			<td>Applicable for waiver</td>
			<td>:</td>
			<td colspan="5"><s:checkbox name="cercPetition.isApplicableForWaiver" id="isApplicableForWaiverId" fieldValue="true"/></td>			
		</tr>
		<tr class="waiver">
			<td>Grounds for seeking Waiver</td>
			<td>:</td>
			<td colspan="5">
			<s:select list="refWaiverGroundsList" name="cercPetition.refWaiverGroundsId.id" id="refWaiverGroundsId" listKey="id" listValue="description" headerKey="" headerValue="- Select -"/>
		</tr>
		<s:if test="refFeeStructure.calculationType=='C' or cercPetition.refPetitionTypeId.petitionTypeCode=='TL'">
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
			<td width="28%"><s:property value="refGenerationTransmission.generationTransmissionName"/></td>
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
		<s:if test="cercAssetsBeanList.size>0">
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
		<s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'">
		<tr>
			<td colspan="7" align="right">
				<s:a action="filingAssetsDelete" onClick="return deleteConfirmation();">
				<s:param name="struts.token.name" value="%{'token'}"/>
   				<s:param name="token" value="token"/>
   				<s:param name="filingBeanId" value="filingBeanId"/>
   				Delete</s:a>
			</td>
		</tr>
		</s:if>
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
						<td width="10%">ATC (Rs)</td>
						<td width="16%">Anti. DOCO Date</td>
						<td width="18%">Actual DOCO Date</td>
						<td width="*%">Fees (Rs)</td>
						<td width="10%">From</td>
						<td width="10%">To</td>
						<td width="8%" align="right">Select</td>
					</tr>
				</s:elseif>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TL'">
				<tr class="subheading" align="center">
						<td width="2%">S.No.</td>
						<td width="16%">Line Name</td>
						<td width="10%">Asset Type</td>
						<td width="10%">ATC (Rs)</td>
						<td width="16%">Anti. DOCO Date</td>
						<td width="18%">Actual DOCO Date</td>
						<td width="*%">Fees (Rs)</td>
						<td width="10%">From</td>
						<td width="10%">To</td>
						<td width="8%" align="right">Select</td>
					</tr>
					</s:elseif>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TD'">
				<tr class="subheading" align="center">
						<td width="2%">S.No.</td>
						<td width="40%">Category</td>
						<td width="20%">From</td>
						<td width="20%">To</td>
						<td width="18%" align="right">Select</td>
					</tr>
					</s:elseif>						
					<s:iterator value="cercAssetsBeanList" status="rowstatus">
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
						<s:property value="feePeriodFrom"/>
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
		</s:if>
		<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TD'">
		<tr class="subheading">
			<td colspan="7">For <s:property value="cercPetition.refPetitionTypeId.petitionType"/></td>									
		</tr>
		<tr>
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
		</tr>
		</s:elseif>
		
		<tr class="subheading">
			<td colspan="7">Fee Calculation</td>									
		</tr>
		<%-- <tr>
			<td>UTR No.<span class="tooltip">*</td>
			<td>:</td>
			<td colspan="5">
			<s:if test="utr.length>0">
			<s:iterator value="utr" status="rowstatus">
			<div class="fidRepeat">
				<s:select list="refUtrList" name="utr" id="utr" listKey="id" listValue="utrNumber+' [Balance:'+balanceAmount+' INR]'" headerKey="" headerValue="- Select -" cssStyle="width:284pt"/>				
			    <s:if test="%{#rowstatus.count!=utr.size()}">
			    <span class="delete"><a href="#"
						onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span></s:if>
						<s:else>
						<span class="delete"><a href="#"
						onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>
					<span class="add"><a href="#"
						onClick="fidAdd();return false;" id="add-address">Add More</a></span></s:else>
			</div></s:iterator></s:if>
			<s:else>
			<div class="fidRepeat">
				<s:select list="refUtrList" name="utr" id="utr" listKey="id" listValue="utrNumber+' [Balance:'+balanceAmount+' INR]'" headerKey="" headerValue="- Select -" cssStyle="width:284pt"/>				
			   <s:if test="%{#rowstatus.count!=utr.size()}">
			    <span class="delete"><a href="#"
						onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span></s:if>
					<s:else>
					<span class="delete"><a href="#"
						onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>	
					<span class="add"><a href="#"
						onClick="fidAdd();return false;" id="add-address">Add More</a></span></s:else>
			</div>
		</s:else>
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
					<s:if test="#session.CERC_USER.userType!='E'">
					<span><s:submit id="" name="" value="Pay Online" class="formbutton" onclick="payutrMaster()" /></span>
					</s:if>
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
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<!-- 		Need to uncomment once whitelisted by paymentgatway teem -->	
					<%-- <s:if test="#session.CERC_USER.userType!='E'">
					<span><s:submit id="" name="" value="Pay Online" class="formbutton" onclick="payutrMaster()" /></span>
					</s:if> --%>
					
					</s:else>
				</div>	
			</s:else>
			</td>
		</tr>
		<tr>
			<td colspan="7">
				<table border="0">
					<tr class="subheading" align="center">
						<td width="20%">Calculated (Rs)</td>
						<td width="20%">Surcharge* (Rs)</td>
						<td width="20%">Total Fee (Rs)</td>
						<td width="20%">Fee Paid (Rs)</td>
						<td width="20%">Balance (Rs)</td>
					</tr>
					<tr>
					<s:hidden name="cercPetitionFee.refTariffPeriodId.id"/>
					<s:hidden name="cercPetitionFee.cercPetitionId.id"/>
					<s:hidden name="cercPetitionFee.isDeleted"/>
					<s:hidden name="cercPetitionFee.id"/>
						<td width="20%"><s:textfield type="text" size="22" name="cercPetitionFee.feeCalculated"  id="courtFeecalculated" /></td>
						<td width="20%"><s:textfield type="text" size="22" name="cercPetitionFee.surcharge"  id="courtFeeSurcharge"  /></td>
						<td width="20%"><s:textfield type="text" size="22" name="cercPetitionFee.totalFee"  id="courtFeeTotal"  /></td>
						<td width="20%"><s:textfield type="text" size="22" name="cercPetitionFee.feePaid"  id="courtFeePaid" /><br><span id="courtFeePaiderrmsg"></span></td>
						<td width="20%"><s:textfield type="text" size="22" name="cercPetitionFee.balanceFee"  id="courtFeeBalance"  /><br><span id="courtFeeBalanceerrmsg"></span></td>
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
				<s:textarea name="cercPetitionFee.remarks" id="remarks" cols = "100" />				
			</td>
		</tr>
		<tr><td colspan="7"></td></tr>
		<tr>
			<td colspan="7"><span class="tooltip">*Petition filling fee is subject to change, hence fee should be calculated on the same day when submitting the draft petition</span></td>			
		</tr>
		<tr><td colspan="7"></td></tr>
		<tr>
			<td colspan="3">
<%-- 				<s:if test="refStatus.statusCode=='F'">
				<input type="submit" id="submitbutton" name="submitbutton" value="Submit" class="formbutton" onClick="filingSummary()" />
				</s:if>
 --%>			</td>
			<td colspan="4" align="right">
			<s:if test = "filingBean.diaryNumber == null">
				<input type="button" id="previousbutton" name="previousbutton" value=" &lt;&lt; Previous" class="formbutton" onClick="filingDocumentDetailsList()"/>&nbsp;&nbsp;
				<input type="button" id="nextbutton" name="nextbutton" value="Next &gt;&gt;" class="formbutton" onClick="filingAssetDetails()"/>&nbsp;&nbsp;
				<s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'">
					<input type="submit" id="savebutton" name="savebutton" value="Save" class="formbutton" onclick="return chkValidation()"/>&nbsp;&nbsp;
					<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				</s:if>
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/>
			</s:if>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
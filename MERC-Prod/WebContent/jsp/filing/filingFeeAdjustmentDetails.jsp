<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">

	$(document).ready(function() {
		$(".delete").hide();
		$("#refAssetsId").get(0).options.length = 0;
		$("#refAssetsId").get(0).options[0] = new Option("- Select -", "");
		$('select[name="refGenerationTransmissionId"]').change(function () {
			var refGenerationTransmissionId = $(this).val();
			$.ajax({
		    	url: "loadAssets",
		        data : {
		        	refGenerationTransmissionId:refGenerationTransmissionId,
		            refAssetsList:"",
				},
		        dataType: "json",
		        type: 'POST',
		        success: function(refAssetsList) {
			            	$.each(refAssetsList, function(id,refAssets){
			            		$("#refAssetsId").get(0).options[$("#refAssetsId").get(0).options.length] = new Option(refAssets.assetName,refAssets.id);
							});
				},
		        	error: function() {
		            	alert("Failed to load Assets");
					}
				});
		});
	});

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
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="filingFeeAdjustmentDetails" action="filingFeeAdjustmentDetailsSave">
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
		<tr>
			<td colspan="7">
				<table>
					<tr class="subheading" align="center" valign="middle">
						<td width="20%" colspan="2">Financial Year</td>
						<td width="20%" rowspan="2">Petition Number</td>
						<td width="25%" rowspan="2">Generation Station</td>
						<td width="25%" rowspan="2">Assets Name</td>
						<td width="10%" rowspan="2">Action</td>
					</tr>
					<tr class="subheading">
						<td width="10%">From Year</td>
						<td width="10%">To Year</td>
					</tr>
					<tr class="fidRepeat">	
						<td><s:select  name="feeYearFrom" id="feeYearFrom" list="yearList" headerValue="- Select -" headerKey=""/></td>
						<td><s:select  name="feeYearTo" id="feeYearTo" list="yearList" headerValue="- Select -" headerKey=""/></td>
						<td><s:select  name="petitionId" id="petitionId" list="cercPetitionList" listKey="id" listValue="registrationNumberDisplay" headerValue="- Select -" headerKey=""/></td>
						<td><s:select  name="refGenerationTransmissionId" id="refGenerationTransmissionId" list="refGenerationTransmissionList" listKey="id" listValue="generationTransmissionName" headerValue="- Select -" headerKey=""/></td>
						<td><s:select  name="refAssetsId" id="refAssetsId" list="refAssetsList" listKey="id" listValue="assetName" headerValue="- Select -" headerKey=""/></td>
						<td>
							<s:submit type="submit" id="addbutton" name="addbutton" value="Add" class="formbutton"  action="addFeeAdjustmentDetails"/>	
							<%-- <span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>
							<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span> --%>
						</td>
					</tr>
				</table>
			</td>			
		</tr>
		<tr><td colspan="7"></td></tr>
		<tr><th colspan="7" class="mainheading">Added Asset List</th></tr>
		<s:if test="cercPetitionFeeAdjustmentAssetList.size>0">
		<tr><td colspan="7">
		<table>
					<tr class="subheading" valign="middle">
						<td width="5%">S.No.</td>
						<td width="10%">Financial Year</td>
						<td width="20%">Petition Number</td>
						<td width="25%">Generation Station</td>
						<td width="25%">Assets Name</td>
						<td width="10%">Combine With</td>
						<td width="5%">Action</td>
					</tr>
					<s:iterator value="cercPetitionFeeAdjustmentAssetList" status="rowstatus">
					<s:hidden name="cercPetitionFeeAdjustmentAssetList[%{#rowstatus.index}].id"/>
					<tr class="fidRepeat">	
						<td><s:property value="%{#rowstatus.count}"/></td>
						<td><s:property value="yearFrom"/>-<s:property value="yearTo"/></td>
						<td><s:property value="cercAdjustedPetitionId.registrationNumberDisplay"/></td>
						<td><s:property value="refGenerationTransmissionId.generationTransmissionName"/></td>
						<td><s:property value="refAssetsId.assetName"/></td>
						<td>
							<s:if test="cercPetitionFeeAdjustmentAssetList.size>1">
								<s:select name="cercPetitionFeeAdjustmentAssetList[%{#rowstatus.index}].mergedWith.id" list="cercDropdownBeanList" listKey="id" listValue="fieldName" headerKey="" headerValue="- Select -"/>
							</s:if>
						</td>
						<td>
							<s:url var="cercPetitionFeeAdjustmentAssetDelete" action="cercPetitionFeeAdjustmentAssetDelete">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="cercPetitionFeeAdjustmentAssetId" value="id"/>
							<s:param name="filingBeanId" value="filingBeanId"/>
						</s:url>
						<s:a href="%{cercPetitionFeeAdjustmentAssetDelete}" onClick="return deleteConfirmation();">Delete</s:a>
						</td>
					</tr>
					</s:iterator>
				</table>
		</td></tr>
		</s:if>
		<tr>
			<td colspan="3">
			</td>
			<td colspan="4" align="right">
				<s:submit type="submit" id="savebutton" name="savebutton" value="Save" class="formbutton" onclick="return chkValidation()"/>&nbsp;&nbsp;
				<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">

	$(document).ready(function() {
		$(".delete").hide();
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
					<tr class="subheading">
						<td width="9%">Financial Year</td>
						<td width="9%">Petition Number</td>
						<td width="9%">Filing fee already paid</td>
						<td width="9%">Filing Fee Rate</td>
						<td width="9%">Filing Fee should be paid</td>
						<td width="9%">Revised Filing Fee</td>
						<td width="9%">Tariff Already Paid</td>
						<td width="9%">Tariff should be paid</td>
						<td width="9%">Revised Tariff</td>
						<td width="9%">Adjustment</td>
						<td width="9%">Action</td>
					</tr>
					<tr class="subheading">
						<td width="9%"></td>
						<td width="9%"></td>
						<td width="9%">[A]</td>
						<td width="9%"></td>
						<td width="9%">[B]</td>
						<td width="9%">C = [A] - [B]</td>
						<td width="9%">[D]</td>
						<td width="9%">[E]</td>
						<td width="9%">F = [D] - [E]</td>
						<td width="9%">[C] + [F]</td>
						<td width="9%"></td>
					</tr>
					<tr class="fidRepeat">	
						<td><s:select  name="feeYear" id="feeYear" list="yearList" headerValue="- Select -" headerKey=""/></td>
						<td><s:select  name="petitionId" id="petitionId" list="cercPetitionList" listKey="id" listValue="registrationNumberDisplay" headerValue="- Select -" headerKey=""/></td>
						<%-- <td><s:textfield type="text" size="9" name="petitionNumber" id="petitionNumber"/></td> --%>
						<td><s:textfield type="text" size="9" name="feePaid"  id="feePaid"  /></td>
						<td><s:textfield type="text" size="9" name="revisedRate"  id="revisedRate"  /></td>
						<td><s:textfield type="text" size="9" name="feeCalculated"  id="feeCalculated"  /></td>
						<td><s:textfield type="text" size="9" name="revisedFilingFee"  id="revisedFilingFee"  /></td>
						<td><s:textfield type="text" size="9" name="tariffPaid"  id="tariffPaid"  /></td>
						<td><s:textfield type="text" size="9" name="tariffcalculated"  id="tariffcalculated"  /></td>
						<td><s:textfield type="text" size="9" name="revisedTariff"  id="revisedTariff"  /></td>
						<td><s:textfield type="text" size="9" name="amountToAdjust"  id="amountToAdjust"  /></td>
						<td>	
							<s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'">
								<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>
								<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
							</s:if>
						</td>
					</tr>
				</table>
			</td>			
		</tr>
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
            	
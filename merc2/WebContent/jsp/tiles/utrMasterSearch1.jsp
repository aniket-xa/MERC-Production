<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
function reportWindow(url) {
	winddd = window.open(url,"report",'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no');
	winddd.focus();
}
$(document).ready(function() {
	
	$("input[name='searchbutton']").click(function(){
		   
		if($('#refPetitionTypeId').val()=="" && $('#petitionNumber').val()=="" && $('#petitionYear').val()=="" && $('#petitionerName').val()=="" && $('#respondentName').val()=="" && $('#petitionStatusId').val()=="" && $('#dateOfFilingFrom').val()=="" && $('#dateOfFilingTo').val()=="" && $('#dateOfRegistrationFrom').val()=="" && $('#dateOfRegistrationTo').val()=="" && $('#dateOfDisposalFrom').val()=="" && $('#dateOfDisposalTo').val()=="" && $('#assetName').val()=="" && $('#keywords').val()=="" && $('#subject').val()=="")
		{
			alert("Please select any one field.");
			return false;
		}
	});
});

</script>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:form theme="simple" name="utrMasterSearch1Case" action="utrMasterSearch1Case">
	<table border="0">
		<tr>
			<th colspan="7" class="mainheading">UTR Search</th>
		</tr>
		
		<tr valign="top">
			<td>UTR Number</td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="utrNumber" id="utrNumber"/></td>
	   </tr>
	   <tr valign="top">
			<td>Date of Deposit From</td>
			<td>:</td>
			<td><s:textfield type="text" size="10" name="depositDateFrom" id="depositDateFrom" class="tcal" cssStyle="width:130pt"/></td>
			<td></td>
			<td>Date of Deposit To</td>
			<td>:</td>
			<td><s:textfield type="text" size="10" name="depositDateTo" id="depositDateTo" class="tcal" cssStyle="width:130pt"/></td>
		</tr>
		<tr><td colspan="7"></td></tr>
		<tr align="right">
			<td colspan="7">
				<input type="submit" name="searchbutton" id="searchbutton" value="Search" class="formbutton" onclick="return searchRelatedCase();" />
				<input type="reset" name="resetbutton" id="resetbutton" value="Reset" class="formbutton"/>
				<!-- <input type="submit" name="cancelbutton" id="cancelbutton" value="Cancel" class="formbutton"/> -->
			</td>	
		</tr>
	</table>	
	<s:token/>	
</s:form>
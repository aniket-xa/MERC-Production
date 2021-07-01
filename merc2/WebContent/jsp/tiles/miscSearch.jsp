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
<s:form theme="simple" name="miscSearchCase" action="miscSearchCase">
	<table border="0">
		<tr>
			<th colspan="7" class="mainheading">Misc Search</th>
		</tr>
		<tr valign="top">
			<td width="20%">Petition Type</td>
			<td width="1%">:</td>
			<td width="28%">
				<s:select list="refPetitionTypeList" name="refPetitionTypeId" id="refPetitionTypeId" listKey="id" listValue="petitionTypeCode+'  '+petitionType" headerKey="" headerValue="-- Select --" cssStyle="width:150pt"/>
			</td>
			 <td width="2%"></td>
			<td width="20%">Exclude IA</td>
			<td width="1%">:</td>
			<td width="28%"><s:checkbox name="petitions" id="petitions" theme="simple"></s:checkbox></td> 
		</tr>
		<tr valign="top">
			<td width="20%">Year</td>
			<td width="1%">:</td>
			<td width="28%">
				<s:select  name="petitionYear" id="petitionYear" list="yearList" headerValue="- Select -" headerKey=""  cssStyle="width:150pt"/>
			</td>
			 <td width="2%"></td>
			<td width="20%">Petitioner Name</td>
			<td width="1%">:</td>
			<td width="28%"><s:textfield type="text" size="24" name="petitionerName" id="petitionerName"/></td> 
		</tr>
		<tr valign="top">
			
			<td>Respondent Name</td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="respondentName" id="respondentName"/></td>
			<td width="2%"></td>
			<td width="20%">Number</td>
			<td width="1%">:</td>
			<td width="28%"><s:textfield type="text" size="24" name="petitionNumber" id="petitionNumber"/></td> 
		</tr>
		<tr valign="top">
			<td>Status</td>
			<td>:</td>
			<td><s:select list="refStatusList" name="petitionStatusId" id="petitionStatusId" listKey="id" listValue="statusName" headerKey="" headerValue="-- Select --" cssStyle="width:150pt"/></td>
			<td></td>
			<td>Asset Name</td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="assetName" id="assetName"/></td>
		</tr>
		
		<tr valign="top">
			<td width="20%">Keywords</td>
			<td width="1%">:</td>
			<td width="28%">
				<s:textfield type="text" size="24" name="keyword" id="keyword"/>
			</td>
			 <td width="2%"></td>
			<td width="20%">Subject</td>
			<td width="1%">:</td>
			<td width="28%"><s:textfield type="text" size="24" name="subject" id="subject"/></td> 
		</tr>
		<tr valign="top">
			<td>Date of Filing From</td>
			<td>:</td>
			<td><s:textfield type="text" size="10" name="dateOfFilingFrom" id="dateOfFilingFrom" class="tcal" cssStyle="width:130pt"/></td>
			<td></td>
			<td>Date of Filing To</td>
			<td>:</td>
			<td><s:textfield type="text" size="10" name="dateOfFilingTo" id="dateOfFilingTo" class="tcal" cssStyle="width:130pt"/></td>
		</tr>
		<tr valign="top">
			<td>Date of Registration From</td>
			<td>:</td>
			<td><s:textfield type="text" size="10" name="dateOfRegistrationFrom" id="dateOfRegistrationFrom" class="tcal" cssStyle="width:130pt"/></td>
			<td></td>
			<td>Date of Registration To</td>
			<td>:</td>
			<td><s:textfield type="text" size="10" name="dateOfRegistrationTo" id="dateOfRegistrationTo" class="tcal" cssStyle="width:130pt"/></td>
		</tr>
		<tr valign="top">
			<td>Date of Disposal From</td>
			<td>:</td>
			<td><s:textfield type="text" size="10" name="dateOfDisposalFrom" id="dateOfDisposalFrom" class="tcal" cssStyle="width:130pt"/></td>
			<td></td>
			<td>Date of Disposal To</td>
			<td>:</td>
			<td><s:textfield type="text" size="10" name="dateOfDisposalTo" id="dateOfDisposalTo" class="tcal" cssStyle="width:130pt"/></td>
		</tr>
		<%-- <tr valign="top">
		<td>Exclude IA</td>
		<td>:</td>
		<td><s:checkbox name="petitions" id="petitions" theme="simple"></s:checkbox></td>
		</tr> --%>
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
<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
function reportWindow(url) {
	winddd = window.open(url,"report",'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no');
	winddd.focus();
}
/* $(document).ready(function() {
	
	$("input[name='searchbutton']").click(function(){
		   
		if($('#refPetitionTypeId').val()=="" && $('#petitionNumber').val()=="" && $('#petitionYear').val()=="" && $('#petitionerName').val()=="" && $('#subject').val()=="")
		{
			alert("Please select any one field.");
			return false;
		}
	});
}); */

</script>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:form theme="simple" name="communicationTypeSearchCase" action="communicationTypeSearchCase">
	<table border="0">
		<tr>
			<th colspan="10" class="mainheading">ROP/ORDER Search</th>
		</tr>
		<tr valign="top">
			<td width="20%">Petition Type</td>
			<td width="1%">:</td>
			<td width="28%">
				<s:select list="refPetitionTypeList" name="refPetitionTypeId" id="refPetitionTypeId" listKey="id" listValue="petitionTypeCode+'  '+petitionType" headerKey="" headerValue="-- Select --" cssStyle="width:150pt"/>
			</td>
			<td width="2%"></td>
			<td width="20%">Number</td>
			<td width="1%">:</td>
			<td width="28%"><s:textfield type="text" size="24" name="petitionNumber" id="petitionNumber"/></td>
		</tr>
		<tr valign="top">
			<td>Year</td>
			<td>:</td>
			<td colspan="2"><s:select  name="petitionYear" id="petitionYear" list="yearList" headerValue="- Select -" headerKey=""  cssStyle="width:150pt"/></td>
			<td>Petitioner Name</td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="petitionerName" id="petitionerName"/></td>
			<td></td>
			<%-- <td>Orders</td>
			<td>:</td>
			<td colspan="2"><s:select  name="petitionYear" id="petitionYear" list="yearList" headerValue="- Select -" headerKey=""  cssStyle="width:150pt"/></td> --%>
		</tr>
		<%-- <tr valign="top">
			<td>Petitioner Name</td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="petitionerName" id="petitionerName"/></td>
			<td></td>
			<td>Respondent Name</td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="respondentName" id="respondentName"/></td>
		</tr> --%>
		<%-- <tr valign="top">
			<td>Status</td>
			<td>:</td>
			<td><s:select list="refStatusList" name="petitionStatusId" id="petitionStatusId" listKey="id" listValue="statusName" headerKey="" headerValue="-- Select --" cssStyle="width:150pt"/></td>
			<td></td>
			<td>Asset Name</td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="assetName" id="assetName"/></td>
		</tr> --%>
		<tr valign="top">
			<td>Communication Type(For Example:-ROP,Orders,etc..)</td>
			<td>:</td>
		    <td colspan="2"><s:select list="descriptionList" name="refDocumentId" id="refDocumentId" listKey="id" listValue="documentName" headerValue="-- Select --" headerKey="" cssStyle="width:150pt"/></td>
		    <%-- <td colspan="2"><s:select label="descriptionList" headerKey="-1"  headerValue="-- Select --" list="descriptionList" name="cercPetitionId"></s:select> --%>
			<%-- <td colspan="2"><s:textfield type="text" size="24" name="description" id="description"/></td> --%>
			<td>Subject</td>
			<td>:</td>
			<td colspan="2"><s:textfield type="text" size="24" name="subject" id="subject"/></td>
		</tr>
		
		<tr valign="top">
			
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
		<tr valign="top">
			<td>Date of Hearing From</td>
			<td>:</td>
			<td><s:textfield type="text" size="10" name="dateOfHearing" id="dateOfHearing" class="tcal" cssStyle="width:130pt"/></td>
			<td></td>
			<td>Date of Hearing To</td>
			<td>:</td>
			<td><s:textfield type="text" size="10" name="dateOfHearing" id="dateOfHearing" class="tcal" cssStyle="width:130pt"/></td>
			
		</tr> 
		<tr valign="top">
			<td>Date of Uploading From</td>
			<td>:</td>
			<td><s:textfield type="text" size="10" name="updatedOn" id="updatedOn" class="tcal" cssStyle="width:130pt"/></td>
			<td></td>
			<td>Date of Uploading To</td>
			<td>:</td>
			<td><s:textfield type="text" size="10" name="updatedOn" id="updatedOn" class="tcal" cssStyle="width:130pt"/></td>
			
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
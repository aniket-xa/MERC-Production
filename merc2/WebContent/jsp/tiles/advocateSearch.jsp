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
<s:form theme="simple" name="advocateSearchCase" action="advocateSearchCase">
	<table border="0">
		<tr>
			<th colspan="10" class="mainheading">Advocate Search</th>
		</tr>
		
		<tr valign="top">
			<td width="20%">Advocate Name</td>
			<td width="1%">:</td>
			<td width="28%">
				
				<s:select list="advocateList" listValue="userName" headerKey="" headerValue="-- Select --" cssStyle="width:150pt"/>
			</td>
		</tr>
		<tr valign="top">
			<td width="20%">Petition Type</td>
			<td width="1%">:</td>
			<td width="28%">
				<s:select list="refPetitionTypeList" name="refPetitionTypeId" id="refPetitionTypeId" listKey="id" listValue="petitionTypeCode+'  '+petitionType" headerKey="" headerValue="-- Select --" cssStyle="width:150pt"/>
			</td>
			<td width="2%"></td>
			<td width="20%">Petition Number</td>
			<td width="1%">:</td>
			<td width="28%"><s:textfield type="text" size="24" name="petitionNumber" id="petitionNumber"/></td>
		</tr>
		<%--<tr valign="top"></tr>
		<tr valign="top">
			 <td>Respondent Name</td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="petitionerName" id="petitionerName"/></td>
			<td></td>
			
		</tr>  --%>
		<tr valign="top">
			<td>Year</td>
			<td>:</td>
			<td colspan="2"><s:select  name="petitionYear" id="petitionYear" list="yearList" headerValue="- Select -" headerKey=""  cssStyle="width:150pt"/></td>
			<td>Petitioner Name</td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="petitionerName" id="petitionerName"/></td>
			<td></td>
			
			</tr>
		<tr valign="top">
			<td>Nature of Documents(For Example:-ROP,Orders,etc..)</td>
			<td>:</td>
		    <td colspan="2"><s:select list="descriptionList" name="refDocumentId" id="refDocumentId" listKey="id" listValue="documentName" headerValue="-- Select --" headerKey="" cssStyle="width:150pt"/></td>
		   
			<td>Subject</td>
			<td>:</td>
			<td colspan="2"><s:textfield type="text" size="24" name="subject" id="subject"/></td>
		</tr>
		<tr valign="top"></tr>
		<tr valign="top">
			<td>Date of Uploading From</td>
			<td>:</td>
			<td><s:textfield type="text" size="10" name="updatedOnFrom" id="updatedOnFrom" class="tcal" cssStyle="width:130pt"/></td>
			<td></td>
			<td>Date of Uploading To</td>
			<td>:</td>
			<td><s:textfield type="text" size="10" name="updatedOnTo" id="updatedOnTo" class="tcal" cssStyle="width:130pt"/></td>
			
		</tr> 
		<tr><td colspan="7"></td></tr>
		<tr align="right">
			<td colspan="7">
				<input type="submit" name="searchbutton" id="searchbutton" value="Search" class="formbutton" onclick="return searchRelatedCase();" />
				<input type="reset" name="resetbutton" id="resetbutton" value="Reset" class="formbutton"/>
				
			</td>	
		</tr>
	</table>	
	<s:token/>	
</s:form>
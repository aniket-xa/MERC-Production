<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">
	function identicalCaseDetails(){
		document.relatedCaseDetails.action="identicalCaseDetails";
		document.relatedCaseDetails.submit();
	}
	
	function filingAttachmentDetails(){
		document.relatedCaseDetails.action="filingAttachmentDetails";
		document.relatedCaseDetails.submit();
	}      	
</script>
<!--<s:include value="/jsp/tiles/tabs.jsp"></s:include>
-->
<table border = "0">
	<tr>
		<th class="mainheading">
			Search
		</td>
	<tr>
	<tr>
		<td>
			<s:include value="/jsp/global/searchEfiledPetition.jsp"></s:include>
		</td>
	<tr>
</table>	

<s:form theme="simple" name="filingTechnicalValidation">
	<table border = "0">
		<tr>
			<th colspan="7">Technical Validation</th>
		</tr>
		<tr class="subheading">
			<td colspan="7">Petition Details</td>
		</tr>
		<tr>
			<td width="20%">Diary Number</td>
			<td width="1%">:</td>
			<td width="28%"></td>
			<td width="2%"></td>
			<td width="20%">Petition Number</td>
			<td width="1%">:</td>
			<td width="28%"></td>					
		</tr>
		<tr>
			<td>Petition Type</td>
			<td>:</td>
			<td></td>
			<td></td>
			<td>Petitioner Name</td>
			<td>:</td>
			<td>
				<select name="partyId"  id="partyId" style="width:142pt">
				</select>
			</td>								
		</tr>
		<tr>
			<td>Subject</td>
			<td>:</td>
			<td colspan="5"></td>								
		</tr>
		<tr class="subheading">
			<td colspan="7">Details</td>
		</tr>
		<tr>
			<td>Reply in response to TV dated</td>
			<td>:</td>
			<td colspan="5">
				<input type="text" name="tvDate"  id="tvDate" class="tcal" value="" />
			</td>								
		</tr>
		<tr>
			<td>Time allowed by commission</td>
			<td>:</td>
			<td colspan="5">
				<input type="text" name="timeAllowed"  id="timeAllowed" size="22" />
			</td>								
		</tr>
		<tr>
			<td>Date of filing TV</td>
			<td>:</td>
			<td colspan="5">
				<input type="text" name="tvFilingDate"  id="tvFilingDate" class="tcal" value="" />
			</td>								
		</tr>
		<tr>
			<td>Filed within permitted time</td>
			<td>:</td>
			<td colspan="5">
				<input type="radio" name="isWithinTime"  id="isWithinTime" value="Y" checked/>Yes
				<input type="radio" name="isWithinTime"  id="isWithinTime" value="N" />No
			</td>								
		</tr>
		<tr class="subheading" >
			<td colspan="7">Attachment</td>
		</tr>
		<tr>
			<td>Attach Document</td>
			<td>:</td>
			<td colspan="5">
				<select name="refDocumentId" id="refDocumentId" style="width:80pt">
					<option>Technical Validation</option>					
				</select>&nbsp;&nbsp;
				<input type="file"/>
				&nbsp;&nbsp;No. of Pages&nbsp;
				<input type="text" name="noOfPages"  id="noOfPages" size="10" />
				&nbsp;&nbsp;Add More&nbsp;&nbsp;
			</td>						
		</tr>
		<tr>
			<td colspan="7" align="right"><input type="submit" id="searchbutton" value="Save" class="formbutton" />&nbsp;&nbsp;<input type="submit" id="searchbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;<input type="submit" id="searchbutton" value="Cancel" class="formbutton" /></td>
		</tr>
	</table>
</s:form>	
            	
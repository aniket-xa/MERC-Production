<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
	$(document).ready(function() {
     
		$(".petitionDetails").hide();
		 
		$('input[name="searchbutton"]').on('click',function () {
			$(".petitionDetails").show();			
		});
	});  
	
	      	
</script>
<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Initial Scrutiny List</th>
		</tr>
		<tr>
			<td colspan="7">
				<s:include value="/jsp/global/searchEfiledPetition.jsp"></s:include>
			</td>
		</tr>
</table>		
<s:form theme="simple" name="filingreplyCommentsList">
	<table border = "0">
		<tr class="subheading petitionDetails">
			<td colspan="7" align="center">Petition No. : TT / 23 / 2015</td>									
		</tr>
		<tr class="subheading petitionDetails">
			<td colspan="7">Petition Details</td>
		</tr>
		<tr class="petitionDetails">
			<td width="20%">Diary Number</td>
			<td width="1%">:</td>
			<td width="28%"></td>
			<td width="2%"></td>
			<td width="20%">Petition Number</td>
			<td width="1%">:</td>
			<td width="28%"></td>					
		</tr>
		<tr class="petitionDetails">
			<td>Petitioner Name</td>
			<td>:</td>
			<td></td>
			<td></td>
			<td>Respondent Name</td>
			<td>:</td>
			<td></td>								
		</tr>
		<tr class="petitionDetails">
			<td>Petition Type</td>
			<td>:</td>
			<td colspan="5"></td>											
		</tr>
		<tr class="petitionDetails">
			<td>Subject</td>
			<td>:</td>
			<td colspan="5"></td>								
		</tr>
		<!--<tr class="petitionDetails">
			<td>Last Hearing Date</td>
			<td>:</td>
			<td><input type="text" name="lastHearingDate"  id="lastHearingDate" class="tcal" value="" /></td>
			<td></td>
			<td>Next Hearing Date</td>
			<td>:</td>
			<td><input type="text" name="lastHearingDate"  id="lastHearingDate" class="tcal" value="" /></td>											
		</tr>
		
		--><tr class="petitionDetails">
			<td colspan="7">
				<table border = "0">
					<tr class="subheading">
						<td width="4%">#</td>
						<td width="21%">Description</td>
						<td width="12%">Intimated On</td>
						<td width="15%">Time Allowed</td>
						<td width="15%">Removed in Time</td>
						<td width="12%">Removed On</td>
						<td width="12%">By</td>
						<td width="10%">Attachment</td>
																	
					</tr>
					<tr>
						<td style="color: #EC1C1C"><s:a action="filingRemovingDeficiencyDetails">1</s:a></td>
						<td style="color: #EC1C1C">Description Text .....</td>
						<td style="color: #EC1C1C">07-02-2015</td>
						<td style="color: #EC1C1C">30 Days</td>
						<td style="color: #EC1C1C"></td>
						<td style="color: #EC1C1C"></td>
						<td style="color: #EC1C1C">Cerc</td>
						<td style="color: #EC1C1C"><a href="#">view</a></td>
												
					</tr>
					<tr>
						<td></td>
						<td style="color: #106610">Description</td>
						<td style="color: #106610"></td>
						<td style="color: #106610"></td>
						<td style="color: #106610">Yes</td>
						<td style="color: #106610">25-02-2015</td>
						<td style="color: #106610">NTPC</td>
						<td style="color: #106610"><a href="#">view</a></td>
					</tr>
					
				</table>
			</td>
		</tr>	
		<!--<tr class="petitionDetails">
			<td align="right" colspan="7"><input type="submit" id="deletebutton" value="Delete" class="formbutton" />&nbsp;&nbsp;<input type="submit" id="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;<input type="submit" id="cancelbutton" value="Cancel" class="formbutton" /></td>
		</tr>
	--></table>
</s:form>	
            	
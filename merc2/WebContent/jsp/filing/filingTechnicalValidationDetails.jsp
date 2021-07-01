<%@ taglib uri="/struts-tags" prefix="s"%>


<s:form theme="simple" name="filingSubmission">
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Removing Deficiencies</th>
		</tr>
		<tr class="subheading">
			<td colspan="7" align="center">Petition No. : TT / 23 / 2015</td>									
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
		<tr class="petitionDetails">
			<td>Petitioner Name</td>
			<td>:</td>
			<td></td>
			<td></td>
			<td>Respondent Name</td>
			<td>:</td>
			<td></td>								
		</tr>
		<tr>
			<td>Petition Type</td>
			<td>:</td>
			<td colspan="5"></td>											
		</tr>
		<tr>
			<td>Subject</td>
			<td>:</td>
			<td colspan="5"></td>								
		</tr>
		<tr class="subheading">
			<td colspan="7">Technical Validation Deficiency Details</td>
		</tr>
		<tr>
			<td>Reply in response to TV dated</td>
			<td>:</td>
			<td >
				<input type="text" name="tvDate"  id="tvDate" class="tcal" value="" />
			</td>
			<td></td>
			<td>Time allowed by commission</td>
			<td>:</td>
			<td >
				<input type="text" name="timeAllowed"  id="timeAllowed" size="22" />
			</td>								
		</tr>		
		<tr>
			<td colspan="7">
				<table>
					<tr class="subheading">
						<td width="4%">#</td>
						<td width="76%">Technical Validation Deficiency Description</td>
						<td width="20%">Deficiency Removed</td>						
					</tr>
					<tr>
						<td>1</td>
						<td>Technical Validation Deficiency Description ...... ..... .... .. </td>
						<td>
							<input type="radio" name="defectRemoved" id="defectRemoved" value="Y"/>Yes
							<input type="radio" name="defectRemoved" id="defectRemoved" value="N" checked/>No
						</td>						
					</tr>
					<tr>
						<td>2</td>
						<td>Technical Validation Deficiency Description ...... ..... .... .. </td>
						<td>
							<input type="radio" name="defectRemoved" id="defectRemoved" value="Y"/>Yes
							<input type="radio" name="defectRemoved" id="defectRemoved" value="N" checked/>No
						</td>						
					</tr>
					<tr>
						<td>3</td>
						<td>Technical Validation Deficiency Description ...... ..... .... .. </td>
						<td>
							<input type="radio" name="defectRemoved" id="defectRemoved" value="Y"/>Yes
							<input type="radio" name="defectRemoved" id="defectRemoved" value="N" checked/>No
						</td>						
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>Date of filing TV</td>
			<td>:</td>
			<td >
				<input type="text" name="tvFilingDate"  id="tvFilingDate" class="tcal" value="" />
			</td>
			<td></td>
			<td>Filed within permitted time</td>
			<td>:</td>
			<td></td>								
		</tr>
		<tr>
			<td>Description</td>
			<td>:</td>
			<td colspan="5">
				<textarea name="description"  id="description" style="width:500pt"  cols="1000"></textarea>
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
					<option>- Select -</option>
					<option>Document Type - 1</option>					
					<option>Document Type - 2</option>
				</select>&nbsp;&nbsp;
				<input type="file"/>
				&nbsp;&nbsp;No. of Pages&nbsp;
				<input type="text" name="noOfPages"  id="noOfPages" size="10" />
				&nbsp;&nbsp;Add More&nbsp;&nbsp;
			</td>						
		</tr>
		<!--<tr class="subheading" >
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
		--><tr>
			<td colspan="7" align="right"><input type="submit" id="searchbutton" value="Save" class="formbutton" />&nbsp;&nbsp;<input type="submit" id="searchbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;<input type="submit" id="searchbutton" value="Cancel" class="formbutton" /></td>
		</tr>
	</table>
</s:form>	
            	
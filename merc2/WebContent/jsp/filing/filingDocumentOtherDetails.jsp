<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">
	function relatedCaseDetails(){
		document.filingAttachmentDetails.action="relatedCaseDetails";
		document.filingAttachmentDetails.submit();
	}
	
	function filingFeeDetails(){
		document.filingAttachmentDetails.action="filingFeeDetails";
		document.filingAttachmentDetails.submit();
	}
	
	function filingSummary(){
		document.filingAttachmentDetails.action="filingSummary";
		document.filingAttachmentDetails.submit();
	}      	
</script>
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="filingAttachmentDetails" >
<s:hidden name="filingBeanId"/>
	<table border = "0">
		<tr>
			<th colspan="3" class="mainheading">Filing - Attachments (In Word / Excel)</th>
		</tr>
		<tr class="subheading">
			<td colspan="3" align="center">Petition Reference No. : 98767 / 2015</td>									
		</tr>
		<tr>
			<td>Petition</td>
			<td>:</td>
			<td>
				<input type="file"/>
				&nbsp;&nbsp;No. of Pages&nbsp;
				<input type="text" name="noOfPages"  id="noOfPages" size="10" />
				&nbsp;&nbsp;Add More&nbsp;&nbsp;
			</td>						
		</tr>
		<tr>
			<td>Vakalatnama</td>
			<td>:</td>
			<td>
				
				<input type="file"/>
				&nbsp;&nbsp;No. of Pages&nbsp;
				<input type="text" name="noOfPages"  id="noOfPages" size="10" />
				&nbsp;&nbsp;Add More&nbsp;&nbsp;
			</td>						
		</tr>
		<tr>
			<td>Affidavit</td>
			<td>:</td>
			<td>
				<input type="file"/>
				&nbsp;&nbsp;No. of Pages&nbsp;
				<input type="text" name="noOfPages"  id="noOfPages" size="10" />
				&nbsp;&nbsp;Add More&nbsp;&nbsp;				
			</td>						
		</tr>
		<tr>
			<td>Forms</td>
			<td>:</td>
			<td>
				<input type="file"/>
				&nbsp;&nbsp;No. of Pages&nbsp;
				<input type="text" name="noOfPages"  id="noOfPages" size="10" />
				&nbsp;&nbsp;Asset&nbsp;
				<select name="assetId"  id="assetId" style="width:60pt">
					<option>Asset 1</option>
				</select>	
				&nbsp;&nbsp;Add More&nbsp;&nbsp;			
			</td>						
		</tr>
		<tr>
			<td>Annexure</td>
			<td>:</td>
			<td>
				<input type="file"/>
				&nbsp;&nbsp;No. of Pages&nbsp;
				<input type="text" name="noOfPages"  id="noOfPages" size="10" />
				&nbsp;&nbsp;Add More&nbsp;&nbsp;
			</td>						
		</tr>
		<tr>
			<td>Any Other (Please Specify)</td>
			<td>:</td>
			<td>
				<input type="text" name="noOfPages"  id="noOfPages" size="18" />
				<input type="file"/>
				&nbsp;&nbsp;No. of Pages&nbsp;
				<input type="text" name="noOfPages"  id="noOfPages" size="8" />
				&nbsp;&nbsp;Add More&nbsp;&nbsp;
			</td>						
		</tr>
		<tr>
			<td><input type="submit" id="searchbutton" value="Submit" class="formbutton" onClick="filingSummary()" /></td>
			<td colspan="2" align="right"><input type="button" id="searchbutton" value=" &lt;&lt; Previous" class="formbutton" onClick="relatedCaseDetails()"/>&nbsp;&nbsp;<input type="button" id="searchbutton" value="Next &gt;&gt;" class="formbutton" onClick="filingFeeDetails()"/>&nbsp;&nbsp;<input type="submit" id="searchbutton" value="Upload" class="formbutton" />&nbsp;&nbsp;<input type="submit" id="searchbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;<input type="submit" id="searchbutton" value="Cancel" class="formbutton" /></td>
		</tr>
	</table>
</s:form>	

            	
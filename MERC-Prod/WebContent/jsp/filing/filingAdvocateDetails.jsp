<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
</script>

<script type="text/javascript">
	$(document).ready(function() {
     
		$("input[name='savebutton']").click(function(){
			var fileName = $('#attachedDocument').val().toLowerCase();
			var fUpload=document.getElementsByName("fileUpload");
			var fUploadName=document.getElementsByName("fileUploadName"); 
			for (var i = 0; i < fUpload.length; i++)
			{
				var fileExtension = (fUpload[i].value).substring((fUpload[i].value).lastIndexOf('.') + 1).toLowerCase();
				 if ((fileExtension!="jpeg" && fileExtension!="jpg" && fileExtension!="pdf") || (fUpload[i].value=="" || fUploadName[i].value==""))
				{
					alert("Please select / upload document.")
					$('input:submit').attr("disabled", false);
					return false
				}
				
				//else if 
			}
			if($('#cercUserAdvocateId').val()=="")
			{
				alert("Please select advocate.");
				return false;
			}
					
		
			else
			{
				document.filingAdvocateDetails.action="filingAdvocateDetailsSave";
    			document.filingAdvocateDetails.submit();
			}
		});
		
	});
</script>

<s:include value="/jsp/tiles/tabs.jsp"></s:include>
	<s:form theme="simple" name="filingAdvocateDetails" enctype="multipart/form-data" method="post">
	<s:hidden name="filingBeanId"/>
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Advocate Details</th>
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
				<td colspan="7" align="center">Reference No. : <s:property value="referenceNumberDisplay"/></td>									
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
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>
			<td width="2%"></td>
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>					
		</tr>
		<tr valign="top">
			<td>Select Party<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<s:select list="cercPetitionPartyDetailsList" listKey="id" listValue="partyName" name="cercPetitionPartyDetailsId" id="cercPetitionPartyDetailsId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:242pt"/>
			</td>
		</tr>
		<tr valign="top">
			<td>Advocate<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<s:select list="cercUserList" listKey="id" listValue="userName" name="cercUserAdvocateId" id="cercUserAdvocateId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:242pt"/>
			</td>
		</tr>
		<tr valign="top">
			<td>Upload Vakalatnama<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<s:select list="refDocumentList" name="fileUploadName" listKey="id" listValue="documentName" id="refDocumentId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:142pt"/>
				&nbsp;<s:file name="fileUpload" id="attachedDocument" label="Select a File to upload" size="40"/>
				<span class="tooltip"><!-- (pdf / jpeg files only) -->(pdf,doc,excel,jpeg files only)</span>
				<br/>
				<br/>
				<span class="tooltip">Note : Consolidated, uploaded documents size should not exceed 300 MB.</span>	
				<br/>
				<br/>	
				<span class="tooltip">Note : File name should not contain any space.</span>
			</td>				
		</tr>
		<tr><td colspan="7"></td></tr>
		<tr><td colspan="7" align="right">
		<input type="submit" id="savebutton" name="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp;
		<input type="submit" id="searchbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
		<input type="submit" id="searchbutton" value="Cancel" class="formbutton" />
		</td></tr>
	</table>
	<s:token/>
</s:form>	
            	
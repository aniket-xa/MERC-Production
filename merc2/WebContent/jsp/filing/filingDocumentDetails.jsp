<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">
$(document).ready(function() 
		{
			$(".delete").hide();
			$(".deletePet").hide();
			$(".deletePetWord").hide();
			$(".deleteForm").hide();
			$(".deleteMemo").hide();
			$(".deleteAff").hide();
			$(".deleteFees").hide();
			$('input[name="uploadbutton"]').click(function()
			{
				var petition = $('#petitionUpload').val().toLowerCase();
				var petitionFileExtension = petition.substring(petition.lastIndexOf('.') + 1);
				
				var petitionOth = $('#petitionUploadOther').val().toLowerCase();
				var petitionOthFileExtension = petitionOth.substring(petitionOth.lastIndexOf('.') + 1);
				console.log(petitionOth);
				console.log(petitionOthFileExtension);
				var formsOth = $('#formsUploadOther').val().toLowerCase();
				var formsOthFileExtension = formsOth.substring(formsOth.lastIndexOf('.') + 1);
			
				var vakalatnama = $('#vakalatnamaUpload').val().toLowerCase();
				var vakalatnamaFileExtension = vakalatnama.substring(vakalatnama.lastIndexOf('.') + 1);
			
				/* var formsOth = $('#petitionUploadOther').val().toLowerCase();
				var formsOthFileExtension = formsOth.substring(formsOth.lastIndexOf('.') + 1);
				console.log(formsOth);
				console.log(formsOthFileExtension); */
				var affidavit = $('#affidavitUpload').val().toLowerCase();
				var affidavitFileExtension = affidavit.substring(affidavit.lastIndexOf('.') + 1); 
			
				
				var forms = $('#formsUpload').val().toLowerCase();
				var formsFileExtension = forms.substring(forms.lastIndexOf('.') + 1);
			
				/* var annexure = $('#annexureUpload').val().toLowerCase();
				var annexureFileExtension = annexure.substring(annexure.lastIndexOf('.') + 1); 
				console.log(annexure);
				console.log(annexureFileExtension);
			 */
				
				/* var vakalatnamaOth = $('#vakalatnamaUploadOther').val().toLowerCase();
				var vakalatnamaOthFileExtension = vakalatnamaOth.substring(vakalatnamaOth.lastIndexOf('.') + 1); */
				
				/* var affidavitOth = $('#affidavitUploadOther').val().toLowerCase();
				var affidavitOthFileExtension = affidavitOth.substring(affidavitOth.lastIndexOf('.') + 1); */
				
				
				/* var annexureOth = $('#annexureUploadOther').val().toLowerCase();
				var annexureOthFileExtension = annexureOth.substring(annexureOth.lastIndexOf('.') + 1); */
				
				if(petition.length<1)
				{  console.log(petition.length);
					alert("Please attach petition document.");
					return false;
				}
				if(petitionOth.length<1)
				{ console.log(petitionOth.length);
					alert("Please attach word document.");
					return false;
				}
				if(affidavit.length<1)
				{    console.log(affidavit.length);
					alert("Please attach affidavit document.");
					return false;
				}
				
				
				if((petitionFileExtension!="" && petitionFileExtension!="pdf")  || (vakalatnamaFileExtension!="" && vakalatnamaFileExtension!="pdf") || (affidavitFileExtension!="" && affidavitFileExtension!="pdf") || (formsFileExtension!="" && formsFileExtension!="pdf"))
				{ console.log("pdf");
					alert('Please attach valid document.');
					return false;
				} 
				if(petitionOthFileExtension!="" && petitionOthFileExtension!="docx" && petitionOthFileExtension!="doc") 
				{ 
					console.log(petitionOthFileExtension+"1");
					alert('Please attach document in Word format.');
					return false;
				}
				
				 if(formsOth!="" ) 
				{
					 if(formsOthFileExtension!="" && formsOthFileExtension!="xls" || formsOthFileExtension!="xlsx") 
						{
							alert('Please attach valid Excel document.');
							return false;
						}
				}
				
				
				
				
				var Other = $('#fileUpload').val().toLowerCase();
				var OtherFileExtension = Other.substring(Other.lastIndexOf('.') + 1);
				var fUpload=document.getElementsByName("fileUpload");
				var fUploadName=document.getElementsByName("fileUploadName");
				for (var i = 0; i < fUpload.length; i++) 
				{
					if (fUpload.length>1 && (fUpload[i].value=="" || fUploadName[i].value==""))
					{
						alert("Please select document name or file to upload.")
						return false
					}
				}	
			
				/* if($('#petitionUpload').val()=="" && $('#petitionUploaded').val()=="false")
				{
					alert("Please attach petition document.");
					return false;
				}
				if($('#petitionUploadOther').val()=="" && $('#petitionUploaded').val()=="false")
				{
					alert("Please attach word document.");
					return false;
				} */
				
				
				/* else if(vakalatnamaOthFileExtension!="" && vakalatnamaOthFileExtension!="doc" && vakalatnamaOthFileExtension!="docx" && vakalatnamaOthFileExtension!="xls" && vakalatnamaOthFileExtension!="xlsx") 
				{
					alert('Please attach valid document.');
					return false;
				} */
				
				/* else if(affidavitOthFileExtension!="" && affidavitOthFileExtension!="doc" && affidavitOthFileExtension!="docx" && affidavitOthFileExtension!="xls" && affidavitOthFileExtension!="xlsx") 
				{
					alert('Please attach valid document.');
					return false;
				} */
				
				

				/* else if(annexureOthFileExtension!="" && annexureOthFileExtension!="doc" && annexureOthFileExtension!="docx" && annexureOthFileExtension!="xls" && annexureOthFileExtension!="xlsx") 
				{
					alert('Please attach valid document.');
					return false;
				}  */
				/* else if(OtherFileExtension!="" && OtherFileExtension!="pdf" && OtherFileExtension!="jpeg" && OtherFileExtension!="jpg" && OtherFileExtension!="doc" && OtherFileExtension!="docx" && OtherFileExtension!="xls" && OtherFileExtension!="xlsx")
				{
					alert('Please attach valid document.');
					return false;
								
				} */
			});
		});

	 	
    
    
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
	
	function fidAdd() {
		$('.fidRepeat:first').clone().insertAfter(".fidRepeat:last").find("#fileUpload").val("");
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
	
	function fidAddPetition() {
		$('.fidRepeatPetition:first').clone().insertAfter(".fidRepeatPetition:last").find("#petitionUpload").val("");
		var fidLength = $(".fidRepeatPetition").length;
		
		$( (".fidRepeatPetition") ).each(function(i) {
			if (i < (fidLength-1)) {
				$(".deletePet").show();
				$(".addPet").hide();
		   	}
		   	else {
		   		$("span.deletePet:last").hide();
		   		$("span.addPet:last").show();
		   	}
		});
	}
	
	function fidDeletePetition(e) {
		$(e).parents(".fidRepeatPetition").remove();		
	}
	
	function fidAddPetitionWord() {
		$('.fidRepeatPetitionWord:first').clone().insertAfter(".fidRepeatPetitionWord:last").find("#petitionUploadOther").val("");
		var fidLength = $(".fidRepeatPetitionWord").length;
		
		$( (".fidRepeatPetitionWord") ).each(function(i) {
			if (i < (fidLength-1)) {
				$(".deletePetWord").show();
				$(".addPetWord").hide();
		   	}
		   	else {
		   		$("span.deletePetWord:last").hide();
		   		$("span.addPetWord:last").show();
		   	}
		});
	}
	
	function fidDeletePetitionWord(e) {
		$(e).parents(".fidRepeatPetitionWord").remove();		
	}
	
	function fidForm() {
		$('.fidForm:first').clone().insertAfter(".fidForm:last").find("#formsUploadOther").val("");
		var fidLength = $(".fidForm").length;
		
		$( (".fidForm") ).each(function(i) {
			if (i < (fidLength-1)) {
				$(".deleteForm").show();
				$(".addForm").hide();
		   	}
		   	else {
		   		$("span.deleteForm:last").hide();
		   		$("span.addForm:last").show();
		   	}
		});
	}
	
	function fidFormDelete(e) {
		$(e).parents(".fidForm").remove();		
	}
	
	function fidMemo() {
		$('.fidMemo:first').clone().insertAfter(".fidMemo:last").find("#vakalatnamaUpload").val("");
		var fidLength = $(".fidMemo").length;
		
		$( (".fidMemo") ).each(function(i) {
			if (i < (fidLength-1)) {
				$(".deleteMemo").show();
				$(".addMemo").hide();
		   	}
		   	else {
		   		$("span.deleteMemo:last").hide();
		   		$("span.addMemo:last").show();
		   	}
		});
	}
	
	function fidMemoDelete(e) {
		$(e).parents(".fidMemo").remove();		
	}
	
	function fidAddAffidavit() {
		$('.fidAffidavit:first').clone().insertAfter(".fidAffidavit:last").find("#affidavitUpload").val("");
		var fidLength = $(".fidAffidavit").length;
		
		$( (".fidAffidavit") ).each(function(i) {
			if (i < (fidLength-1)) {
				$(".deleteAff").show();
				$(".addAff").hide();
		   	}
		   	else {
		   		$("span.deleteAff:last").hide();
		   		$("span.addAff:last").show();
		   	}
		});
	}
	
	function fidDeleteAffidavit(e) {
		$(e).parents(".fidAffidavit").remove();		
	}
	
	function fidAddFeesForm() {
		$('.fidFeesForm:first').clone().insertAfter(".fidFeesForm:last").find("#formsUpload").val("");
		var fidLength = $(".fidFeesForm").length;
		
		$( (".fidFeesForm") ).each(function(i) {
			if (i < (fidLength-1)) {
				$(".deleteFees").show();
				$(".addFees").hide();
		   	}
		   	else {
		   		$("span.deleteFees:last").hide();
		   		$("span.addFees:last").show();
		   	}
		});
	}
	
	function fidDeleteFeesForm(e) {
		$(e).parents(".fidFeesForm").remove();		
	}
	
</script>
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="filingDocumentDetails" action="uploadFile" method="post" enctype="multipart/form-data">
<s:hidden name="filingBeanId"/>
<s:hidden name="petitionUploaded" id="petitionUploaded"/>
	<table border = "0">
		<tr>
			<th colspan="4" class="mainheading">Filing - Attachments</th>
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
			<td width="30%"></td>
			<td width="1%"></td>
			<td width="39%"></td>
			<td width="29%"></td>
								
		</tr>
<!-- 		<tr class="subheading">
			<td colspan="2"></td>
			<td>In Pdf</td>
			<td>In Word / Excel</td>
												
		</tr>
 -->		
<%--  <s:if test="petitionUploaded==false"> --%>
 <tr class = "fidRepeatPetition">
			<td valign="top">Full Petition in PDF format(Including all annexures as per hardcopy submitted)<span class="required">*</span></td>
			<td valign="top">:</td>
			<td valign="top">
				<s:file name="petitionUpload" id="petitionUpload" onclick="resetInputBox(this);"></s:file>&nbsp;
				<span class="deletePet"><a href="#" onClick="fidDeletePetition(this);return false" title="Delete" class="tip">delete</a></span>								        	
					<span class="addPet"><a href="#" onClick="fidAddPetition();return false;" id="add-address">Add More</a></span>
			</td>
			<%-- <td valign="top">Petition in Word format
				<s:file name="petitionUploadOther" id="petitionUploadOther" onclick="resetInputBox(this);"></s:file>
			</td> --%>						
		</tr>
<%-- 		</s:if> --%>
		<tr class = "fidRepeatPetitionWord">
			<td valign="top">Petition in Word format<span class="required">*</span></td>
			<td valign="top">:</td>
			<td valign="top">
				<s:file name="petitionUploadOther" id="petitionUploadOther" onclick="resetInputBox(this);"></s:file>&nbsp;
				<span class="deletePetWord"><a href="#" onClick="fidDeletePetitionWord(this);return false" title="Delete" class="tip">delete</a></span>								        	
					<span class="addPetWord"><a href="#" onClick="fidAddPetitionWord();return false;" id="add-address">Add More</a></span>
			</td>
		</tr>
		
		<tr class = "fidForm">
			<td valign="top">Forms in Excel (For Tariff Petitions)</td>
			<td valign="top">:</td>
			<td valign="top">
				<s:file name="formsUploadOther" id="formsUploadOther" onclick="resetInputBox(this);"></s:file>&nbsp;		
				<span class="deleteForm"><a href="#" onClick="fidFormDelete(this);return false" title="Delete" class="tip">delete</a></span>								        	
					<span class="addForm"><a href="#" onClick="fidForm();return false;" id="add-address">Add More</a></span>	
			</td>
			<%-- <td valign="top">
				<s:file name="formsUploadOther" id="formsUploadOther" onclick="resetInputBox(this);"></s:file>
			</td> --%>						
		</tr>
		<tr class = "fidMemo">
			<td valign="top">Memo of Authorization</td>
			<td valign="top">:</td>
			<td valign="top">
				<s:file name="vakalatnamaUpload" id="vakalatnamaUpload" onclick="resetInputBox(this);"></s:file>&nbsp;
				<span class="deleteMemo"><a href="#" onClick="fidMemoDelete(this);return false" title="Delete" class="tip">delete</a></span>								        	
					<span class="addMemo"><a href="#" onClick="fidMemo();return false;" id="add-address">Add More</a></span>
			</td>
			<%-- <td valign="top">
				<s:file name="vakalatnamaUploadOther" id="vakalatnamaUploadOther" onclick="resetInputBox(this);"></s:file>
			</td> --%>						
		</tr>
<%-- 		 <s:if test="petitionUploaded==false"> --%>
		 <tr class = "fidAffidavit">
			<td valign="top">Affidavit<span class = "required">*</span></td>
			<td valign="top">:</td>
			<td valign="top">
				<s:file name="affidavitUpload" id="affidavitUpload" onclick="resetInputBox(this);"></s:file>&nbsp;
				<span class="deleteAff"><a href="#" onClick="fidDeleteAffidavit(this);return false" title="Delete" class="tip">delete</a></span>								        	
					<span class="addAff"><a href="#" onClick="fidAddAffidavit();return false;" id="add-address">Add More</a></span>		
			</td>
<!-- 			<td valign="top"> -->
<%-- 				<s:file name="affidavitUploadOther" id="affidavitUploadOther" onclick="resetInputBox(this);"></s:file> --%>
<!-- 			</td>						 -->
		</tr> 
<%-- 		</s:if> --%>
		<tr class = "fidFeesForm">
			<td valign="top">Fees Form</td>
			<td valign="top">:</td>
			<td valign="top">
				<s:file name="formsUpload" id="formsUpload" onclick="resetInputBox(this);"></s:file>&nbsp;
				<span class="deleteFees"><a href="#" onClick="fidDeleteFeesForm(this);return false" title="Delete" class="tip">delete</a></span>								        	
					<span class="addFees"><a href="#" onClick="fidAddFeesForm();return false;" id="add-address">Add More</a></span>
			</td>
			<%-- <td valign="top">
				<s:file name="formsUploadOther" id="formsUploadOther" onclick="resetInputBox(this);"></s:file>
			</td> --%>						
		</tr>
		<%-- <tr>
			<td valign="top">Forms in Excel (For Tariff Petitions)</td>
			<td valign="top">:</td>
			<td valign="top">
				<s:file name="formsUpload" id="formsUpload" onclick="resetInputBox(this);"></s:file>			
			</td>
			<td valign="top">
				<s:file name="formsUploadOther" id="formsUploadOther" onclick="resetInputBox(this);"></s:file>
			</td>						
		</tr> --%>
<%-- 		<tr>
			<td valign="top">Annexure</td>
			<td valign="top">:</td>
			<td valign="top">
				<s:file name="annexureUpload" id="annexureUpload" onclick="resetInputBox(this);"></s:file>
			</td>
			<td valign="top">
				<s:file name="annexureUploadOther" id="annexureUploadOther" onclick="resetInputBox(this);"></s:file>
			</td>						
		</tr>
 --%>		<tr>
			<td valign="top">Add More</td>
			<td valign="top">:</td>
			<td valign="top" colspan="2">
			<s:push value="refDocumentList"></s:push>
				<span class="fidRepeat">
					<s:select list="refDocumentList" name="fileUploadName" listKey="id" listValue="documentName" id="fileUploadName" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:120pt"/>
					&nbsp;<s:textfield type="text" size="24" name="documentDescription" id="documentDescription"/>
					&nbsp;<s:file name="fileUpload" id="fileUpload" label="Select a File to upload" cssStyle="width:130pt" onclick="resetInputBox(this);"/>
					&nbsp;<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>								        	
					<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
						
				</span>
				<br/>
				<span class="tooltip">(pdf / jpeg files only)</span>
				<br/>
				<br/>
				<span class="tooltip">Note : Each uploaded document's size should not exceed 300 MB.</span>
				<br/>
				<br/>	
				<span class="tooltip">Note : File name should not contain any space.</span>
			</td>									
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="submit" id="uploadbutton" name="uploadbutton" value="Upload" class="formbutton" />
				&nbsp;&nbsp;
				<input type="reset" id="resetbutton" value="Reset" class="formbutton" />
				&nbsp;&nbsp;
				<input type="submit" id="cancelbutton" value="Cancel" class="formbutton" />
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>
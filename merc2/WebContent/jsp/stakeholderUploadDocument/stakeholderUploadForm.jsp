
<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
	$(document).ready(function() {
		$(".delete").hide();
		$("input[name='submitbutton']").click(function()
		{
			var fUpload=document.getElementsByName("fileUpload");
			//var fUploadName=document.getElementsByName("fileUploadName");
			for (var i = 0; i < fUpload.length; i++) 
					{
						var fileExtension = (fUpload[i].value).substring((fUpload[i].value).lastIndexOf('.') + 1).toLowerCase();
						/* if (fileExtension!="pdf" || fUpload[i].value=="" || fUploadName[i].value=="") */
						if ((fileExtension!="pdf" && fileExtension!="doc" &&  fileExtension!="xls" && fileExtension!="xlsx" && fileExtension!="docx" ) || fUpload[i].value=="")
						{
							alert("Please select / upload document.")
							return false
						}
					}
			
			 if($('#refRegulationId').val()=="")
				{
					alert("Please select Regulation.")
					$('#refRegulationId').focus();
					return false;
				}
		
				}); 	
	});

	function fidAdd() {
		$('.fidRepeat:first').clone().insertAfter(".fidRepeat:last").find("#attachedDocument").val("");
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
	
    function chkValidation()
	{
		/* if($('#rejoinderCopyToReplies').prop('checked')==true)
		{
			for (var i = 0; i < lisize; i++) 
			{
				if(document.getElementById("cercPetitionReplyBeanList["+i+"].copyTo").checked)
				{
					return true;
					break;
				}	
			}
			alert("Please check at least one checkbox");
			return false; */
			
		//}
		
    	 if ((document.form.refRegulationType.value=="") || (document.form.description.value=="")||(document.form.documentDescription.value=="")){
        alert("You must fill in all of the required fields!")
        return false
    }
    else
        return true
} 
</script>
<%-- <s:if test="hasActionErrors()">
        <div class="error">
            <s:actionerror />
        </div>
</s:if> --%>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:form theme="simple" name="stakeholderUploadForm"
	action="stakeholderUploadDocumentSubmit"  method="post" 
	enctype="multipart/form-data">
	<%-- <s:hidden name="pleadingBeanId" /> --%>
	<%-- <s:hidden name="pleadingId" /> --%>
	<table border="0">
		<tr>
			<th colspan="7" class="mainheading">MERC Users Correspondence</th>
		</tr>
		<tr valign="top">
		<tr class="subheading">
			<td colspan="7">Correspondence Description</td>
		</tr>
		<tr>
			<td>Description<%-- <span class="required">*</span> --%></td>
			<td>:</td>
			<td colspan="5"><s:textfield name="description"
					cssStyle="width:505pt" /></td>
		</tr>
		<%-- <tr valign="top">
			<td>Regulation<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
			<s:select list="refRegulationList" name="refRegulationType" id="refRegulationId" listKey="id" listValue="regulationDescription" headerKey="" headerValue="- Select -" multiple = "true" value="refRegulation"/>
			<select name="refRegulation" multiple="multiple" style="width:510pt" id="refRegulationId">
        <s:iterator value="refRegulationList">
            <option value="<s:property value="id"/>" title="<s:property value="regulationDescription"/>">
                <s:property value="regulationDescription"/>
            </option>
        </s:iterator>
    </select>
			<br><span class="tooltip">(Use "Ctrl" key to select multiple.)</span> 
			</td>
		</tr>  --%>
		
		<tr>
			<td>Regulation<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<s:select list="refRegulationList" name="refRegulationType" id="refRegulationId" listKey="id" listValue="regulationDescription" headerKey="" headerValue="- Select -" cssStyle="width:600pt"/>
			</td>								
		</tr>
		
		<tr class="subheading">
			<td colspan="7">Documents</td>
		</tr>
		<tr valign="top">
			<td>Document Description<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<div class="fidRepeat">
					<%-- <s:select list="refDocumentList" name="fileUploadName" listKey="id"
						listValue="documentName" id="refDocumentId" theme="simple"
						headerValue="- Select -" headerKey="" cssStyle="width:142pt" /> --%>
					
					<s:textfield type="text" size="24" name="documentDescription"
						id="documentDescription"/>
					&nbsp;
					<s:file name="fileUpload" id="attachedDocument"
						label="Select a File to upload" size="40" />
					<span class="delete"><a href="#"
						onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>
					<span class="add"><a href="#"
						onClick="fidAdd();return false;" id="add-address">Add More</a></span>
				</div> <span class="tooltip">(pdf,doc,excel files only)</span> <br /> <br /> <span
				class="tooltip">Note : Consolidated, uploaded documents size
					should not exceed 300 MB.</span>
			</td>
		</tr>
		<tr>
			<td colspan="7" align="right"><input type="submit"
				id="submitbutton" name="submitbutton" value="Submit"
				class="formbutton"/>&nbsp;&nbsp;
				<input type="reset" id="resetbutton" value="Reset"
				class="formbutton" />&nbsp;&nbsp; <s:submit id="cancelbutton"
					name="cancelbutton" value="Cancel" class="formbutton"
					action="welcome" /></td>
		</tr>
	</table>
	<s:token />
</s:form>
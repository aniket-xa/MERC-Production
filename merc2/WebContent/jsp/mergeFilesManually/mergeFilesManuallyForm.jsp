<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="/struts-dojo-tags" prefix="sx"%>
 
<html>
  <head>
  
  <s:head/>
  <sx:head/>
  </head>

<script type="text/javascript">
	
	$(document).ready (function() {
		$(".delete").hide();
		$("input[name='savebutton']").click(formValidationMulti);
		
		function formValidationMulti(e)
		{
			if($(this).val()=="Save")
			{
				e.preventDefault();
		        e.stopPropagation();
				filingGeneralInformationSave();
			}
		}
	});
	
	function filingGeneralInformationSave(){
		document.mergeAndUploadFiles.action="mergeFilesManuallySave";
		document.mergeAndUploadFiles.submit();
	} 

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
	
	      	
</script>
<s:actionmessage/>
<s:form theme="simple" name="mergeAndUploadFiles" action="" enctype="multipart/form-data" method="post">
	<table border = "0">
	
		<tr>
			<th colspan="7" class="mainheading">Merge & Upload Files - Manually</th>
		</tr>
		<tr class="noPetitionSubType">
			<td width="20%">Select Petition<span class="required">*</span></td>
			<td width="1%">:</td>
			<td colspan="5">
				<sx:autocompleter id="registrationNumberDisplay" name="registrationNumberDisplay" list="petitionNumberList" searchType="substring" cssStyle="width:284pt"/>
			</td>
		</tr>
		<tr valign="top">
			<td>Add Files to be merged</td>
			<td>:</td>
			<td colspan="5">
				<div class="fidRepeat">
				<%-- #{'Petition':'Petition','Reply':'Reply','Rejoinder':'Rejoinder','Response':'Response','Submission':'Submission','Additional':'Additional Information','Comment':'Comment'} --%>
					<s:select list="refDocumentList" name="fileUploadName" id="fileUploadName" listKey="id" listValue="documentName" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:120pt"/>
					&nbsp;<s:textfield type="text" size="24" name="documentDescription" id="documentDescription"/>
					&nbsp;<s:file name="fileUpload" id="attachedDocument" label="Select a File to upload" size="40"/>
					<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>								        	
					<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
				</div>
				<span class="tooltip">(pdf / jpeg files only)</span>
				<br/>
				<br/>
				<span class="tooltip">Note : Consolidated size of uploaded documents should not exceed 100 MB.</span>	
			</td>				
		</tr>
		<tr>
			<td width="20%">Merge To</td>
			<td width="1%">:</td>
			<td width="28%">
			<%-- #{'A':'Pleadings', 'H':'ROP',  'O':'Orders', 'B':'Correspondance'} --%>
				<s:select list="refDocumentTypeList" listKey="id" listValue="description"  name="mergeTo" id="mergeTo" headerValue="- Select -" headerKey="" cssStyle="width:142pt" theme="simple"/>
				
			</td>
			<td width="2%"></td>
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>			
		</tr>
		<tr>
			<td colspan="7" align="right">
				<%-- <s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'"> --%>
					<input type="submit" id="savebutton" name="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp;
					<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				<%-- </s:if> --%>	
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/>					
			</td>
		</tr>
	</table>
	</s:form>	
  
  
  
  
  </body>
</html>
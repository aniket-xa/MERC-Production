<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">
	$(document).ready(function() {
		
			var element = $(".blink");
			var shown = true;
			setInterval(toggle, 500);

			function toggle() {
			    if(shown) {
			        element.hide();
			        shown = false;
			    } else {
			        element.show();
			        shown = true;
			    }
			}
		
			var crDt=new Date();
		$(".delete").hide();	
		$("input[name='submitbutton']").click(function()
		{
			var fUpload=document.getElementsByName("fileUpload");
			var fUploadName=document.getElementsByName("fileUploadName");
			var dateOfFiling=null;
			if ($("#dateOfFiling").val()!="")
			{
				
				var from = $("#dateOfFiling").val().split("/");
				dateOfFiling = new Date(from[2], from[1] - 1, from[0]);
			}
			
			if($('#dateOfFiling').val()=="")
			{
				alert("Please enter date of filing.");
				$('#dateOfFiling').focus();
				return false;
			}
			
			else if(dateOfFiling.getTime() > crDt.getTime())
			{
					alert("Date of filing should not be future date.")
					$('#dateOfFiling').focus();
					return false;
			}
			else if($('#refRegulationId').val()==""){
				alert("Please Select Regulation.");
				$('#refRegulationId').focus();
				return false;
			}
			for (var i = 0; i < fUpload.length; i++) 
			{
				var fileExtension = (fUpload[i].value).substring((fUpload[i].value).lastIndexOf('.') + 1).toLowerCase();
				if ((fileExtension!="pdf" && fileExtension!="doc" && fileExtension!="docx" && fileExtension!="xls" && fileExtension!="xlsx") || fUpload[i].value=="" || fUploadName[i].value=="")
				{
					alert("Please select / upload document.")
					return false
				}
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
</script>

<%-- <s:include value="/jsp/tiles/tabsPleading.jsp"></s:include> --%>
<s:form theme="simple" name="addCompliance" action="addComplianceSubmit" method="post" enctype="multipart/form-data">
<s:hidden name="pleadingBeanId"/>
 	<table border = "0">
 		<tr>
			<th colspan="7" class="mainheading">Regulatory Compliance</th>
		</tr>
		<s:include value="/jsp/pleadings/pleadingPetitionDetails.jsp"></s:include>
		
		<tr class="subheading">
			<td colspan="7">Details</td>
		</tr>
		
		<tr valign="top">
			<td>Filing Party</td>
			<td>:</td>
			<td colspan="5">
				<s:property value="cercPetition.cercUserPetitionerId.userName"/>
			</td>								
		</tr>
		<tr valign="top">
			<td>Date of filing<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
			<s:date name="cercPetitionRc.dateOfFiling" format="dd/MM/yyyy" var="dateOfFilingFormat"/>
			<s:textfield name="cercPetitionRc.dateOfFiling" id="dateOfFiling" cssClass="tcal" value="%{#dateOfFilingFormat}"/>&nbsp;<span class="tooltip">(dd/mm/yyyy)</span>
			</td>								
		</tr>
		<tr>
			<td>Regulation<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<s:select list="refRegulationList" name="cercPetitionRc.refRegulationId.id" id="refRegulationId" listKey="id" listValue="regulationDescription" headerKey="" headerValue="- Select -" cssStyle="width:600pt"/>
			</td>								
		</tr>
		<tr valign="top">
			<td>Brief</td>
			<td>:</td>
			<td colspan="5">
				<textarea name="cercPetitionRc.description"  id="description" style="width:500pt"  cols="1000"></textarea>
			</td>								
		</tr>
		<tr class="subheading" >
			<td colspan="7">Attachment</td>
		</tr>
		<tr valign="top">
			<td>Document Type<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<div class="fidRepeat">
					<s:select list="refDocumentList" name="fileUploadName" listKey="id" listValue="documentName" id="refDocumentId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:142pt"/>
					&nbsp;
					<s:textfield type="text" size="24" name="documentDescription" id="documentDescription"/>
					&nbsp;<s:file name="fileUpload" id="attachedDocument" label="Select a File to upload" size="40"/>
					<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>								        	
					<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
				</div>
				<span class="tooltip">(pdf,doc,excel files only)</span>
				<br/>
				<br/>
				<span class="tooltip">Note : Consolidated, uploaded documents size should not exceed 300 MB.</span>	
			</td>				
		</tr>
		<tr>
			<td colspan="7" align="right">
			    <input type="submit" id="submitbutton" name="submitbutton" value="Submit" class="formbutton" action="addComplianceSubmit"/>&nbsp;&nbsp;
				<input type="reset" id="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="regulatoryComplainceList"/>
				
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>
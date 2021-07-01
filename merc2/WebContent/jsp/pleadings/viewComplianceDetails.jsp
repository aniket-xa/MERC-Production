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
			var dateOfFiling=null,responseLetterDated=null;
			if ($("#dateOfFiling").val()!="")
			{
				
				var from = $("#dateOfFiling").val().split("/");
				dateOfFiling = new Date(from[2], from[1] - 1, from[0]);
			}
			if ($("#responseLetterDated").val()!="")
			{
				
				var from = $("#responseLetterDated").val().split("/");
				responseLetterDated = new Date(from[2], from[1] - 1, from[0]);
			}
			if($('#cercPetitionPartyDetailsId').val()=="")
			{
				alert("Please select filing party.");
				$('#cercPetitionPartyDetailsId').focus();
				return false;
			}
			else if($('#dateOfFiling').val()=="")
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
			else if($('#responseLetterDated').val()!="" && responseLetterDated.getTime() > crDt.getTime())
			{
					alert("Response to letter date should not be future date.")
					$('#responseLetterDated').focus();
					return false;
			}
			for (var i = 0; i < fUpload.length; i++) 
			{
				var fileExtension = (fUpload[i].value).substring((fUpload[i].value).lastIndexOf('.') + 1).toLowerCase();
				if (fileExtension!="pdf" || fUpload[i].value=="" || fUploadName[i].value=="")
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
<s:form theme="simple" name="addCompliance" method="post" action="regulatoryComplainceList">
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
				<s:property value="cercPetitionRc.cercPetitionId.cercUserPetitionerId.userName"/>
			</td>								
		</tr>
		<tr valign="top">
			<td>Date of filing<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:date name="cercPetitionRc.dateOfFiling" format="dd/MM/yyyy" var="dateOfFilingFormat"/></td>								
		</tr>
		<tr>
			<td>Regulation</td>
			<td>:</td>
			<td colspan="5">
				<s:property value="cercPetitionRc.refRegulationId.regulationDescription"/>
			</td>								
		</tr>
		<tr valign="top">
			<td>Brief</td>
			<td>:</td>
			<td colspan="5">
				<s:property value="cercPetitionRc.description"/>
			</td>								
		</tr>
		<tr class="subheading" >
			<td colspan="7">Attachment</td>
		</tr>
		<tr valign="top">
			<td colspan="7">
				<table border = "1" cellspacing="0" cellpadding="0">
					<tr>
						<td width="4%">S.No.</td>
						<td width="38%">Document Type</td>
						<td width="*">Document Name</td>
					</tr>
					<s:iterator value="cercPetitionRc.cercPetitionRcDocumentsList" status="rowstatus">
					<tr>
					<td><s:property value="#rowstatus.count"/></td>
					<td><s:property value="refDocumentId.documentName"/></td>
					<td>
					<s:url action="openUploadedFile" var="openPdfFile" escapeAmp="false">
						<s:param name="struts.token.name">token</s:param>
						<s:param name="token" value="token"/>
						<s:param name="openUploadedFileName"><s:property value="fileName"/></s:param>
						<s:param name="openUploadedFileNameDisplay"><s:property value="fileNameDisplay"/></s:param>
            			<s:param name="filingBeanId" value="cercPetitionId.id"/>
            			<s:param name="constantName" value="%{'cercPleadingDocuments'}"/>
					</s:url>        			
						<s:a href="%{openPdfFile}">
							<s:property value="fileNameDisplay"/>
						</s:a>
					</td>
					</tr>					
					</s:iterator>
					</table>
			</td>				
		</tr>
		<tr>
			<td colspan="7" align="right">
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>
<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
	$(document).ready(function() {
		$(".response").hide();
		$(".delete").hide();
		$(".deleteP").hide();
		$(".deleteR").hide();
		$(".deleteO").hide();
		$(".reply").hide();
		var respondentCount="<s:property value='respondentList.size()'/>";
		
		if(respondentCount==0)
		{
			$('#allRespondents').prop("disabled", true);
		}
		$('#allPetitioners').change(function(){
			if(this.checked){$("#Petitioner").hide();}
			else{$("#Petitioner").show();}
		});
		$('#allRespondents').change(function(){
			if(this.checked){$("#Respondent").hide();}
			else{$("#Respondent").show();}
		});
		$('#allOthers').change(function(){
			if(this.checked){$("#Other").hide();}
			else{$("#Other").show();}
		});
		
		$('input[name="isRejoinderOrResponse"]').change(function () {
			if ($(this).val() == "S") {
				$(".response").show();
				$(".rejoinder").hide();		        
	        }
	        else
	        {
	        	$(".response").hide();
				$(".rejoinder").show();
	        }
		});
		$('input[name="rejoinderCopyToReplies"]').change(function () {
			
			if($('#rejoinderCopyToReplies').prop('checked')==true)
			{
				$(".reply").show();
			}
			else
			{
				$(".reply").hide();
			}
		});
		$("input[name='submitbutton']").click(function()
		{
			var fUpload=document.getElementsByName("fileUpload");
			var fUploadName=document.getElementsByName("fileUploadName");
			
			if(($('#allPetitioners').is(":checked")==false && $('#allRespondents').is(":checked")==false && $('#allOthers').is(":checked")==false) &&(($('#partyPetitionerId').val()==null || $('#partyPetitionerId').val()=="") && ($('#partyRespondentId').val()==null || $('#partyRespondentId').val()=="") && ($('#partyOtherId').val()==null || $('#partyOtherId').val()=="")))
			{
				alert("Please select any one from Petitioner, Respondent and Other.");
				$('#partyPetitionerId').focus();
				return false; 
			}
			else if($('#commentDate').val()=="")
			{
				if ($('input[name=isRejoinderOrResponse]:checked').val()=="J")
				{
					alert("Please enter reply date.");
				}
				else
				{
					alert("Please enter response date.");
				}
				$('#commentDate').focus();
				return false;
			}
			else if($('#dateOfFiling').val()=="")
			{
				alert("Please enter date of filing.");
				$('#dateOfFiling').focus();
				return false;
			}
					for (var i = 0; i < fUpload.length; i++) 
					{
						var fileExtension = (fUpload[i].value).substring((fUpload[i].value).lastIndexOf('.') + 1).toLowerCase();
						/* if (fileExtension!="pdf" || fUpload[i].value=="" || fUploadName[i].value=="") */
						if ((fileExtension!="pdf" && fileExtension!="doc" && fileExtension!="docx"  &&  fileExtension!="xls" && fileExtension!="xlsx") || fUpload[i].value=="" || fUploadName[i].value=="")
						{
							alert("Please select / upload document");
							$('#refDocumentId').focus();
							return false;
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
	
	function fidAddP() {
		$('.fidRepeatP:first').clone().insertAfter(".fidRepeatP:last").find("#attachedDocument").val("");
		var fidLength = $(".fidRepeatP").length;
		
		$( (".fidRepeatP") ).each(function(i) {
			if (i < (fidLength-1)) {
				$(".deleteP").show();
				$(".addP").hide();
		   	}
		   	else {
		   		$("span.deleteP:last").hide();
		   		$("span.addP:last").show();
		   	}
		});
	}
	
	function fidDeleteP(e) {
		$(e).parents(".fidRepeatP").remove();		
	}
	
	function fidAddR() {
		$('.fidRepeatR:first').clone().insertAfter(".fidRepeatR:last").find("#attachedDocument").val("");
		var fidLength = $(".fidRepeatR").length;
		
		$( (".fidRepeatR") ).each(function(i) {
			if (i < (fidLength-1)) {
				$(".deleteR").show();
				$(".addR").hide();
		   	}
		   	else {
		   		$("span.deleteR:last").hide();
		   		$("span.addR:last").show();
		   	}
		});
	}
	
	function fidDeleteR(e) {
		$(e).parents(".fidRepeatR").remove();		
	}
	
	function fidAddO() {
		$('.fidRepeatO:first').clone().insertAfter(".fidRepeatO:last").find("#attachedDocument").val("");
		var fidLength = $(".fidRepeatO").length;
		
		$( (".fidRepeatO") ).each(function(i) {
			if (i < (fidLength-1)) {
				$(".deleteO").show();
				$(".addO").hide();
		   	}
		   	else {
		   		$("span.deleteO:last").hide();
		   		$("span.addO:last").show();
		   	}
		});
	}
	
	function fidDeleteO(e) {
		$(e).parents(".fidRepeatO").remove();		
	}
	
	function chkValidation(lisize)
	{
		if($('#rejoinderCopyToReplies').prop('checked')==true)
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
			return false;
		}
	}
</script>
<s:include value="/jsp/tiles/tabsPleading.jsp"></s:include>
<s:form theme="simple" name="cercCommunication"
	action="cercCommunicationSave" method="post"
	enctype="multipart/form-data">
	<s:hidden name="pleadingBeanId" />
	<s:hidden name="pleadingId" />
	<table border="0">
		<tr>
			<th colspan="7" class="mainheading">MERC Communication</th>
		</tr>
		<s:include value="/jsp/pleadings/pleadingPetitionDetails.jsp"></s:include>

		<tr valign="top">
		<tr class="subheading">
			<td colspan="7">Correspondence Description</td>
		</tr>

		<tr>
			<td>Date of Hearing</td>
			<td>:</td>
			<td colspan="5">
			<s:date name="dateOfHearing" format="dd/MM/yyyy" var="dateOfHearingFormat" /> 
					<s:textfield name="dateOfHearing" id="dateOfHearing" cssClass="tcal" value="%{#dateOfHearingFormat}" />&nbsp;
<!-- 					<input type="datetime-local" id="dateOfHearing" name="dateOfHearing"  /> -->
					<span class="tooltip">(dd/mm/yyyy)</span></td>
<%-- 					<s:textfield type="datetime-local" name="dateOfHearing" id="dateOfHearing" cssClass="tcal" value="%{#dateOfHearingFormat}"> </s:textfield> --%>
		</tr>

<!-- 		<tr> -->
<!-- 			<td>Coram</td> -->
<!-- 			<td>:</td> -->
<!-- 			<td colspan="5"> -->
<%-- 				<s:select list="coramList" name="coram" id="coramId" listKey="id" listValue="title+' '+firstName+' '+surName" headerKey="" headerValue="- Select -" cssStyle="width:510pt" multiple = "true" value="coram" /> --%>
<%-- 			<br><span class="tooltip">(Use "Ctrl" key to select multiple.)</span> --%>
<!-- 			</td>								 -->
<!-- 		</tr> -->
		<tr>
			<td>Description</td>
			<td>:</td>
			<td colspan="5"><s:textfield name="description"
					cssStyle="width:505pt" /></td>
		</tr>
		
		<tr valign="top">
		<tr class="subheading">
			<td colspan="7">Correspondence / Compliance Details</td>
		</tr>
		<tr valign="top">
			<td colspan="7"><s:checkbox name="allPetitioners"
					id="allPetitioners" label="All"
					title="Click to Select all Petitioner" />&nbsp;&nbsp;All&nbsp;Petitioners&nbsp;&nbsp;&nbsp;&nbsp;
				<s:checkbox name="allRespondents" id="allRespondents" label="All"
					title="Click to Select all Respondent" />&nbsp;&nbsp;All&nbsp;Respondents&nbsp;&nbsp;&nbsp;&nbsp;
				<s:checkbox name="allOthers" id="allOthers" label="All"
					title="Click to Select all Other parties" />&nbsp;&nbsp;All&nbsp;Other
				Parties&nbsp;&nbsp;&nbsp;&nbsp; Compliance
				Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
				<s:textfield name="complianceDate" id="complianceDate"
					cssClass="tcal" value="%{#complianceDate}"
					cssStyle="margin-bottom:5pt;" />&nbsp;<span class="tooltip">(dd/mm/yyyy)</span>
			</td>
		<tr id="Petitioner">
			<td>Petitioner</td>
			<td>:</td>
			<td colspan="5">
				<div class="fidRepeatP">
					<s:select list="petitionerList" name="partyPetitioner"
						id="partyPetitionerId" listKey="id"
						listValue="fieldName+' ('+fieldType+')'"
						cssStyle="width:510pt;margin-bottom:5pt;" headerKey=""
						headerValue="- Select -" />
					Compliance Description :
					<s:textfield type="text" name="complainceDescriptionPetitioner"
						id="complainceDescriptionPetitioner"
						cssStyle="width:376pt;margin-bottom:5pt;" />
					<s:date name="complianceDatePetitioner" format="dd/MM/yyyy"
						var="complianceDatePetitionerFormat" />
					Compliance
					Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
					<s:textfield name="complianceDatePetitioner"
						id="complianceDatePetitioner" cssClass="tcal"
						value="%{#complianceDatePetitionerFormat}"
						cssStyle="margin-bottom:5pt;" />
					&nbsp;<span class="tooltip">(dd/mm/yyyy)</span> <span
						class="deleteP"><a href="#"
						onClick="fidDeleteP(this);return false" title="Delete" class="tip">delete</a></span>
					<span class="addP"><a href="#"
						onClick="fidAddP();return false;" id="add-address">Add More</a></span>
				</div>
			</td>
		</tr>
		<tr id="Respondent">
			<td>Respondent</td>
			<td>:</td>
			<td colspan="5">
				<div class="fidRepeatR">
					<s:select list="respondentList" name="partyRespondent"
						id="partyRespondentId" listKey="id"
						listValue="fieldName+' ('+fieldType+')'"
						cssStyle="width:510pt;margin-bottom:5pt;" headerKey=""
						headerValue="- Select -" />
					Compliance Description :
					<s:textfield type="text" name="complainceDescriptionRespondent"
						id="complainceDescriptionRespondent"
						cssStyle="width:376pt;margin-bottom:5pt;" />
					<s:date name="complianceDateRespondent" format="dd/MM/yyyy"
						var="complianceDateRespondentFormat" />
					Compliance
					Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
					<s:textfield name="complianceDateRespondent"
						id="complianceDateRespondent" cssClass="tcal"
						value="%{#complianceDateRespondentFormat}"
						cssStyle="margin-bottom:5pt;" />
					&nbsp;<span class="tooltip">(dd/mm/yyyy)</span> <span
						class="deleteR"><a href="#"
						onClick="fidDeleteR(this);return false" title="Delete" class="tip">delete</a></span>
					<span class="addR"><a href="#"
						onClick="fidAddR();return false;" id="add-address">Add More</a></span>
				</div>
			</td>
		</tr>
		<tr id="Other">
			<td>Others</td>
			<td>:</td>
			<td colspan="5">
				<div class="fidRepeatO">
					<s:select list="othersPartyList" name="partyOther"
						id="partyOtherId" listKey="id" listValue="fieldName"
						cssStyle="width:510pt;margin-bottom:5pt;" headerKey=""
						headerValue="- Select -" />
					Compliance Description :
					<s:textfield type="text" name="complainceDescriptionOther"
						id="complainceDescriptionOther"
						cssStyle="width:376pt;margin-bottom:5pt;" />
					<s:date name="complianceDateOther" format="dd/MM/yyyy"
						var="complianceDateOtherFormat" />
					Compliance
					Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
					<s:textfield name="complianceDateOther" id="complianceDateOther"
						cssClass="tcal" value="%{#complianceDateOtherFormat}"
						cssStyle="margin-bottom:5pt;" />
					&nbsp;<span class="tooltip">(dd/mm/yyyy)</span> <span
						class="deleteO"><a href="#"
						onClick="fidDeleteO(this);return false" title="Delete" class="tip">delete</a></span>
					<span class="addO"><a href="#"
						onClick="fidAddO();return false;" id="add-address">Add More</a></span>
				</div>
			</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<td>Date of Hearing</td> -->
<!-- 			<td>:</td> -->
<%-- 			<td colspan="5"><s:date name="dateOfHearing" format="dd/MM/yyyy" --%>
<%-- 					var="dateOfHearingFormat" /> <s:textfield name="dateOfHearing" --%>
<%-- 					id="dateOfHearing" cssClass="tcal" value="%{#dateOfHearingFormat}" />&nbsp;<span --%>
<%-- 				class="tooltip">(dd/mm/yyyy)</span></td> --%>
<!-- 		</tr> -->
		<%-- <tr>
			<td>Compliance Date</td>
			<td>:</td>
			<td colspan="5">
				<s:date name="complianceDate" format="dd/MM/yyyy" var="complianceDateFormat"/>
				<s:textfield name="complianceDate" id="complianceDate" cssClass="tcal" value="%{#complianceDateFormat}"/>&nbsp;<span class="tooltip">(dd/mm/yyyy)</span>
			</td>								
		</tr> --%>
		
		<tr class="subheading">
			<td colspan="7">Documents</td>
		</tr>
		<tr valign="top">
			<td>Document Type<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<div class="fidRepeat">
					<s:select list="refDocumentList" name="fileUploadName" listKey="id"
						listValue="documentName" id="refDocumentId" theme="simple"
						headerValue="- Select -" headerKey="" cssStyle="width:142pt" />
					&nbsp;
					<s:textfield type="text" size="24" placeholder="Remark" name="documentDescription"
						id="documentDescription" />
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
				class="formbutton"
				onclick="return chkValidation(<s:property value="cercPetitionReplyBeanList.size"/>);" />&nbsp;&nbsp;
				<input type="reset" id="resetbutton" value="Reset"
				class="formbutton" />&nbsp;&nbsp; <s:submit id="cancelbutton"
					name="cancelbutton" value="Cancel" class="formbutton"
					action="pleadingList" /></td>
		</tr>
	</table>
	<s:token />
</s:form>
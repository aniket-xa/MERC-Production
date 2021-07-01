<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
	$(document).ready(function() 
		{
			$(".delete").hide();		
	});

	function fidAdd() {
		$('.fidRepeat:first').clone().insertAfter(".fidRepeat:last").find("input[type='text']").val("");
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

<s:form theme="simple" name="pleadingReplyCommentsDetails" action="pleadingList" method="post" enctype="multipart/form-data">
<s:hidden name="pleadingBeanId"/>
 	<table border = "0">
 		<tr>
			<th colspan="7" class="mainheading">COMMENTS / REPLY</th>
		</tr>
		<tr class="subheading">
			<td colspan="7" align="center">
			<s:if test="cercPetition.registrationNumber!=null">Petition No: <s:property value="cercPetition.registrationNumberDisplay"/> </s:if>
			<s:else>Diary No: <s:property value="cercPetition.diaryNumberDisplay"/> </s:else>
			</td>									
		</tr>
		<tr>
			<td colspan="7">&nbsp;&nbsp;</td>
		</tr>
		<tr class="subheading">
			<td colspan="7">Petition Details</td>
		</tr>
		<tr valign="top">
			<td width="20%">Diary Number</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercPetition.diaryNumberDisplay"/></td>
			<td width="2%"></td>
			<td width="20%">Petition Number</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercPetition.registrationNumberDisplay"/></td>					
		</tr>
		<tr valign="top">
			<td>Petitioner Name</td>
			<td>:</td>
			<td><s:property value="cercPetition.cercUserPetitionerId.firstName"/> <s:property value="cercPetition.cercUserPetitionerId.middleName"/> <s:property value="cercPetition.cercUserPetitionerId.lastName"/></td>
			<td></td>
			<td>Respondent Name</td>
			<td>:</td>
			<td>
			<s:if test="cercMainRepondentList.size>0">
			<s:property value="cercMainRepondentList[0].cercUserId.firstName"/> 
			<s:property value="cercMainRepondentList[0].cercUserId.middleName"/>
			<s:property value="cercMainRepondentList[0].cercUserId.lastName"/>
			<s:if test="cercMainRepondentList.size>1"> and <s:property value="cercMainRepondentList.size"/> others</s:if>
			</s:if>
			</td>								
		</tr>
		<tr valign="top">
			<td>Petition Type</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercPetition.refPetitionTypeId.petitionType"/> (<s:property value="cercPetition.refPetitionTypeId.petitionTypeCode"/>)</td>											
		</tr>
		<tr valign="top">
			<td>Last Hearing Date</td>
			<td>:</td>
			<td><s:date name="lastHearingDate" format="dd/MM/yyyy"/></td>
			<td></td>
			<td>Next Hearing Date</td>
			<td>:</td>
			<td><s:date name="nextHearingDate" format="dd/MM/yyyy"/></td>											
		</tr>
		<tr valign="top">
			<td valign="top">Subject</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercPetition.refSubjectId.subject"/><br/><s:property value="cercPetition.subject"/></td>								
		</tr>
			<tr class="subheading" valign="top">
			<td colspan="7">Details</td>
		</tr>
		<s:if test='pleadingType=="Reply" or pleadingType=="Comment"'>
		<tr valign="top">
			<td>Type</td>
			<td>&nbsp;</td>
			<td colspan="5">
			<s:if test="cercPetitionReply.isReplyOrComment=='Reply'">Reply</s:if>
			<s:elseif test="cercPetitionReply.isReplyOrComment=='Comment'">Comment</s:elseif>
			<s:elseif test="cercPetitionReply.isReplyOrComment=='Sub'">Submission</s:elseif>
			<s:elseif test="cercPetitionReply.isReplyOrComment=='R'">Rejoinder</s:elseif>
			</td>								
		</tr>
		<tr valign="top">
			<td>Respondent Name</td>
			<td>:</td>
			<td colspan="5">
			<s:if test="cercPetitionReply.cercPetitionPartyDetailsId.cercUserId!=null">
			<s:property value="cercPetitionReply.cercPetitionPartyDetailsId.cercUserId.firstName"/> 
			<s:property value="cercPetitionReply.cercPetitionPartyDetailsId.cercUserId.lastName"/>
			</s:if>
			<s:else>
			<s:property value="cercPetitionReply.cercPetitionPartyDetailsId.partyName"/>
			</s:else>
			</td>								
		</tr>
		<tr valign="top">
			<td>Date of filing Reply / Comment</td>
			<td>:</td>
			<td colspan="5">
			<s:date name="cercPetitionReply.dateOfFiling" format="dd/MM/yyyy"/>
			</td>								
		</tr>
		<tr valign="top">
			<td>Order Date / Direction of Commission</td>
			<td>:</td>
			<td colspan="5">
				<s:date name="cercPetitionReply.orderDate" format="dd/MM/yyyy"/>
				<s:if test="cercPetitionReply.orderDate1!=null">
					<br/><s:date name="cercPetitionReply.orderDate1" format="dd/MM/yyyy"/>
				</s:if>
				<s:if test="cercPetitionReply.orderDate2!=null">
					<br/><s:date name="cercPetitionReply.orderDate2" format="dd/MM/yyyy"/>
				</s:if>
			</td>								
		</tr>
		<tr valign="top">
			<td>Description</td>
			<td>:</td>
			<td colspan="5">
				<s:property value="cercPetitionReply.description"/>
			</td>								
		</tr>
		<s:if test="cercPetitionReplyDocumentsList.size>0">
		<tr class="subheading" >
			<td colspan="7">Attachment</td>
		</tr>
		<tr valign="top">
		<td colspan="7">
		<table>
			<tr class="subheading">
			<td>Document Type</td>
			<td>File Name</td>
			</tr>
		<s:iterator value="cercPetitionReplyDocumentsList">
			<tr>
				<td><s:if test = "refDocumentId == null"><s:property value="documentDescription"/></s:if><s:else><s:property value="refDocumentId.documentName"/></s:else></td>
				<td>
				<s:url action="openUploadedFile" var="openPdfFile" escapeAmp="false">
						<s:param name="struts.token.name">token</s:param>
						<s:param name="token" value="token"/>
            			<s:param name="openUploadedFileName"><s:property value="fileName"/></s:param>
            			<s:param name="openUploadedFileNameDisplay"><s:property value="fileNameDisplay"/></s:param>
            			<s:param name="filingBeanId" value="pleadingBeanId"/>
        		</s:url>
				<s:a href="%{openPdfFile}" title="Click to Open"><s:property value="fileNameDisplay"/></s:a>
				</td>
			</tr>
		</s:iterator>
		</table>
		</td>
		</tr>
		</s:if>
		</s:if>
		<s:elseif test="pleadingType=='Sub'">
				<tr valign="top">
			<td>Type</td>
			<td>&nbsp;</td>
			<td colspan="5">Submission</td>								
		</tr>
		<tr valign="top">
			<td>Respondent Name</td>
			<td>:</td>
			<td colspan="5">
			<s:if test="cercPetitionSubmission.cercPetitionPartyDetailsId.cercUserId!=null">
			<s:property value="cercPetitionSubmission.cercPetitionPartyDetailsId.cercUserId.firstName"/> 
			<s:property value="cercPetitionSubmission.cercPetitionPartyDetailsId.cercUserId.lastName"/>
			</s:if>
			<s:else>
			<s:property value="cercPetitionSubmission.cercPetitionPartyDetailsId.partyName"/>
			</s:else>
			<%-- <s:select list="cercPetitionPartyDetailsList" name="cercPetitionPartyDetailsId" id="cercPetitionPartyDetailsId" listKey="partyId" listValue="partName" headerKey="" headerValue="- Select -"  cssStyle="width:142pt"/> --%>
			</td>								
		</tr>
		<tr valign="top">
			<td>Date of filing Reply / Comment</td>
			<td>:</td>
			<td colspan="5">
			<s:date name="cercPetitionSubmission.dateOfFiling" format="dd/MM/yyyy"/>
			<%-- <s:textfield name="dateOfFiling" type="date" id="dateOfFiling" cssClass="tcal" value="%{#dateOfFilingFormat}"/>&nbsp;<span class="tooltip">(dd/mm/yyyy)</span> --%>
			</td>								
		</tr>
		<tr valign="top">
			<td>Order Date / Direction of Commission</td>
			<td>:</td>
			<td colspan="5">
				<s:date name="cercPetitionSubmission.orderDate" format="dd/MM/yyyy"/>
				<%-- <s:textfield name="orderDate" type="date" id="orderDateId" cssClass="tcal" value="" />&nbsp;<span class="tooltip">(dd/mm/yyyy)</span> --%>
			</td>								
		</tr>
		<tr valign="top">
			<td>Description</td>
			<td>:</td>
			<td colspan="5">
				<s:property value="cercPetitionSubmission.description"/>
			</td>								
		</tr>
		<s:if test="cercPetitionSubmissionDocumentsList.size>0">
		<tr class="subheading" >
			<td colspan="7">Attachment</td>
		</tr>
		<tr valign="top">
		<td colspan="7">
		<table>
			<tr class="subheading">
			<td>Document Type</td>
			<td>File Name</td>
			</tr>
		<s:iterator value="cercPetitionSubmissionDocumentsList">
			<tr>
<%-- 				<td><s:property value="refDocumentId.documentName"/></td> --%>
				<td><s:if test = "refDocumentId == null"><s:property value="documentDescription"/></s:if><s:else><s:property value="refDocumentId.documentName"/></s:else></td>
				<td>
				<s:url action="openUploadedFile" var="openPdfFile" escapeAmp="false">
						<s:param name="struts.token.name">token</s:param>
						<s:param name="token" value="token"/>
            			<s:param name="openUploadedFileName"><s:property value="fileName"/></s:param>
            			<s:param name="openUploadedFileNameDisplay"><s:property value="fileNameDisplay"/></s:param>
            			<s:param name="filingBeanId" value="pleadingBeanId"/>
        		</s:url>
				<s:a href="%{openPdfFile}" title="Click to Open"><s:property value="fileNameDisplay"/></s:a>
				</td>
			</tr>
		</s:iterator>
		</table>
		</td>
		</tr>
		</s:if>
		</s:elseif>
		<s:elseif test="pleadingType=='Add'">
				<tr valign="top">
			<td>Type</td>
			<td>&nbsp;</td>
			<td colspan="5">Additional Information</td>								
		</tr>
		<tr valign="top">
			<td>Respondent Name</td>
			<td>:</td>
			<td colspan="5">
			<s:if test="cercPetitionAdditionalInformation.cercPetitionPartyDetailsId.cercUserId!=null">
			<s:property value="cercPetitionAdditionalInformation.cercPetitionPartyDetailsId.cercUserId.firstName"/> 
			<s:property value="cercPetitionAdditionalInformation.cercPetitionPartyDetailsId.cercUserId.lastName"/>
			</s:if>
			<s:else>
			<s:property value="cercPetitionAdditionalInformation.cercPetitionPartyDetailsId.partyName"/>
			</s:else>
			<%-- <s:select list="cercPetitionPartyDetailsList" name="cercPetitionPartyDetailsId" id="cercPetitionPartyDetailsId" listKey="partyId" listValue="partName" headerKey="" headerValue="- Select -"  cssStyle="width:142pt"/> --%>
			</td>								
		</tr>
		<tr valign="top">
			<td>Response Letter Date</td>
			<td>:</td>
			<td colspan="5">
			<s:date name="cercPetitionAdditionalInformation.responseLetterDate" format="dd/MM/yyyy"/>
			<%-- <s:textfield name="dateOfFiling" type="date" id="dateOfFiling" cssClass="tcal" value="%{#dateOfFilingFormat}"/>&nbsp;<span class="tooltip">(dd/mm/yyyy)</span> --%>
			</td>								
		</tr>
		<tr valign="top">
			<td>Letter Subject</td>
			<td>:</td>
			<td colspan="5">
				<s:property value="cercPetitionAdditionalInformation.letterSubject"/>
				<%-- <s:textfield name="orderDate" type="date" id="orderDateId" cssClass="tcal" value="" />&nbsp;<span class="tooltip">(dd/mm/yyyy)</span> --%>
			</td>								
		</tr>
		<tr valign="top">
			<td>Description</td>
			<td>:</td>
			<td colspan="5">
				<s:property value="cercPetitionAdditionalInformation.description"/>
			</td>								
		</tr>
		<s:if test="cercPetitionAdditionalInformationDocumentsList.size>0">
		<tr class="subheading" >
			<td colspan="7">Attachment</td>
		</tr>
		<tr valign="top">
		<td colspan="7">
		<table>
			<tr class="subheading">
			<td>Document Type</td>
			<td>File Name</td>
			</tr>
		<s:iterator value="cercPetitionAdditionalInformationDocumentsList">
			<tr>
<%-- 				<td><s:property value="refDocumentId.documentName"/></td> --%>
				<td><s:if test = "refDocumentId == null"><s:property value="documentDescription"/></s:if><s:else><s:property value="refDocumentId.documentName"/></s:else></td>
				<td>
				<s:url action="openUploadedFile" var="openPdfFile" escapeAmp="false">
						<s:param name="struts.token.name">token</s:param>
						<s:param name="token" value="token"/>
            			<s:param name="openUploadedFileName"><s:property value="fileName"/></s:param>
            			<s:param name="openUploadedFileNameDisplay"><s:property value="fileNameDisplay"/></s:param>
            			<s:param name="filingBeanId" value="pleadingBeanId"/>
        		</s:url>
				<s:a href="%{openPdfFile}" title="Click to Open"><s:property value="fileNameDisplay"/></s:a>
				</td>
			</tr>
		</s:iterator>
		</table>
		</td>
		</tr>
		</s:if>
		</s:elseif>
		<s:elseif test='pleadingType=="R" or pleadingType=="C"'>
				<tr valign="top">
			<td>Type</td>
			<td>&nbsp;</td>
			<td colspan="5">
			<s:if test="pleadingType=='Rej'">Rejoinder</s:if>
			<s:else>Response</s:else>
			</td>								
		</tr>
		<tr valign="top">
			<td>Respondent Name</td>
			<td>:</td>
			<td colspan="5">
			<s:if test="cercPetitionRejoinder.cercPetitionPartyDetailsId.cercUserId!=null">
			<s:property value="cercPetitionRejoinder.cercPetitionPartyDetailsId.cercUserId.firstName"/> 
			<s:property value="cercPetitionRejoinder.cercPetitionPartyDetailsId.cercUserId.lastName"/>
			</s:if>
			<s:else>
			<s:property value="cercPetitionRejoinder.cercPetitionPartyDetailsId.partyName"/>
			</s:else>
			<%-- <s:select list="cercPetitionPartyDetailsList" name="cercPetitionPartyDetailsId" id="cercPetitionPartyDetailsId" listKey="partyId" listValue="partName" headerKey="" headerValue="- Select -"  cssStyle="width:142pt"/> --%>
			</td>								
		</tr>
		<tr valign="top">
			<td>Date of Filing</td>
			<td>:</td>
			<td colspan="5">
			<s:date name="cercPetitionRejoinder.dateOfFiling" format="dd/MM/yyyy"/>
			<%-- <s:textfield name="dateOfFiling" type="date" id="dateOfFiling" cssClass="tcal" value="%{#dateOfFilingFormat}"/>&nbsp;<span class="tooltip">(dd/mm/yyyy)</span> --%>
			</td>								
		</tr>
		<s:if test="cercPetitionRejoinderDocumentsList.size()>0">
		<tr class="subheading" >
			<td colspan="7">Attachment</td>
		</tr>
		<tr valign="top">
		<td colspan="7">
		<table>
			<tr class="subheading">
			<td>Document Type</td>
			<td>File Name</td>
			</tr>
		<s:iterator value="cercPetitionRejoinderDocumentsList">
			<tr>
<%-- 				<td><s:property value="refDocumentId.documentName"/></td> --%>
				<td><s:if test = "refDocumentId == null"><s:property value="documentDescription"/></s:if><s:else><s:property value="refDocumentId.documentName"/></s:else></td>
				<td>
				<s:url action="openUploadedFile" var="openPdfFile" escapeAmp="false">
						<s:param name="struts.token.name">token</s:param>
						<s:param name="token" value="token"/>
            			<s:param name="openUploadedFileName"><s:property value="fileName"/></s:param>
            			<s:param name="openUploadedFileNameDisplay"><s:property value="fileNameDisplay"/></s:param>
            			<s:param name="filingBeanId" value="pleadingBeanId"/>
        		</s:url>
				<s:a href="%{openPdfFile}" title="Click to Open"><s:property value="fileNameDisplay"/></s:a>
				</td>
			</tr>
		</s:iterator>
		</table>
		</td>
		</tr>
		</s:if>
		</s:elseif>
		<tr>
			<td colspan="7" align="right">
				<s:submit type="submit" id="cancelbutton" name="cancelbutton" value="Back" class="formbutton"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
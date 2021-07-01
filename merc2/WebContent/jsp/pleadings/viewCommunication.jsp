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
		
		<%-- <s:if test="cercPetitionReply.isReplyOrComment=='R' or cercPetitionReply.isReplyOrComment=='C'"> --%>
		<tr valign="top">
			<td>Type</td>
			<td>&nbsp;</td>
			<td colspan="5">Communication</td>
		</tr>
		<tr valign="top">
			<td>Communication With</td>
			<td>:</td>
			<td colspan="5">
			<s:property value="cercCommunicationPartyDetails.cercCommunicationUserId.firstName"/> 
			<s:property value="cercCommunicationPartyDetails.cercCommunicationUserId.lastName"/>
			</td>								
		</tr>
		<tr valign="top">
			<td>Date of Communication</td>
			<td>:</td>
			<td colspan="5">
			<s:date name="cercCommunication.updatedOn" format="dd/MM/yyyy"/>
			</td>								
		</tr>
		<s:if test="cercCommunication.dateOfHearing!=null">
		<tr valign="top">
			<td>Date Of Hearing</td>
			<td>:</td>
			<td colspan="5">
				<s:date name="cercCommunication.dateOfHearing" format="dd/MM/yyyy"/>
			</td>								
		</tr>
		</s:if>
		<s:if test="cercCommunication.refJudge1Id!=null">
		<tr valign="top">
			<td>Judges</td>
			<td>:</td>
			<td colspan="5">
				<s:property value="cercCommunication.refJudge1Id.title"/> <s:property value="cercCommunication.refJudge1Id.firstName"/> <s:property value="cercCommunication.refJudge1Id.surName"/><br/>
				<s:property value="cercCommunication.refJudge2Id.title"/> <s:property value="cercCommunication.refJudge2Id.firstName"/> <s:property value="cercCommunication.refJudge2Id.surName"/><br/>
				<s:property value="cercCommunication.refJudge3Id.title"/> <s:property value="cercCommunication.refJudge3Id.firstName"/> <s:property value="cercCommunication.refJudge3Id.surName"/><br/>
				<s:property value="cercCommunication.refJudge4Id.title"/> <s:property value="cercCommunication.refJudge4Id.firstName"/> <s:property value="cercCommunication.refJudge4Id.surName"/><br/>
				<s:property value="cercCommunication.refJudge5Id.title"/> <s:property value="cercCommunication.refJudge5Id.firstName"/> <s:property value="cercCommunication.refJudge5Id.surName"/><br/>
			</td>								
		</tr>
		</s:if>
		<tr valign="top">
			<td>Description</td>
			<td>:</td>
			<td colspan="5">
				<s:property value="cercCommunication.description"/>
			</td>								
		</tr>
		<s:if test="cercCommunicationDocumentsList.size>0">
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
		<s:iterator value="cercCommunicationDocumentsList">
			<tr>
				<td><s:property value="refDocumentId.documentName"/></td>
				<td>
				<s:url action="openUploadedFile" var="openPdfFile" escapeAmp="false">
						<s:param name="struts.token.name">token</s:param>
						<s:param name="token" value="token"/>
						<s:param name="constantName" value="%{'cercCorrespondenceDocuments'}"/>
            			<s:param name="openUploadedFileName"><s:property value="fileName"/></s:param>
            			<s:param name="filingBeanId"><s:property value="cercPetitionId.id"/></s:param>
        		</s:url>
				<s:a href="%{openPdfFile}" title="Click to Open"><s:property value="fileName"/></s:a>
				</td>
			</tr>
		</s:iterator>
		</table>
		</td>
		</tr>
		</s:if>
		<%-- </s:if> --%>
		<tr>
			<td colspan="7" align="right">
				<s:submit type="submit" id="cancelbutton" name="cancelbutton" value="Back" class="formbutton"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
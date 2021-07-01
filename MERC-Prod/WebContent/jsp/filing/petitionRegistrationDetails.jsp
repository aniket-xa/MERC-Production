<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
	$(document).ready(function() {

$("#reportWindow").click(function(event) {
	    	   event.preventDefault();
	           event.stopPropagation();
	           winddd = window.open(this.href,"report",'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no');
	       });
	       
		$('#submitbutton').click(function(){
			var dt = $('#registeredOn').val();
			var regDate = dt.split("/");
			var regDd = regDate[0];
			var regMm = regDate[1];
			var regYyyy = regDate[2];
			var mm = new Date().getMonth()+1;
			var dd = new Date().getDate();
			var yyyy = new Date().getFullYear();
			
			if(regDd != dd || regMm != mm || regYyyy != yyyy){
				alert("Petition registration date cannot be in past or future date");
				$(this).blur();
				return false;	
			}
			
		});
	       
	});

	
	
	$('input:submit').click(function(){
		$('input:submit').attr("disabled", true);	
	});
	</script>
<s:form theme="simple" name="petitionRegistrationDetails" action="generatePetitionNumber">
<s:hidden name="filingBeanId"/>
	<table border = "0">
 		<tr>
	 		<th colspan="7" class="mainheading">Petition Registration</th>
		</tr>
		<s:if test="cercPetition.registrationNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Petition No. : <s:property value="cercPetition.registrationNumberDisplay"/></td>
			</tr>
			<tr>
				<td colspan="3" align="left">Diary No. : <s:property value="cercPetition.diaryNumberDisplay"/></td>
				<td colspan="1" align="center"></td>
				<td colspan="3" align="right">Reference No. : <s:property value="cercPetition.referenceNumberDisplay"/></td>									
			</tr>
		</s:if>
		<s:elseif test="cercPetition.diaryNumber!=null">
			<tr  class="subheading">
				<td colspan="7" align="center">Diary No. : <s:property value="cercPetition.diaryNumberDisplay"/></td>													
			</tr>
			<tr>
				<td colspan="3" align="left"></td>
				<td colspan="1" align="center"></td>
				<td colspan="3" align="right">Reference No. : <s:property value="cercPetition.referenceNumberDisplay"/></td>									
			</tr>
		</s:elseif>
		<s:elseif test="referenceNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Reference No. : <s:property value="cercPetition.referenceNumberDisplay"/></td>									
			</tr>
		</s:elseif>
		<tr class="subheading">
			<td colspan="7" align="left">Petition Details</td>
		</tr>
		<tr>
			<td width="20%">Diary Number</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercPetition.diaryNumberDisplay"/></td>
			<td width="2%"></td>
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>					
		</tr>
		<tr>
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
			<s:if test="cercMainRepondentList.size>1"> and <s:property value="cercMainRepondentList.size-1"/> others</s:if>
			</s:if>
			</td>								
		</tr>
		<tr>
			<td>Petition Type</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercPetition.refPetitionTypeId.petitionType"/> (<s:property value="cercPetition.refPetitionTypeId.petitionTypeCode"/>)</td>											
		</tr>
		
		<tr>
			<td valign="top">Subject</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercPetition.refSubjectId.subject"/><br/><s:property value="cercPetition.subject"/></td>								
		</tr>
		<tr>
			<td valign="top" colspan="7">
			<s:a action="openPetitionSummary">
	   			<s:param name="struts.token.name" value="%{'token'}"/>
				<s:param name="token" value="token"/>
				<s:param name="filingBeanId" value="%{filingBeanId}"/>
				<s:param name="reportName" value="%{'petitionSummary.rptdesign'}"/>
				View Petition Summary
			</s:a>
			</td>											
		</tr>
		<tr valign="top">
			<tr class="subheading">
			<td colspan="7"  align="left">Details</td>
		</tr>
		<tr valign="top">
			<td>Registration Date<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
			<s:date name="registeredOn" format="dd/MM/yyyy" var="dateOfRegistrationFormat"/>
			<s:textfield name="registeredOn" id="registeredOn" cssClass="tcal" value="%{#dateOfRegistrationFormat}"/>&nbsp;<span class="tooltip">(dd/mm/yyyy)</span>
			</td>								
		</tr>
		
		
		<%-- <tr class="subheading">
			<td colspan="7">Attachment</td>
		</tr>
		<tr valign="top">
			<td>Document Type<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<div class="fidRepeat">
					<s:select list="refDocumentList" name="fileUploadName" listKey="id" listValue="documentName" id="refDocumentId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:142pt"/>
					&nbsp;<s:textfield type="text" size="24" name="documentDescription" id="documentDescription"/>
					&nbsp;<s:file name="fileUpload" id="attachedDocument" label="Select a File to upload" size="40"/>
					<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>								        	
					<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
				</div>
				<span class="tooltip">(pdf / jpeg files only)</span>
				<br/>
				<br/>
				<span class="tooltip">Note : Consolidated, uploaded documents size should not exceed 100 MB.</span>	
			</td>				
		</tr> --%>
		
		<tr>
			<td colspan="7" align="right">
				<input type="submit" id="submitbutton" name="submitbutton" value="Register a Petition" class="formbutton"/>&nbsp;&nbsp;
				<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="petitionForRegistrationList"/>				
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
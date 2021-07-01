
<%@ taglib uri="/struts-tags" prefix="s"%>

<%-- <script src="js/jquery.js"></script> --%>
<%-- <script src="js/jquery.min.js"></script> --%>
<%-- <script src="https://ajax .googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> --%>

<script type="text/javascript">
$(document).ready(function(){
// 	alert("inside ready func");
	$(".delete").hide();
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
function reportWindow(event) {
		winddd = window.open(event,"report",'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no');
		winddd.focus();
	}
	
</script>
<s:form theme="simple" name="deficiencyPetitionDetails" action="viewEditDeficienciesSave" method="post" enctype="multipart/form-data">
<s:hidden name="pleadingBeanId"/>
 	<table border = "0">
	 		<tr>
	 			<th colspan="7" class="mainheading">Deficiencies</th>
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
			<td colspan="7">Petition Details</td>
		</tr>
		<tr>
			<td width="20%">Diary Number</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercPetition.diaryNumberDisplay"/></td>
			<td width="2%"></td>
			<td width="20%">Petition Number</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercPetition.registrationNumberDisplay"/></td>					
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
			<s:if test="cercMainRepondentList.size>1"> and <s:property value="cercMainRepondentList.size"/> others</s:if>
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
				<s:param name="filingBeanId" value="%{cercPetition.id}"/>
				<s:param name="reportName" value="%{'petitionSummary.rptdesign'}"/>
				View Petition Summary
			</s:a>
			</td>											
		</tr>
		<s:if test="notifiedDeficiencyList.size()>0">
			<tr class="subheading">
				<td colspan="7">Deficiency List</td>
			</tr>
			<tr>
				<td colspan="7">
					<table>
						<tr class="subheading" align="center">
							<td width="5%">S. No.</td>
<!-- 							<td width="10%">Name</td> -->
							<td width="61%">Deficiency Description</td>
							<td width="12%">Notification Date</td>
							<td width="12%">Deficiency still Exists<s:property value="notifiedDeficiencyList.cercPetitionDeficienciesList.size()"/> </td>
						</tr>
						<s:iterator value="notifiedDeficiencyList" status="outstatus">
							<s:hidden name="notifiedDeficiencyList[%{#outstatus.index}].id"/>
							<s:iterator value="cercPetitionDeficienciesList" status="rowstatus">
								<s:if test='status=="Y"'>
									<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
<%-- 										<td><s:if test = "refChecklistId.description == 'b) reason why the commission has jurisdiction to try, entertain and dispose of the petition.' or refChecklistId.description == 'c) Whether the petition is filed within the time limit prescribed in the limitation Act 1963, and if not, the period of delay and whether the petitioner is seeking condonation of delay.' or refChecklistId.description == 'd) any other reason'"></s:if><s:else><s:property value="#rowstatus.count"/></s:else></td> --%>
										<td><s:property value="#rowstatus.count"/></td>
<%-- 										<td><s:property value="refChecklistId.checklistName"/></td> --%>
<!-- 										25-04-2020 start SH -->
<!-- condition is to be edited for if -->
														
										<td><s:if test = "refChecklistId.description == 'a) the statutory provision under which the petition is being filed before the commission.'">The Petition does mention:<br/><br/><s:property value="refChecklistId.description"/></s:if><s:else><s:property value="refChecklistId.description"/></s:else></td>
										
<!-- 										25-04-2020 end SH -->
										<td><s:date name="notificationDate" format="dd/MM/yyyy kk:mm"/></td>
										<s:if test="cercPetition.cercUserPetitionerId.id!=1 and cureDate==null and (#session.CERC_USER.refOrganisationId==null or #session.CERC_USER.refOrganisationId.id!=1)">
											<td>
												<s:hidden name="notifiedDeficiencyList[%{#outstatus.index}].cercPetitionDeficienciesList[%{#rowstatus.index}].id"/>
												<s:hidden name="notifiedDeficiencyList[%{#outstatus.index}].cercPetitionDeficienciesList[%{#rowstatus.index}].refChecklistId.id"/>
												<s:radio list="#{'Y':'Exist','N':'Not Exist'}" name="notifiedDeficiencyList[%{#outstatus.index}].cercPetitionDeficienciesList[%{#rowstatus.index}].status" id="checkStatus" theme="simple" />
											</td>
										</s:if>
										<s:else>
											<td>
												<s:radio list="#{'Y':'Exist','N':'Not Exist'}" name="notifiedDeficiencyList[%{#outstatus.index}].cercPetitionDeficienciesList[%{#rowstatus.index}].status" id="checkStatus" theme="simple" disabled="true"/>
											</td>
										</s:else>
									</tr>
								</s:if>
							</s:iterator>
						</s:iterator>
					</table>
				</td>
			</tr>
			<s:if test="cercPetition.cercUserPetitionerId.id!=1">
				<tr class="subheading">
					<td colspan="7">Attachment</td>
				</tr>
					<tr valign="top">
					<td>Document Type</td>
					<td>:</td>
					<td colspan="5">
						<div class="fidRepeat">
							<s:select list="refDocumentList" name="fileUploadName" listKey="id" listValue="documentName" id="refDocumentId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:142pt"/>
							&nbsp;<s:textfield type="text" size="24" name="documentDescription" id="documentDescription"/>
							&nbsp;<s:file name="fileUpload" id="attachedDocument" label="Select a File to upload" size="40"/>
							<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>								        	
							<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
						</div>
						<span class="tooltip">(pdf files only)</span>
						<br/>
						<br/>
						<span class="tooltip">Note : Consolidated, uploaded documents size should not exceed 300 MB.</span>
						<br/>
				        <br/>	
				<span class="tooltip">Note : File name should not contain any space.</span>	
					</td>				
				</tr>
			</s:if>
		</s:if>
		<tr>
			<td colspan="7"></td>
		</tr>
		<tr>
			<td colspan="7" align="right">
<%-- 				<s:if test="cercPetition.cercUserPetitionerId.id!=1 and #session.CERC_USER.refOrganisationId.id!=1"> --%>
				<s:if test="#session.CERC_USER.refOrganisationId==null or #session.CERC_USER.refOrganisationId.id!=1">
					<input type="submit" id="submitbutton" name="submitbutton" value="Submit" class="formbutton" />&nbsp;&nbsp;
					<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
					<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="petitionerDeficienciesList"/>
				</s:if>
               <s:else>
               <s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="petitionerDeficienciesList"/>
               </s:else>
								
			</td>
		</tr>
 	</table>
	<s:token/>
</s:form>
<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
	function reportWindow(event) {
		winddd = window.open(event,"report",'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no');
		winddd.focus();
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
	$(document).ready(function() 
	{
		$("input[name='submitbutton']").click(function()
		{
			//defactsList[%{#rowstatus.index}].checkStatus
			var lisize=(<s:property value="defactsList.size"/>);
			//alert("abc" +lisize);
			var counter=0;
			//alert(document.getElementByName("defactsList[0].checkStatus").value);
			//alert($("input[name='defactsList[0].checkStatus']:checked").val());
			
	        for (var i = 0; i < lisize; i++) 
	        {
	        	if($("input[name='defactsList["+i+"].checkStatus']:checked").val()=='Y')
	        	{
	        		counter=1;
	        		break;
	        	}	
	        }
	        if(counter==0)
	        {
	        	alert("Please check at least one defect.");
	        	return false;
	        } 
	        else if($('#description').val()=="")
			{
				alert("Please enter description in brief.");
				$('#description').focus();
				return false;
			}
		});
		
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
</script>
<s:form theme="simple" name="deficiencyPetitionDetails" action="deficiencyPetitionDetailsSave" method="post" enctype="multipart/form-data">
<s:hidden name="pleadingBeanId"/>
 	<table border = "0">
	 		<tr>
	 			<th colspan="7" class="mainheading">Add Deficiencies</th>
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
		<tr class="subheading"  valign="top">
			<td colspan="7">Add Deficiencies</td>
		</tr>
		<s:if test="defactsList.size()>0">
			<tr>
				<td colspan="7">
					<table>
						<tr class="subheading" align="center">
							<td width="5%">S. No.</td>
<!-- 							<td width="10%">Name</td> -->
							<td width="73%">Description</td>
							<td width="12%">Deficiency Exists</td>
						</tr>
						<s:iterator value="defactsList" status="rowstatus">
							<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
								<td><s:if test = "#rowstatus.count != 3 and #rowstatus.count != 4 and #rowstatus.count != 5 and #rowstatus.count != 6"><s:property value="#rowstatus.count == 1 or #rowstatus.count == 2 ? #rowstatus.count : (#rowstatus.count - 4)"/></s:if> </td>
<%-- 								<td><s:property value= "#rowstatus.count"/></td> --%>
<%-- 								<td><s:property value="refChecklistId.checklistName"/></td> --%>
								<td><s:property value="refChecklistId.description"/></td>
								<td>
									<s:hidden name="defactsList[%{#rowstatus.index}].id"/>
									<s:hidden name="defactsList[%{#rowstatus.index}].refChecklistId.id"/>
									<s:if test = "#rowstatus.count != 2">
<%-- 									<s:radio list="#{'Y':'Yes','N':'No','A':'NA'}" name="defactsList[%{#rowstatus.index}].checkStatus" id="checkStatus" theme="simple" /> --%>
									<s:radio list="#{'Y':'Exist','N':'Not Exist'}" name="defactsList[%{#rowstatus.index}].checkStatus" id="checkStatus" theme="simple" />
									</s:if>
								</td>
							</tr>
						</s:iterator>
					</table>
				</td>
			<tr>	
		</s:if>
		<tr valign="top">
			<td>Remark<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<textarea name="description"  id="description" style="width:500pt"  cols="1000"></textarea>
			</td>								
		</tr>
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
				<span class="tooltip">(pdf,doc,excel files only)</span>
				<br/>
				<br/>
				<span class="tooltip">Note : Consolidated, uploaded documents size should not exceed 300 MB.</span>	
				<br/>
				<br/>	
				<span class="tooltip">Note : File name should not contain any space.</span>
			</td>				
		</tr>
		<tr>
			<td colspan="7" align="right">
				<input type="submit" id="submitbutton" name="submitbutton" value="Submit" class="formbutton" />&nbsp;&nbsp;
				<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="deficiencyPetitionDetailsFacade"/>				
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
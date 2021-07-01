
<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
	$(document).ready(function() {
		$(".response").hide();
		$(".delete").hide();
		$(".reply").hide();
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
			
			if($('#cercPetitionPartyDetailsId').val()=="")
			{
				alert("Please select party name.");
				$('#cercPetitionPartyDetailsId').focus();
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
						if (fileExtension!="pdf" || fUpload[i].value=="" || fUploadName[i].value=="")
						{
							alert("Please select / upload PDF document only.")
							return false
						}
					}
					
					if($('[name=fileUploadName]').val()==-1 && $('[name=documentDescription]').val()==""){
						alert("Please specify the document name");
						$('#documentDescription').focus();
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
<s:form theme="simple" name="pleadingRejoinderDetails" action="pleadingRejoinderDetailsSave" method="post" enctype="multipart/form-data">
<s:hidden name="pleadingBeanId"/>
<s:hidden name="pleadingId"/>
 	<table border = "0">
 		<tr>
			<th colspan="7" class="mainheading">Rejoinder / Response</th>
		</tr>
		<s:include value="/jsp/pleadings/pleadingPetitionDetails.jsp"></s:include>
										
		<tr valign="top">
			<tr class="subheading">
			<td colspan="7">Details</td>
		</tr>
		
<%-- 		<tr valign="top">
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td colspan="5">
			<s:radio list="#{'J':'Rejoinder','S':'Response'}" name="isRejoinderOrResponse" id="isRejoinderOrResponse"/>
			</td>								
		</tr>
 --%>		
 		<s:hidden name="isRejoinderOrResponse"/>
 		<tr>
			<td>Party Name<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<%-- <s:select list="cercPetitionPartyDetailsList" name="cercPetitionPartyDetailsId" id="cercPetitionPartyDetailsId" listKey="id" listValue="partyName" headerKey="" headerValue="- Select -"  cssStyle="width:142pt"/> --%>
				<s:property value="cercPetitionPartyDetails.cercUserId.firstName"/>
			<s:hidden name="cercPetitionPartyDetailsId" value="%{cercPetitionPartyDetails.id}"/>
			</td>											
		</tr>
		<tr>
			<s:if test="isRejoinderOrResponse=='J'">
			<td>Rejoinder to reply dated</td>
			</s:if>
			<s:else>
			<td>Response to comments dated</td>
			</s:else>
			<td>:</td>
			<td colspan="5">
				<!-- <input type="text" name="commentDate"  id="commentDate" class="tcal" value="" /> -->
				<s:date name="cercPetitionReply.dateOfFiling" format="dd/MM/yyyy"/>
			</td>								
		</tr>
		<tr>
			<s:if test="isRejoinderOrResponse=='J'">
			<td>Reply Filed By</td></s:if>
			<s:else>
			<td>Comment Filed By</td>
			</s:else>
			<td>:</td>
			<td colspan="5">
				<!-- <input type="text" name="commentDate"  id="commentDate" class="tcal" value="" /> -->
				<s:if test="cercPetitionReply.cercPetitionPartyDetailsId!=null">
				<s:if test="cercPetitionReply.cercPetitionPartyDetailsId.cercUserId!=null">
				<s:property value="cercPetitionReply.cercPetitionPartyDetailsId.cercUserId.firstName"/>
				</s:if>
				<s:else>
				<s:property value="cercPetitionReply.cercPetitionPartyDetailsId.partyName"/>
				</s:else>
				</s:if>
				<s:else>
				<s:property value="cercPetitionReply.partyName"/>
				</s:else>
			</td>								
		</tr>
		<tr>
			<td>Date of filing<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<s:date name="dateOfFiling" format="dd/MM/yyyy" var="dateOfFilingFormat"/>
				<s:textfield name="dateOfFiling" id="dateOfFiling" cssClass="tcal" value="%{#dateOfFilingFormat}"/>&nbsp;<span class="tooltip">(dd/mm/yyyy)</span>
			</td>								
		</tr>
		<s:if test="cercPetitionReplyBeanList.size>0">
		<tr>
			<td>Copy To other Reply</td>
			<td>:</td>
			<td colspan="5">
			<s:checkbox name="rejoinderCopyToReplies" id="rejoinderCopyToReplies"/>
			</td>								
		</tr>
		<tr class="reply">
			<td colspan="7">
			<table>
			<tr>
			<th colspan="3" class="mainheading">Replies</th>
			</tr>
			<tr class="subheading">
			<td width="60%">Filed By</td>
			<td width="30%">Filed On</td>
			<td width="10%">Copy To</td>
			</tr>
			<s:iterator value="cercPetitionReplyBeanList" status="rowstatus">
			<s:hidden name="cercPetitionReplyBeanList[%{#rowstatus.index}].cercPetitionReply.id"/>
			<tr>
			<td>
				<s:if test="cercPetitionReply.cercPetitionPartyDetailsId.cercUserId!=null">
					<s:if test="cercPetitionReply.cercPetitionPartyDetailsId.cercUserId.userType=='O'">
						<s:property value="cercPetitionReply.cercPetitionPartyDetailsId.cercUserId.firstName"/> (<s:property value="cercPetitionReply.cercPetitionPartyDetailsId.cercUserId.lastName"/>)
					</s:if>
					<s:else>
					<s:property value="cercPetitionReply.cercPetitionPartyDetailsId.cercUserId.firstName"/> <s:property value="cercPetitionReply.cercPetitionPartyDetailsId.cercUserId.middleName"/> <s:property value="cercPetitionReply.cercPetitionPartyDetailsId.cercUserId.lastName"/>
					</s:else>
				</s:if>
				<s:else>
					<s:property value="cercPetitionReply.cercPetitionPartyDetailsId.partyName"/>
				</s:else>
			</td>
			<td><s:date name="cercPetitionReply.dateOfFiling" format="dd/MM/yyyy"/></td>
			<td><s:checkbox name="cercPetitionReplyBeanList[%{#rowstatus.index}].copyTo" id="cercPetitionReplyBeanList[%{#rowstatus.index}].copyTo"/></td>
			</tr>
			</s:iterator>
			</table>
			</td>								
		</tr>
		</s:if>
		<!-- <tr valign="top">
			<td>Description</td>
			<td>:</td>
			<td colspan="5">
				<textarea name="description"  id="description" style="width:500pt"  cols="1000"></textarea>
			</td>								
		</tr> -->
		<tr class="subheading" >
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
				<span class="tooltip">(pdf files only)</span>
				<br/>
				<br/>
				<span class="tooltip">Note : Consolidated, uploaded documents size should not exceed 100 MB.</span>			
			</td>				
		</tr>
		<tr>
			<td colspan="7" align="right">
				<input type="submit" id="submitbutton" name="submitbutton" value="Submit" class="formbutton" onclick="return chkValidation(<s:property value="cercPetitionReplyBeanList.size"/>);"/>&nbsp;&nbsp;
				<input type="reset" id="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="pleadingList"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	

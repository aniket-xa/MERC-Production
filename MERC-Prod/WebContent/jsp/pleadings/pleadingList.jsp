<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<script type="text/javascript">
	$(document).ready(function() {
					
		if ($("#searchBy").val() == "1") {
			$("#refPetitionTypeId").prop('disabled', 'disabled');
			$("#searchedPetitionNumber").removeAttr("disabled");
			$("#searchedPetitionYear").removeAttr("disabled");
			$("#searchbutton").removeAttr("disabled");
			$("#searchedPetitionNumber").focus();
		}
		else if ($("#searchBy").val() == "2") {
			$("#refPetitionTypeId").removeAttr("disabled");
			$("#searchedPetitionNumber").removeAttr("disabled");
			$("#searchedPetitionYear").removeAttr("disabled");
			$("#searchbutton").removeAttr("disabled");
			$("#refPetitionTypeId").focus();
		}
		else{
			$("#refPetitionTypeId").prop('disabled', 'disabled');
			$("#searchedPetitionNumber").prop('disabled', 'disabled');
			$("#searchedPetitionYear").prop('disabled', 'disabled');
			$("#searchbutton").prop('disabled', 'disabled');
		}
	
		$("#searchBy").change(function () {
			if ($(this).val() == "1") {
				$("#refPetitionTypeId").val("");	
				$("#refPetitionTypeId").prop('disabled', 'disabled');
				$("#searchedPetitionNumber").removeAttr("disabled");
				$("#searchedPetitionYear").removeAttr("disabled");
				$("#searchbutton").removeAttr("disabled");
				$("#searchedPetitionNumber").focus();
			}
			else if ($(this).val() == "2") {
				$("#refPetitionTypeId").removeAttr("disabled");
				$("#searchedPetitionNumber").removeAttr("disabled");
				$("#searchedPetitionYear").removeAttr("disabled");
				$("#searchbutton").removeAttr("disabled");
				$("#refPetitionTypeId").focus();
			}
			else{
				$("#refPetitionTypeId").prop('disabled', 'disabled');
				$("#searchedPetitionNumber").prop('disabled', 'disabled');
				$("#searchedPetitionYear").prop('disabled', 'disabled');
				$("#searchbutton").prop('disabled', 'disabled');
			}				
		});
		$("input[name='searchbutton']").click(function(){
			var filter = /^([0-9]+)$/;
			
			if ($("#searchBy").val() == "1")
			{
				if(filter.test($('#searchedPetitionNumber').val())==false)
				{					
					alert("Diary Number should be numeric.");
					$('#searchedPetitionNumber').focus();
					return false;
				}
				else if($('#searchedPetitionYear').val()=="")
				{
					alert("Please select diary year.");
					$('#searchedPetitionYear').focus();
					return false;
				}
			}
			else if ($("#searchBy").val() == "2")
			{
				if($("#refPetitionTypeId").val()=="")
				{
					alert("Please select petition type.");
					$("#refPetitionTypeId").focus();
					return false;
				}
				else if(filter.test($('#searchedPetitionNumber').val())==false)
				{
					alert("Petition Number should be numeric.");
					$('#searchedPetitionNumber').focus();
					return false;
				}
				else if($('#searchedPetitionYear').val()=="")
				{
					alert("Please select registration year.");
					$('#searchedPetitionYear').focus();
					return false;
				}
						
			}
		});
		
	});  
function validateNumber(sNumber)
{
	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if (filter.test(sEmail)) {
		return true;
	}
	else {
		return false;
	}
}
	      	
</script>
<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Additional Filing</th>
		</tr>
		<tr>
			<td colspan="7">
				<s:form theme="simple" name="searchPetition" action="searchPetition">
					<table border = "0">
						<tr>
							<td>
								Search By&nbsp;:&nbsp;
								<s:select list="#{1:'Diary Number',2:'Petition Number'}" name="searchBy" id="searchBy" headerKey="" headerValue="- Select -" theme="simple" cssStyle="width:115pt" value="%{2}"/>
								&nbsp;&nbsp;Type&nbsp;:&nbsp;
								<s:select list="refPetitionTypeList" name="refPetitionType.id" id="refPetitionTypeId" listKey="id" listValue="petitionType+'  ('+petitionTypeCode+')'" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/>
								&nbsp;&nbsp;Number&nbsp;:&nbsp;<s:textfield size="8" name="searchedPetitionNumber" id="searchedPetitionNumber"/>
								&nbsp;&nbsp;Year&nbsp;:&nbsp;
								<s:select name="searchedPetitionYear" id="searchedPetitionYear" list="yearList" headerValue="- Select -" headerKey="" cssStyle="width:60pt"/>
								&nbsp;&nbsp;
								<input type="submit" name="searchbutton" id="searchbutton" value="Search" class="formbutton" />	
							</td>	
						</tr>		
					</table>
					<s:token/>
				</s:form>
			</td>
		</tr>
</table>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:if test="cercPetition!=null">
<s:include value="/jsp/tiles/tabsPleading.jsp"></s:include>
<s:form theme="simple" name="pleadingList">
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Pleading List</th>
		</tr>
		<s:include value="/jsp/pleadings/pleadingPetitionDetails.jsp"></s:include>
<%-- 		<s:if test="#session.CERC_USER.userType!='I'"> --%>
		<tr>
			<td colspan="7">
				<display:table export="false" id="pleadings" name="pleadingList" pagesize="20" requestURI="">
				<s:if test="%{#attr.pleadings.pleading_text.indexOf('Correspondence')==0}">
						<s:url action="viewCommunication" var="viewReplyCommentRejoinder">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="pleadingType" value="%{#attr.pleadings.is_reply_or_comment}"/>
							<s:param name="pleadingId" value="%{#attr.pleadings.pleading_id}"/>
							<s:param name="pleadingBeanId" value="%{#attr.pleadings.cerc_petition_id}"/>
						</s:url>
				</s:if>
				<s:else>
						<s:url action="viewReplyCommentRejoinder" var="viewReplyCommentRejoinder">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="pleadingType" value="%{#attr.pleadings.is_reply_or_comment}"/>
							<s:param name="pleadingId" value="%{#attr.pleadings.pleading_id}"/>
							<s:param name="pleadingBeanId" value="%{#attr.pleadings.cerc_petition_id}"/>
						</s:url>
				</s:else>
						<display:column title="Reference No." sortable="true">
						<s:url action="openReferenceAcknowledgement" var="openReferenceAcknowledgement">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="pleadingType" value="%{#attr.pleadings.is_reply_or_comment}"/>
							<s:param name="filingBeanId" value="%{#attr.pleadings.cerc_petition_id}"/>
							<s:param name="pleadingId" value="%{#attr.pleadings.pleading_id}"/>
						</s:url>
							<s:a href="%{openReferenceAcknowledgement}">
								<s:property value="%{#attr.pleadings.pleading_reference_number}"/>
							</s:a>
						</display:column>
						<display:column title="Nature of Document" sortable="true">
						<s:a href="%{viewReplyCommentRejoinder}">
								<s:property value="%{#attr.pleadings.pleading_text}"/>
							</s:a>
						</display:column>
						<display:column property="party_name" title="Party Name" sortable="true"/>
						<display:column property="order_date" format="{0,date,dd/MM/yyyy}" title="Compliance Date" sortable="true" style="color: red;"/>
						<%-- <display:column property="updated_by" title="Added By" sortable="true"/> --%>
						<display:column property="updated_on" format="{0,date,dd/MM/yyyy}" title="Added On" sortable="true"/>
						<display:column title="Action" sortable="false">
						<s:url action="pleadingAdditionalInformationDetails" var="pleadingAdditionalInformationDetails">
								<s:param name="struts.token.name">token</s:param>
								<s:param name="token" value="token"/>
								<s:param name="pleadingId" value="%{#attr.pleadings.pleading_id}"/>
								<s:param name="pleadingBeanId" value="%{#attr.pleadings.cerc_petition_id}"/>
						</s:url>
						<s:if test='cercPetitionPartyDetails!=null and (cercPetitionPartyDetails.partyType.trim()=="P" or cercPetitionPartyDetails.partyType.trim()=="OP")'>
							<s:url action="pleadingRejoinderDetails" var="pleadingRejoinderDetails">
								<s:param name="struts.token.name">token</s:param>
								<s:param name="token" value="token"/>
								<s:param name="isRejoinderOrResponse" value="%{#attr.pleadings.is_reply_or_comment}"/>
								<s:param name="pleadingId" value="%{#attr.pleadings.pleading_id}"/>
								<s:param name="pleadingBeanId" value="%{#attr.pleadings.cerc_petition_id}"/>
							</s:url>
							<s:if test="%{#attr.pleadings.pleading_text.indexOf('Reply')==0}">
							<s:a href="%{pleadingRejoinderDetails}">Rejoinder</s:a>
							</s:if>
							<s:elseif test="%{#attr.pleadings.pleading_text.indexOf('Comment')==0}">
							<s:a href="%{pleadingRejoinderDetails}">Response</s:a>
							</s:elseif>
							<s:elseif test="%{#attr.pleadings.pleading_text.indexOf('Correspondence')==0}">
							<s:a href="%{pleadingAdditionalInformationDetails}">Compliance</s:a>
							</s:elseif>
						</s:if>
						<s:elseif test="%{#attr.pleadings.pleading_text.indexOf('Correspondence')==0}">
							<s:a href="%{pleadingAdditionalInformationDetails}">Compliance</s:a>
							</s:elseif>
						</display:column>
					</display:table>
				
				
				<%-- <table border = "0">
					<tr class="subheading">
						<td width="4%">#</td>
						<td width="20%">Nature of Document</td>
						<td width="32%">Party Name</td>
						<!-- <td width="46%">Brief</td> -->
						<td width="10%">Order Date</td>
						<td width="20%">Added By</td>
						<td width="10%">Added On</td>
						<td width="4%">Action</td>
											
					</tr>
					<s:if test="cercPetitionReplyList.size>0">
					<s:iterator value="cercPetitionReplyList" status="rowstatus">
					<tr>
						<s:url action="viewReplyCommentRejoinder" var="viewReplyCommentRejoinder">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="pleadingType" value="isReplyOrComment"/>
							<s:param name="pleadingId" value="id"/>
							<s:param name="pleadingBeanId" value="cercPetitionId.id"/>
						</s:url>
						<td style="color: #109610"><s:a href="%{viewReplyCommentRejoinder}"><s:property value="#rowstatus.count"/></s:a></td>
						<td style="color: <s:if test="isReplyOrComment=='C'">#0000FF</s:if><s:else>#109610</s:else>">
						<s:if test="isReplyOrComment=='C'">Comment</s:if><s:else>Reply</s:else>
						</td>
						<td style="color: <s:if test="isReplyOrComment=='C'">#0000FF</s:if><s:else>#109610</s:else>">
						<s:if test="cercPetitionPartyDetailsId==null">
						<s:property value="partyName"/> (<s:property value="updatedBy.firstName"/>)
						</s:if>
						<s:else>
						<s:property value="cercPetitionPartyDetailsId.cercUserId.firstName"/> <s:property value="cercPetitionPartyDetailsId.cercUserId.lastName"/> (<s:property value="cercPetitionPartyDetailsId.partyType"/>)
						</s:else>
						</td>
						<td style="color: <s:if test="isReplyOrComment=='C'">#0000FF</s:if><s:else>#109610</s:else>"><s:property value="description"/></td>
						<td style="color: <s:if test="isReplyOrComment=='C'">#0000FF</s:if><s:else>#109610</s:else>"><s:date name="orderDate" format="dd/MM/yyyy"/></td>
						<td style="color: <s:if test="isReplyOrComment=='C'">#0000FF</s:if><s:else>#109610</s:else>"><s:property value="updatedBy.firstName"/> (<s:property value="updatedBy.userType"/>)</td>
						<td style="color: <s:if test="isReplyOrComment=='C'">#0000FF</s:if><s:else>#109610</s:else>"><s:date name="updatedOn" format="dd/MM/yyyy"/></td>
						<td style="color: <s:if test="isReplyOrComment=='C'">#0000FF</s:if><s:else>#109610</s:else>">
						<s:if test='cercPetitionPartyDetails!=null && (cercPetitionPartyDetails.partyType.trim()=="P" or cercPetitionPartyDetails.partyType.trim()=="OP")'>
							<s:url action="pleadingRejoinderDetails" var="pleadingRejoinderDetails">
								<s:param name="struts.token.name">token</s:param>
								<s:param name="token" value="token"/>
								<s:param name="isRejoinderOrResponse" value="isReplyOrComment"/>
								<s:param name="pleadingId" value="id"/>
								<s:param name="pleadingBeanId" value="cercPetitionId.id"/>
							</s:url>
							<s:a href="%{pleadingRejoinderDetails}">
								<s:if test="isReplyOrComment=='R'">Rejoinder</s:if><s:else>Response</s:else>
							</s:a>
						</s:if>	
						</td>												
					</tr>
					</s:iterator>
					</s:if>
					<s:if test="cercPetitionSubmissionList.size>0">
					<s:iterator value="cercPetitionSubmissionList" status="rowstatus">
					<tr>
						<s:url action="viewReplyCommentRejoinder" var="viewReplyCommentRejoinder">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="pleadingType">Sub</s:param>
							<s:param name="pleadingId" value="id"/>
							<s:param name="pleadingBeanId" value="cercPetitionId.id"/>
						</s:url>
						<td style="color: #663300"><s:a href="%{viewReplyCommentRejoinder}"><s:property value="%{cercPetitionReplyList.size()+#rowstatus.count}"/></s:a></td>
						<td style="color: #663300">Submission</td>
						<td style="color: #663300"><s:property value="cercPetitionPartyDetailsId.cercUserId.firstName"/> <s:property value="cercPetitionPartyDetailsId.cercUserId.lastName"/> (<s:property value="cercPetitionPartyDetailsId.partyType"/>)</td>
						<td style="color: #663300"><s:property value="description"/></td>
						<td style="color: #663300"><s:date name="orderDate" format="dd/MM/yyyy"/></td>
						<td style="color: #663300"><s:property value="updatedBy.firstName"/></td>
						<td style="color: #663300"><s:date name="updatedOn" format="dd/MM/yyyy"/></td>
						<td style="color: #663300">&nbsp;</td>												
					</tr>
					</s:iterator>
					</s:if>
					<s:if test="cercPetitionAdditionalInformationList.size>0">
					<s:iterator value="cercPetitionAdditionalInformationList" status="rowstatus">
					<tr>
						<s:url action="viewReplyCommentRejoinder" var="viewReplyCommentRejoinder">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="pleadingType">Add</s:param>
							<s:param name="pleadingId" value="id"/>
							<s:param name="pleadingBeanId" value="cercPetitionId.id"/>
						</s:url>
						<td style="color: #EC1C1C"><s:a href="%{viewReplyCommentRejoinder}"><s:property value="%{cercPetitionReplyList.size()+cercPetitionSubmissionList.size()+#rowstatus.count}"/></s:a></td>
						<td style="color: #EC1C1C">Additional Information</td>
						<td style="color: #EC1C1C"><s:property value="cercPetitionPartyDetailsId.cercUserId.firstName"/> <s:property value="cercPetitionPartyDetailsId.cercUserId.lastName"/> (<s:property value="cercPetitionPartyDetailsId.partyType"/>)</td>
						<td style="color: #EC1C1C"><s:property value="description"/></td>
						<td style="color: #EC1C1C"><s:date name="orderDate" format="dd/MM/yyyy"/></td>
						<td style="color: #EC1C1C"><s:property value="updatedBy.firstName"/></td>
						<td style="color: #EC1C1C"><s:date name="updatedOn" format="dd/MM/yyyy"/></td>
						<td style="color: #EC1C1C">&nbsp;</td>												
					</tr>
					</s:iterator>
					</s:if>
					<s:if test="cercPetitionRejoinderList.size>0">
					<s:iterator value="cercPetitionRejoinderList" status="rowstatus">
					<tr>
						<s:url action="viewReplyCommentRejoinder" var="viewReplyCommentRejoinder">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="pleadingType"><s:if test="isRejoinderOrResponse=='J'">Rej</s:if><s:else>Res</s:else></s:param>
							<s:param name="pleadingId" value="id"/>
							<s:param name="pleadingBeanId" value="cercPetitionId.id"/>
						</s:url>
						<td style="color: <s:if test="pleadingType=='J'">#106610</s:if><s:else>#000064</s:else>"><s:a href="%{viewReplyCommentRejoinder}"><s:property value="%{cercPetitionReplyList.size()+cercPetitionSubmissionList.size()+cercPetitionAdditionalInformationList.size()+#rowstatus.count}"/></s:a></td>
						<td style="color: <s:if test="pleadingType=='J'">#106610</s:if><s:else>#000064</s:else>"><s:if test="isRejoinderOrResponse=='J'">Rejoinder</s:if><s:else>Response</s:else></td>
						<td style="color: <s:if test="pleadingType=='J'">#106610</s:if><s:else>#000064</s:else>"><s:property value="cercPetitionPartyDetailsId.cercUserId.firstName"/> <s:property value="cercPetitionPartyDetailsId.cercUserId.lastName"/> (<s:property value="cercPetitionPartyDetailsId.partyType"/>)</td>
						<td style="color: <s:if test="pleadingType=='J'">#106610</s:if><s:else>#000064</s:else>"><s:property value="description"/></td>
						<td style="color: <s:if test="pleadingType=='J'">#106610</s:if><s:else>#000064</s:else>"><s:date name="orderDate" format="dd/MM/yyyy"/></td>
						<td style="color: <s:if test="pleadingType=='J'">#106610</s:if><s:else>#000064</s:else>"><s:property value="updatedBy.firstName"/></td>
						<td style="color: <s:if test="pleadingType=='J'">#106610</s:if><s:else>#000064</s:else>"><s:date name="updatedOn" format="dd/MM/yyyy"/></td>
						<td style="color: <s:if test="pleadingType=='J'">#106610</s:if><s:else>#000064</s:else>">&nbsp;</td>												
					</tr>
					</s:iterator>
					</s:if>
					
				</table> --%>
</td>
</tr>

<!-- 05-05-2020 start SH -->
<s:if test='(cercPetitionPartyDetails!=null or ((#session.CERC_USER.refOrganisationId.id==1 and #session.CERC_USER.refRoleId.roleCode=="AD") or (#session.CERC_USER.refDivisionId.divisionCode.trim()!=null and (#session.CERC_USER.refDivisionId.divisionCode.trim()=="8" or #session.CERC_USER.refDivisionId.divisionCode.trim()=="12"))))'>
<!-- 05-05-2020 end SH -->
<s:if test="pleadingList.size()>0">
		<tr>
			<td valign="top" colspan="7" align="right">
			<s:a id="reportWindow" onclick="reportWindow('/run?__report=pleadingList.rptdesign&petitionId=%{cercPetition.id}&userId=%{#session.CERC_USER.id}&adminId=%{#session.CERC_USER.refOrganisationId.updatedBy.id}');" href="#">
			<input type="button" id="printbutton" name="printbutton" value="Print" class="formbutton"/></s:a>&nbsp;
			<s:a action="filingSummary">
					<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="filingBeanId" value="pleadingBeanId"/>
					<input type="button" id="printbutton" name="printbutton" value="Back to Summary Page" class="formbutton"/>
				</s:a>
			</td>											
		</tr>
</s:if>
<s:else>
		<tr>
			<td valign="top" colspan="7" align="right">
			<s:a action="filingSummary">
					<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="filingBeanId" value="pleadingBeanId"/>
					<input type="button" id="printbutton" name="printbutton" value="Back to Summary Page" class="formbutton"/>
				</s:a>
			</td>
		</tr>
</s:else>
<!-- 05-05-2020 start SH -->
</s:if>
<s:else>
		<tr>
			<td valign="top" colspan="7" align="right">
			<s:a action="pleadingList">
					<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<input type="button" id="printbutton" name="printbutton" value="Back" class="formbutton"/>
				</s:a>
			</td>
		</tr>
</s:else>
<!-- 05-05-2020 end SH -->
<%-- </s:if> --%>
<s:else>

<s:if test='(cercPetitionPartyDetails!=null or ((#session.CERC_USER.refOrganisationId.id==1 and #session.CERC_USER.refRoleId.roleCode=="AD") or (#session.CERC_USER.refDivisionId.divisionCode.trim()!=null and (#session.CERC_USER.refDivisionId.divisionCode.trim()=="8" or #session.CERC_USER.refDivisionId.divisionCode.trim()=="12"))))'>

		<tr>
			<td valign="top" colspan="7" align="right">
			<s:a action="filingSummary">
					<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="filingBeanId" value="pleadingBeanId"/>
					<input type="button" id="printbutton" name="printbutton" value="Back to Summary Page" class="formbutton"/>
				</s:a>
			</td>
		</tr>

</s:if>
<s:else>
		<tr>
			<td valign="top" colspan="7" align="right">
			<s:a action="pleadingList">
					<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<input type="button" id="printbutton" name="printbutton" value="Back" class="formbutton"/>
				</s:a>
			</td>
		</tr>
</s:else>
</s:else>
</table>	
</s:form>
</s:if>
<%-- <s:else>
		<tr align="center">
		<td colspan="7"><span class="required">Petition not found</span></td>
		</tr>
</s:else>
 --%><br/>
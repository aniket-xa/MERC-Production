<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<script type="text/javascript">
$(document).ready(function() {	
}); 
</script>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Pleading Hard Copy Details</th>
		</tr>
</table>
<s:form theme="simple" name="viewPleadingHardCopyRecieved" action="viewPleadingHardCopyRecievedDateSave">
<s:hidden name="filingBeanId1"/>
<s:hidden name="pleadingId"/>
<s:hidden name="divisionCode"/>
	<table border="0">
<%-- 		<s:if test="hasActionMessages()">
			<tr align="left">
				<td colspan="8"><span class="required"><s:actionmessage/></span></td>
			</tr>
		</s:if>
 --%>			<tr>
		<td colspan="7">
			<table border="1" cellspacing="0" cellpadding="0">
				<tr valign="top">
					<td width="20%">Reference No.</td>
					<td width="30%"><s:property value="cercPetition.referenceNumberDisplay"/></td>
					<td width="35%">Reference No. Generation Date</td>
					<td width="15%"><s:date name="cercPetition.referenceNumberGeneratedOn" format="dd/MM/yyyy"/></td>
				</tr>
				<tr valign="top">
					<td>Diary No.</td>
					<td><s:property value="cercPetition.diaryNumber"/>/<s:property value="cercPetition.diaryYear"/></td>
					<td>Diary No. Generation Date</td>
					<td><s:date name="cercPetition.filedOn" format="dd/MM/yyyy"/></td>
				</tr>
				<tr valign="top">
					<td>Petition No.</td>
					<td><s:property value="cercPetition.registrationNumberDisplay"/></td>
					<td>Petition No. Generation Date</td>
					<td><s:date name="cercPetition.registeredOn" format="dd/MM/yyyy"/></td>
				</tr>
			</table>
			</td>					
		</tr>
		<tr>
		<td width="15%">Petition Type</td>
		<td width="1%">:</td>
		<td width="*" colspan="5"><s:property value="cercPetition.refPetitionTypeId.petitionType"/> - <s:property value="cercPetition.refPetitionSubtypeId.petitionSubType"/></td>
		</tr>
		<tr>
		<td width="15%">Region</td>
		<td width="1%">:</td>
		<td width="*" colspan="5"><s:property value="cercPetition.refRegionId.region"/> </td>
		</tr>
		<tr>
		<td width="15%">Subject Keyword</td>
		<td width="1%">:</td>
		<td width="*" colspan="5"><s:property value="cercPetition.refSubjectId.subject"/> </td>
		</tr>
		<tr>
		<td width="15%">Subject</td>
		<td width="1%">:</td>
		<td width="*" colspan="5"><s:property value="cercPetition.subject"/> </td>
		</tr>
		<tr>
		<td width="15%">Petition Status</td>
		<td width="1%">:</td>
		<td width="*" colspan="5"><div class="blink" style="color: red;">
			<s:property value="cercPetition.refStatusId.refStatusPublicDomainId.statusName"/>
			<s:if test="cercPetition.refStatusId.isDivisionConcat==true">
			<s:if test="cercPetitionStatusDivisionList.size()>0">
			<s:iterator value="cercPetitionStatusDivisionList" status="rowstatus">
			<s:if test='refDivisionId.divisionCode==6 or refDivisionId.divisionCode==7'>
			<s:if test='cercPetitionStatusDivisionList.size()>1 and #rowstatus.count<cercPetitionStatusDivisionList.size()'>
			 <s:property value="refDivisionId.divisionName"/> and 
			 </s:if>
			 <s:else>
			 <s:property value="refDivisionId.divisionName"/>
			 </s:else>
			</s:if>
			</s:iterator>
			</s:if>
			</s:if>
			</div>
		</td>
		</tr>
		<tr><td colspan="7">

				<s:if test="dashboardAdditionalInformationDocuments.size()>0">
                      <table class="table table-striped responsive-utilities jambo_table bulk_action">
                      <tr class="headings">
                      	<th>Document Type</th>
                      	<th>File Name</th>
                      	<th>Updated By</th>
                      	<th>Updated On</th>
                      </tr>
                      <s:iterator value="dashboardAdditionalInformationDocuments" status="rowstatus">
                      <s:url action="viewPleadingDocument" var="viewPleadingDocument">
                      	<s:param name="pleadingId"><s:property value="cercPetitionAdditionalInformationId.id"/></s:param>
                      	<s:param name="filingBeanId" value="cercPetitionId.id" />
                      	<s:param name="fileName" value="fileName" />
                      	<s:param name="fileNameDisplay" value="fileNameDisplay" />
                      	<s:param name="divisionCode"><s:property value="divisionCode"/></s:param>
                      	<s:param name="constantName" value="%{'cercPleadingDocuments'}"/>
                      </s:url>
						<tr class="<s:if test="#rowstatus.even">even pointer</s:if><s:else>odd pointer</s:else>">
							<td><s:property value="refDocumentId.documentName"/></td>
							<td><s:a href="%{viewPleadingDocument}"><s:property value="fileNameDisplay"/></s:a></td>
							<td><s:property value="updatedBy.userName"/></td>
							<td><s:date name="updatedOn" format="dd/MM/yyyy"/></td>
						</tr>
						</s:iterator>
						</table>
                </s:if>
				<s:if test="dashboardSubmissionDocuments.size()>0">
                      <table class="table table-striped responsive-utilities jambo_table bulk_action">
                      <tr class="headings">
                      	<th>Document Type</th>
                      	<th>File Name</th>
                      	<th>Updated By</th>
                      	<th>Updated On</th>
                      </tr>
                      <s:iterator value="dashboardSubmissionDocuments" status="rowstatus">
                      <s:url action="viewPleadingDocument" var="viewPleadingDocument">
                      	<s:param name="pleadingId"><s:property value="cercPetitionSubmissionId.id"/></s:param>
                      	<s:param name="filingBeanId" value="cercPetitionId.id" />
                      	<s:param name="fileName" value="fileName" />
                      	<s:param name="fileNameDisplay" value="fileNameDisplay" />
                      	<s:param name="divisionCode"><s:property value="divisionCode"/></s:param>
                      	<s:param name="constantName" value="%{'cercPleadingDocuments'}"/>
                      </s:url>
						<tr class="<s:if test="#rowstatus.even">even pointer</s:if><s:else>odd pointer</s:else>">
							<td><s:property value="refDocumentId.documentName"/></td>
							<td><s:a href="%{viewPleadingDocument}"><s:property value="fileNameDisplay"/></s:a></td>
							<td><s:property value="updatedBy.userName"/></td>
							<td><s:date name="updatedOn" format="dd/MM/yyyy"/></td>
						</tr>
						</s:iterator>
						</table>
                </s:if>
				<s:if test="dashboardRejoinderDocuments.size()>0">
                      <table class="table table-striped responsive-utilities jambo_table bulk_action">
                      <tr class="headings">
                      	<th>Document Type</th>
                      	<th>File Name</th>
                      	<th>Updated By</th>
                      	<th>Updated On</th>
                      </tr>
                      <s:iterator value="dashboardRejoinderDocuments" status="rowstatus">
                      <s:url action="viewPleadingDocument" var="viewPleadingDocument">
                      	<s:param name="pleadingId"><s:property value="cercPetitionRejoinderId.id"/></s:param>
                      	<s:param name="filingBeanId" value="cercPetitionId.id" />
                      	<s:param name="fileName" value="fileName" />
                      	<s:param name="fileNameDisplay" value="fileNameDisplay" />
                      	<s:param name="divisionCode"><s:property value="divisionCode"/></s:param>
                      	<s:param name="constantName" value="%{'cercPleadingDocuments'}"/>
                      </s:url>
						<tr class="<s:if test="#rowstatus.even">even pointer</s:if><s:else>odd pointer</s:else>">
							<td><s:property value="refDocumentId.documentName"/></td>
							<td><s:a href="%{viewPleadingDocument}"><s:property value="fileNameDisplay"/></s:a></td>
							<td><s:property value="updatedBy.userName"/></td>
							<td><s:date name="updatedOn" format="dd/MM/yyyy"/></td>
						</tr>
						</s:iterator>
						</table>
                </s:if>
				<s:if test="dashboardReplyDocuments.size()>0">
                      <table class="table table-striped responsive-utilities jambo_table bulk_action">
                      <tr class="headings">
                      	<th>Document Type</th>
                      	<th>File Name</th>
                      	<th>Updated By</th>
                      	<th>Updated On</th>
                      </tr>
                      <s:iterator value="dashboardReplyDocuments" status="rowstatus">
                      <s:url action="viewPleadingDocument" var="viewPleadingDocument">
                      	<s:param name="pleadingId"><s:property value="cercPetitionReplyId.id"/></s:param>
                      	<s:param name="filingBeanId" value="cercPetitionId.id" />
                      	<s:param name="fileName" value="fileName" />
                      	<s:param name="fileNameDisplay" value="fileNameDisplay" />
                      	<s:param name="divisionCode"><s:property value="divisionCode"/></s:param>
                      	<s:param name="constantName" value="%{'cercPleadingDocuments'}"/>
                      </s:url>
						<tr class="<s:if test="#rowstatus.even">even pointer</s:if><s:else>odd pointer</s:else>">
							<td><s:property value="refDocumentId.documentName"/></td>
							<td><s:a href="%{viewPleadingDocument}"><s:property value="fileNameDisplay"/></s:a></td>
							<td><s:property value="updatedBy.userName"/></td>
							<td><s:date name="updatedOn" format="dd/MM/yyyy"/></td>
						</tr>
						</s:iterator>
						</table>
                </s:if>
				<s:if test="dashboardCommunicationDocuments.size()>0">
                      <table class="table table-striped responsive-utilities jambo_table bulk_action">
                      <tr class="headings">
                      	<th>Document Type</th>
                      	<th>File Name</th>
                      	<th>Updated By</th>
                      	<th>Updated On</th>
                      </tr>
                      <s:iterator value="dashboardCommunicationDocuments" status="rowstatus">
                      <s:url action="viewPleadingDocument" var="viewPleadingDocument">
                      	<s:param name="pleadingId"><s:property value="%{pleadingId}"/></s:param>
                      	<s:param name="filingBeanId" value="cercPetitionId.id" />
                      	<s:param name="fileName" value="fileName" />
                      	<s:param name="fileNameDisplay" value="fileNameDisplay" />
                      	<s:param name="divisionCode"><s:property value="divisionCode"/></s:param>
                      	<s:param name="constantName" value="%{'cercCorrespondenceDocuments'}"/>
                      </s:url>
						<tr class="<s:if test="#rowstatus.even">even pointer</s:if><s:else>odd pointer</s:else>">
							<td><s:property value="refDocumentId.documentName"/></td>
							<td><s:a href="%{viewPleadingDocument}"><s:property value="fileNameDisplay"/></s:a></td>
							<td><s:property value="updatedBy.userName"/></td>
							<td><s:date name="updatedOn" format="dd/MM/yyyy"/></td>
						</tr>
						</s:iterator>
						</table>
                </s:if>
                </td>
                </tr>
                <%-- <tr>
				<td colspan="7" align="right">
                <s:submit id="cancelbutton" name="cancelbutton" value="Back" class="formbutton" action="cercPetitionPleadingList"/>
                </td>
                </tr> --%>
            <tr>
			<td>Whether Hard Copy Recieved ?<%-- <span class="required">*</span> --%></td>
			<td>:</td>
			<td colspan="5">
				<%-- <s:radio list="refStatusList" name="cercPetition.refStatusId.id" id="refStatusId" listKey="id" listValue="statusName" theme="simple" value="cercPetition.refStatusId.id" />  --%>
			    <s:if test="dashboardAdditionalInformationDocuments.size()>0">
			    <s:property value="dashboardAdditionalInformationDetails.checkStatus" /><br>
			    <s:if test="#session.CERC_USER.refDivisionId.divisionCode.trim()==12">
			    <s:radio list="#{'Yes':'Yes','No':'No'}" name="checkStatus" id="checkStatus" theme="simple" value="dashboardAdditionalInformationDetails.checkStatus"/></s:if>
			    </s:if>
		        <s:if test="dashboardSubmissionDocuments.size()>0">
			    <s:property value="dashboardSubmissionDetails.checkStatus" /><br>
			    <s:if test="#session.CERC_USER.refDivisionId.divisionCode.trim()==12">
			    <s:radio list="#{'Yes':'Yes','No':'No'}" name="checkStatus" id="checkStatus" theme="simple" value="dashboardSubmissionDetails.checkStatus"/></s:if>
			    </s:if>
			    <s:if test="dashboardRejoinderDocuments.size()>0">
			    <s:property value="dashboardRejoinderDetails.checkStatus" /><br>
			    <s:if test="#session.CERC_USER.refDivisionId.divisionCode.trim()==12">
			    <s:radio list="#{'Yes':'Yes','No':'No'}" name="checkStatus" id="checkStatus" theme="simple" value="dashboardRejoinderDetails.checkStatus"/></s:if>
			    </s:if>
			    <s:if test="dashboardReplyDocuments.size()>0">
			    <s:property value="dashboardReplyDetails.checkStatus" /><br>
			    <s:if test="#session.CERC_USER.refDivisionId.divisionCode.trim()==12">
			    <s:radio list="#{'Yes':'Yes','No':'No'}" name="checkStatus" id="checkStatus" theme="simple" value="dashboardReplyDetails.checkStatus"/></s:if>
			    </s:if>
			    <s:if test="dashboardCommunicationDocuments.size()>0">
			    <s:property value="cercCommunication.checkStatus" /><br>
			    <s:if test="#session.CERC_USER.refDivisionId.divisionCode.trim()==12">
			    <s:radio list="#{'Yes':'Yes','No':'No'}" name="checkStatus" id="checkStatus" theme="simple" value="dashboardCommunicationDocuments.checkStatus"/></s:if>
			    </s:if>
			</td> 
		</tr>
		
		<tr valign="top">
			<td>Date of Recieving Hard Copy</td>
			<td>:</td>
			<td>
			<s:if test="dashboardAdditionalInformationDocuments.size()>0">
			<s:date name="dashboardAdditionalInformationDetails.dateOfRecieving" format="dd/MM/yyyy" /><br>
			<s:if test="#session.CERC_USER.refDivisionId.divisionCode.trim()==12">
			<s:textfield type="text" size="10" name="dateOfRecieving" id="dateOfRecieving" class="tcal" cssStyle="width:130pt"/></s:if></s:if>
			<s:if test="dashboardSubmissionDocuments.size()>0">
			<s:date name="dashboardSubmissionDetails.dateOfRecieving" format="dd/MM/yyyy" /><br>
			<s:if test="#session.CERC_USER.refDivisionId.divisionCode.trim()==12">
			<s:textfield type="text" size="10" name="dateOfRecieving" id="dateOfRecieving" class="tcal" cssStyle="width:130pt"/></s:if></s:if>
			<s:if test="dashboardRejoinderDocuments.size()>0">
			<s:date name="dashboardRejoinderDetails.dateOfRecieving" format="dd/MM/yyyy" /><br>
			<s:if test="#session.CERC_USER.refDivisionId.divisionCode.trim()==12">
			<s:textfield type="text" size="10" name="dateOfRecieving" id="dateOfRecieving" class="tcal" cssStyle="width:130pt"/></s:if></s:if>
			<s:if test="dashboardReplyDocuments.size()>0">
			<s:date name="dashboardReplyDetails.dateOfRecieving" format="dd/MM/yyyy" /><br>
			<s:if test="#session.CERC_USER.refDivisionId.divisionCode.trim()==12">
			<s:textfield type="text" size="10" name="dateOfRecieving" id="dateOfRecieving" class="tcal" cssStyle="width:130pt"/></s:if></s:if>
			<s:if test="dashboardCommunicationDocuments.size()>0">
			<s:date name="cercCommunication.dateOfRecieving" format="dd/MM/yyyy" /><br>
			<s:if test="#session.CERC_USER.refDivisionId.divisionCode.trim()==12">
			<s:textfield type="text" size="10" name="dateOfRecieving" id="dateOfRecieving" class="tcal" cssStyle="width:130pt"/></s:if></s:if>
		 </td>
		</tr>
		
		<tr>
			<td colspan="7" align="right"><s:if test="#session.CERC_USER.refDivisionId.divisionCode.trim()==12"><s:submit id="savebutton"
					name="savebutton" value="Save" class="formbutton" /></s:if>&nbsp;&nbsp; 
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel"
					class="formbutton" action="cercPetitionPleadingList" /></td>
		</tr>
                </table>
               <s:token/> 
</s:form>
                
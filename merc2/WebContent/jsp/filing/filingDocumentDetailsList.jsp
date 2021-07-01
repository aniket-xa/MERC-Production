<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
	
// 	08-05-2020 start SH
	
	function filingAssetDetails(){
		document.filingDocumentDetailsList.action="filingAssetDetails?struts.token.name=token&token=<s:property value="token"/>";
		document.filingDocumentDetailsList.submit();
	}
	
// 	08-05-2020 end SH
	
	function filingFeeDetails(){
		document.filingDocumentDetailsList.action="filingFeeDetails?struts.token.name=token&token=<s:property value="token"/>";
		document.filingDocumentDetailsList.submit();
	}
	
	function filingPrayerDetailsList(){
		document.filingDocumentDetailsList.action="filingPrayerDetailsList?struts.token.name=token&token=<s:property value="token"/>";
		document.filingDocumentDetailsList.submit();
	}

	function filingSummary(){
		document.filingDocumentDetailsList.action="filingSummary?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.filingDocumentDetailsList.submit();
	}
	function deleteConfirmation() 
	{
	    var x=confirm('Are you sure you want to delete ?');
	    if (x) 
	    {
	    	return true;
	    } 
	    else 
	    {
	        return false;
	    }
	    
	}
</script>

<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="filingDocumentDetailsList">
<s:hidden name="filingBeanId"/>
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Attachment List</th>
		</tr>
		<s:if test="registrationNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Petition No. : <s:property value="registrationNumberDisplay"/></td>
			</tr>
			<tr>
				<td colspan="3" align="left">Diary No. : <s:property value="diaryNumberDisplay"/></td>
				<td colspan="1" align="center"></td>
				<td colspan="3" align="right">Reference No. : <s:property value="referenceNumberDisplay"/></td>									
			</tr>
		</s:if>
		<s:elseif test="diaryNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Diary No. : <s:property value="diaryNumberDisplay"/></td>													
			</tr>
			<tr>
				<td colspan="3" align="left"></td>
				<td colspan="1" align="center"></td>
				<td colspan="3" align="right">Reference No. : <s:property value="referenceNumberDisplay"/></td>									
			</tr>
		</s:elseif>
		<s:elseif test="referenceNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Reference No. : <s:property value="referenceNumberDisplay"/></td>									
			</tr>
		</s:elseif>
		<s:hidden name="referenceNumber"/>
		<s:hidden name="referenceYear"/>
		<s:hidden name="referenceNumberDisplay"/>
		<s:hidden name="diaryNumber"/>
		<s:hidden name="diaryYear"/>
		<s:hidden name="diaryNumberDisplay"/>
		<s:hidden name="registrationNumber"/>
		<s:hidden name="registrationYear"/>
		<s:hidden name="registrationNumberDisplay"/>
		
		<s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'">
		<tr>
			<td colspan="7">
				<s:a action="filingDocumentDetails">
				<s:param name="struts.token.name" value="%{'token'}"/>
   				<s:param name="token" value="token"/>
   				<s:param name="filingBeanId" value="filingBeanId"/>
   				Add Attachments</s:a>					
			</td>
		</tr>
		</s:if>
		<tr>
			<td colspan="7">
				<table border = "0">
					<tr class="subheading">
						<td width="6%">S. No.</td>
						<td width="38%">Document Type</td>
						<td width="40%">Document Name</td>
						<td width="12%">Uploaded On</td>
						<td width="4%"><s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'">Delete</s:if></td>						
					</tr>
					<s:if test="cercPetitionDocumentsList.size()>0">
					<s:iterator value="cercPetitionDocumentsList" status="rowstatus">
					<tr class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
					<s:url action="openUploadedFile" var="openPdfFile" escapeAmp="false">
						<s:param name="struts.token.name">token</s:param>
						<s:param name="token" value="token"/>
            			<s:param name="openUploadedFileName"><s:property value="fileName"/></s:param>
            			<s:param name="openUploadedFileNameDisplay"><s:property value="fileNameDisplay"/></s:param>
            			<s:param name="filingBeanId" value="filingBeanId"/>
        			</s:url>
					
					<%-- <s:url var="filingPrayerDetailsEdit" action="filingPrayerDetailsEdit">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="filingBeanId" value="filingBeanId"/>
							<s:param name="cercPrayerId" value="id"/>
						</s:url> --%>
						<td><s:property value="#rowstatus.count"/></td>
						<td><s:property value="refDocumentId.documentName"/></td>
						<td><s:a href="%{openPdfFile}" title="Click to Open"><s:property value="fileNameDisplay"/></s:a></td>
						<td><s:date name="updatedOn" format="dd/MM/yyyy"/></td>
						<s:url var="filingDocumentDetailsDelete" action="filingDocumentDetailsDelete">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="filingBeanId" value="filingBeanId"/>
							<s:param name="cercPetitionDocumentsId" value="id"/>
						</s:url>
						<td><s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'"><s:a href="%{filingDocumentDetailsDelete}" title="Click to Delete" onClick="return deleteConfirmation();">Delete</s:a></s:if></td>
					</tr>
					</s:iterator>
					</s:if>					
				</table>
			</td>
		</tr>
		<tr>
			<!-- <td>
				<input type="submit" id="submitbutton" name="submitbutton" value="Submit" class="formbutton" onClick="filingSummary()" />
			</td> -->
			<td align="right" colspan="7">
			<s:if test = "filingBean.diaryNumber == null">
				<input type="button" id="previousbutton" name="previousbutton" value=" &lt;&lt; Previous" class="formbutton" onClick="filingPrayerDetailsList()"/>&nbsp;&nbsp;
				
				<s:if test = "#session.CERC_USER.refOrganisationId.id==1">
				<input type="button" id="nextbutton" name="nextbutton" value="Next &gt;&gt;" class="formbutton" onClick="filingAssetDetails()"/>&nbsp;&nbsp;
				</s:if>
				
				<s:else>
				<input type="button" id="nextbutton" name="nextbutton" value="Next &gt;&gt;" class="formbutton" onClick="filingFeeDetails()"/>&nbsp;&nbsp;
				</s:else>
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/>
			</s:if>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
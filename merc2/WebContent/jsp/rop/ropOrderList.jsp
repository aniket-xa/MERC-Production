<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">
	
	/* function filingPartyDetailsList(){
		document.filingCourtDetailsList.action="filingPartyDetailsList?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.filingCourtDetailsList.submit();
	}

	function relatedCaseDetailsList(){
		document.filingCourtDetailsList.action="relatedCaseDetailsList?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.filingCourtDetailsList.submit();
	}
	
	function filingSummary(){
		document.filingCourtDetailsList.action="filingSummary?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.filingCourtDetailsList.submit();
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
 */</script>
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="ropOrderList">

	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Notice List</th>
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
		
		<tr>
			<td colspan="7">
				<table border = "0" >
					<tr class="subheading">
						<td width="6%">S. No.</td>
						<td width="12%">Reference Number</td>
						<td width="26%">Document Type</td>
						<td width="26%">File Name</td>
						<td width="20%">Updated By</td>
						<td width="20%">Updated On</td>						
					</tr>
					<s:if test="cercRopDetailsList.size()>0">
					<s:iterator value="cercRopDetailsList" status="rowstatus">
					<tr class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
					<td><s:property value="#rowstatus.count"/></td>
					<td><s:property value="cercCommunicationId.communicationReferenceNumber"/></td>
					<td><s:property value="refDocumentId.documentName"/></td>
					<s:url action="viewPleadingDocument" var="viewPleadingDocument">
                      	<s:param name="pleadingId"><s:property value="%{id}"/></s:param>
                      	<s:param name="filingBeanId" value="cercPetitionId.id" />
                      	<s:param name="fileName" value="fileName" />
                      	<s:param name="fileNameDisplay" value="fileNameDisplay" />
                      	<s:param name="constantName" value="%{'cercCorrespondenceDocuments'}"/>
                      </s:url>
					<td><s:a href="%{viewPleadingDocument}"><s:property value="fileNameDisplay"/></s:a></td>
					<td><s:property value="updatedBy.userName"/></td>
					<td><s:date name="updatedOn" format="dd/MM/yyyy"/></td>
					</tr>
					</s:iterator>
					</s:if>
					<%-- 
						<s:url var="filingCourtDetailsEdit" action="filingCourtDetailsEdit">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="filingBeanId" value="filingBeanId"/>
							<s:param name="courtDetailsId" value="id"/>
						</s:url>
						<td><s:a href="%{filingCourtDetailsEdit}"><s:property value="#rowstatus.count"/></s:a></td>
						<td><s:if test="agencyType=='A'">Authority</s:if><s:elseif test="agencyType=='H'">Higher Court</s:elseif><s:else>Other</s:else></td>
						<s:if test="authorityName!=null and authorityName!=''">
							<td><s:property value="authorityName"/></td>
						</s:if>
						<s:else>
							<td><s:property value="refAgencyNameId.agencyName"/></td>
						</s:else>
						<td><s:property value="caseType"/>/<s:property value="caseNumber"/>/<s:property value="caseYear"/></td>
						<td><s:date name="orderDate" format="dd/MM/yyyy"/></td>
						<td><s:property value="orderType"/></td>
						<s:url var="filingCourtDetailsDelete" action="filingCourtDetailsDelete">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="filingBeanId" value="filingBeanId"/>
							<s:param name="courtDetailsId" value="id"/>
						</s:url>
						<td><s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'"><s:a href="%{filingCourtDetailsDelete}" onClick="return deleteConfirmation();">Delete</s:a></s:if></td>
					</tr>
					</s:iterator>
					</s:if> --%>
					
				</table>
			</td>
			</tr>
		<tr>
			<!-- <td>
				<input type="submit" id="submitbutton" name="submitbutton" value="Submit" class="formbutton" onClick="filingSummary()" />
			</td> -->
			<td align="right" colspan="7">
			<s:if test="#session.ACTIVE_MENU=='Draft Petition'">
				<input type="button" id="previousbutton" name="previousbutton" value=" &lt;&lt; Previous" class="formbutton" onClick="filingPartyDetailsList()"/>&nbsp;&nbsp;
				<input type="button" id="nextbutton" name="nextbutton" value="Next &gt;&gt;" class="formbutton" onClick="relatedCaseDetailsList()"/>&nbsp;&nbsp;
			</s:if>
			<s:hidden name="filingBeanId"/>
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="filingSummary"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
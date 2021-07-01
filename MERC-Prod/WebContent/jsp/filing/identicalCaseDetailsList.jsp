<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">
	function relatedCaseDetailsList(){
		document.relatedCaseDetails.action="relatedCaseDetailsList?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.relatedCaseDetails.submit();
	}
	
	function filingPrayerDetailsList(){
		document.relatedCaseDetails.action="filingPrayerDetailsList?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.relatedCaseDetails.submit();
	}
	
	function filingSummary(){
		document.relatedCaseDetails.action="filingSummary?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.relatedCaseDetails.submit();
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
<s:form theme="simple" name="relatedCaseDetails">
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Identical Petitions Filed in MERC (Current / Disposed Of) as per petitioner</th>
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
				<s:a action="identicalCaseDetails">
									<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="filingBeanId" value="filingBeanId"/>
				Add Identical Petition</s:a>										
			</td>
		</tr>
		</s:if>
		<tr>
			<td colspan="7">
				<table border = "0">
					<tr class="subheading">
						<td width="4%">S. No.</td>
						<td width="16%">Petition Number</td>
						<td width="*">Subject</td>
						<td width="4%"><s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'">Delete</s:if></td>
					</tr>
					<s:if test="cercIdenticalPetitionList.size()>0">
					<s:iterator value="cercIdenticalPetitionList" status="rowstatus">
					<tr class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
					<%-- <s:url var="relatedCaseDetailsEdit" action="relatedCaseDetailsEdit">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="filingBeanId" value="filingBeanId"/>
							<s:param name="cercRelatedPetitionId" value="id"/>
						</s:url>
						<td><s:a href="%{relatedCaseDetailsEdit}"><s:property value="#rowstatus.count"/></s:a></td> --%>
						<td><s:property value="#rowstatus.count"/></td>
						<td>
							<s:if test="cercIdenticalPetitionId.registrationNumberDisplay==null or cercIdenticalPetitionId.registrationNumberDisplay==''">
								<s:property value="cercIdenticalPetitionId.diaryNumberDisplay"/>
							</s:if>
							<s:else>
								<s:property value="cercIdenticalPetitionId.registrationNumberDisplay"/>
							</s:else>
							
						</td>
						<td><s:property value="cercIdenticalPetitionId.refSubjectId.subject"/><br/><s:property value="cercIdenticalPetitionId.subject"/></td>
						<s:url var="identicalCaseDetailsDelete" action="identicalCaseDetailsDelete">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="filingBeanId" value="filingBeanId"/>
							<s:param name="cercIdenticalPetitionId" value="id"/>
						</s:url>
						<td><s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'"><s:a href="%{identicalCaseDetailsDelete}" onClick="return deleteConfirmation();">Delete</s:a></s:if></td>
					</tr>
					</s:iterator>
					</s:if>
				</table>
			</td>
		</tr>
		<tr><td colspan="7"><s:actionmessage/></td></tr>
		<tr>
		
			<td>
				<!-- <input type="submit" id="submitbutton"  name="submitbutton" value="Submit" class="formbutton" onClick="filingSummary()"/> -->				
			</td>
			<td align="right" colspan="6">
				<s:if test = "filingBean.diaryNumber == null">
				<input type="button" id="previousbutton" name="previousbutton" value=" &lt;&lt; Previous" class="formbutton" onClick="relatedCaseDetailsList()"/>&nbsp;&nbsp;
				<input type="button" id="nextbutton" name="nextbutton" value="Next &gt;&gt;" class="formbutton" onClick="filingPrayerDetailsList()"/>&nbsp;&nbsp;
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/>
			</s:if>
				</td>
		</tr>
	</table>
</s:form>	
            	
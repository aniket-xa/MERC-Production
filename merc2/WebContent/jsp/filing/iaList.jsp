<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
	function filingCourtDetailsList(){
		document.relatedCaseDetails.action="filingCourtDetailsList?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.relatedCaseDetails.submit();
	}
	
	function identicalCaseDetailsList(){
		document.relatedCaseDetails.action="identicalCaseDetailsList?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
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
<s:form theme="simple" name="IA" validate="true">

	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Interlocutory Application List</th>
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
		
		<s:if test="#session.ACTIVE_MENU=='IA' or #session.ACTIVE_MENU=='e-File Petition'">
		<tr>
			<td colspan="7">
				<s:a action="showRelatedPetitionDetails">
									<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="filingBeanId" value="filingBeanId"/>
				Add Related Petition</s:a>
			</td>
			
			<td colspan="7">
				<s:a action="showRelatedPetitionDetails">
									<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="filingBeanId" value="filingBeanId"/>
				Add Related Petition</s:a>
			</td>
			
		</tr>
		</s:if>	
		<tr>
			<td colspan="7">
				<table border = "0">
					<tr class="subheading">
						<td width="4%">S. No.</td>
						<td width="16%">IA Number</td>
						<td width="25%">Applicant</td>
						<td width="35%">Subject</td>
						<td width="*">Status</td>
						
					</tr>
					<s:if test="cercPetitionIAList.size()>0">
					<s:iterator value="cercPetitionIAList" status="rowstatus">
					<tr class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'> 
					
					<s:url var="url" action="filingSummary">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token" />
							<s:param name="filingBeanId" value="id" />
						</s:url>
					
						
						<td><s:a href = "%{url}"><s:property value="#rowstatus.count"/></s:a></td>
						<td><s:a href = "%{url}">
							<s:if test="registrationNumberDisplay==null">
								Diary Number - <s:property value="diaryNumberDisplay"/> 
							</s:if>
							<s:else>
								<s:property value="registrationNumberDisplay"/>
							</s:else>
							</s:a>
						</td>
						<td><s:property value="cercUserPetitionerId.userName"/></td>
						<td><s:property value="subject"/></td>
						<td><s:property value="refStatusId.refStatusPublicDomainId.statusName"/></td>
						
					</tr>
					</s:iterator>
					</s:if>
					
				</table>
			</td>
		</tr>
		<tr><td colspan="7"><s:actionmessage/></td></tr>
		<tr>
		
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
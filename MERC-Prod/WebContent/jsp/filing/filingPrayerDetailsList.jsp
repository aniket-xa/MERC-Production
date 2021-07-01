<%@ taglib uri="/struts-tags" prefix="s"%>
<!-- // 	26-03-2020 start AK -->

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta charset="UTF-8">
<!-- // 	26-03-2020 End AK -->
<script type="text/javascript">
	function identicalCaseDetailsList(){
		document.filingIssueDetailsList.action="identicalCaseDetailsList?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.filingIssueDetailsList.submit();
	}
	
	function filingFeeDetails(){
		document.filingIssueDetailsList.action="filingDocumentDetailsList?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.filingIssueDetailsList.submit();
	}

	function filingSummary(){
		document.filingIssueDetailsList.action="filingSummary?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.filingIssueDetailsList.submit();
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
<s:form theme="simple" name="filingIssueDetailsList">

	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Issues List</th>
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
				<s:a action="filingPrayerDetails">
					<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="filingBeanId" value="filingBeanId"/>
				Add Prayer</s:a>									
			</td>
		</tr>
		</s:if>
		<tr>
			<td colspan="7">
				<table border = "0"  >
					<tr class="subheading">
						<td width="5%">S. No.</td>
						<td width="80%">Description</td>
						<td width="11%">Updated On</td>
						<td width="4%"><s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'">Delete</s:if></td>						
					</tr>
					<s:if test="cercPrayerList.size()>0">
					<s:iterator value="cercPrayerList" status="rowstatus">
					<tr class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
						<s:url var="filingPrayerDetailsEdit" action="filingPrayerDetailsEdit">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="filingBeanId" value="filingBeanId"/>
							<s:param name="cercPrayerId" value="id" />
						</s:url>
						<td><s:a href="%{filingPrayerDetailsEdit}"><s:property value="#rowstatus.count"/></s:a></td>
	<!-- // 	26-03-2020 start AK -->					
						<td><s:property value="description" escapeHtml="UTF-8" /></td>
<!-- // 	26-03-2020 End AK -->
						<td><s:date name="updatedOn" format="dd/MM/yyyy"/></td>
						<s:url var="filingPrayerDetailsDelete" action="filingPrayerDetailsDelete">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="filingBeanId" value="filingBeanId"/>
							<s:param name="cercPrayerId" value="id"/>
						</s:url>
						<td><s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'"><s:a href="%{filingPrayerDetailsDelete}" onClick="return deleteConfirmation();">Delete</s:a></s:if></td>
					</tr>
					</s:iterator>
					</s:if>					
				</table>
			</td>
		</tr>	
		<tr>
			<!-- <td>
				<input type="submit" id="submitbutton" name="submitbutton" name="submitbutton" value="Submit" class="formbutton" onClick="filingSummary()" />
			</td> -->
			<td align="right" colspan="7">
				<s:if test = "filingBean.diaryNumber == null">
				<input type="button" id="previousbutton" name="previousbutton" value=" &lt;&lt; Previous" class="formbutton" onClick="identicalCaseDetailsList()"/>&nbsp;&nbsp;
				<input type="button" id="nextbutton" name="nextbutton" value="Next &gt;&gt;" class="formbutton" onClick="filingFeeDetails()"/>&nbsp;&nbsp;
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/>
				</s:if>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
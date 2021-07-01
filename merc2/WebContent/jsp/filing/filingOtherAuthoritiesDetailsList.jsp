<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">
	/* function filingGeneralInformation(){
		document.filingPartyDetailsList.action="filingGeneralInformation?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.filingPartyDetailsList.submit();
	}
	
	function filingCourtDetailsList(){
		document.filingPartyDetailsList.action="filingCourtDetailsList?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.filingPartyDetailsList.submit();
	}  
	
	function filingSummary(){
		document.filingPartyDetailsList.action="filingSummary?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.filingPartyDetailsList.submit();
	}  */ 
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
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<%-- <s:include value="/jsp/tiles/tabs.jsp"></s:include> --%>
<s:form theme="simple" name="">

	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Verification Officer List</th>
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
		<%-- <tr>
			<td colspan="7">
				
					<s:a action="filingNodalOfficerDetails0">
					<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="filingBeanId" value="filingBeanId"/>
					File tracking</s:a>
				
			</td>
		</tr> --%>
		<tr>
			<td colspan="7">
				
					<s:a action="filingNodalOfficerDetails2">
					<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="filingBeanId" value="filingBeanId"/>
					Add Level</s:a>
				
			</td>
		</tr>
		<tr>
			<td colspan="7">
				<table border = "0">
					<tr class="subheading">
						<td width="5%">S. No.</td>
						<td width="10%">Level</td>
<!-- 						<td width="20%">Department</td> -->
						<td width="18%">Employee</td>
						<td width="18%">Status</td>
						<td width="4%">Created</td>
					</tr>
					
					<s:iterator value="AuthoritiesDetailsList" status="rowstatus">
					<s:if test='id!=null'>
					<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
						<td><s:property value="#rowstatus.count"/></td>
						<td>
						<%-- <s:property value="level"/> --%>
						<s:if test='level== 1'>
<%-- 						<s:property value="level"/> --%>
						Legal Officer
						</s:if>
						<s:if test='level== 2'>
<%-- 						<s:property value="level"/> --%>
						Deputy Director
						</s:if>
						<s:if test='level== 3'>
<%-- 						<s:property value="level"/> --%>
						Director
						</s:if>
						<s:if test='level== 4'>
<%-- 						<s:property value="level"/> --%>
						Executive Director
						</s:if>
						<s:if test='level== 5'>
<%-- 						<s:property value="level"/> --%>
						Secretary
						</s:if>
						<s:if test='level== 6'>
<%-- 						<s:property value="level"/> --%>
						Member1
						</s:if>
						<s:if test='level== 7'>
<%-- 						<s:property value="level"/> --%>
						Member2
						</s:if>
						<s:if test='level== 8'>
<%-- 						<s:property value="level"/> --%>
						Chairperson
						</s:if>
						</td>
<%-- 						<td><s:property value="department.departmentDescription"/></td> --%>
						<td><s:property value="employeename.userName"/></td>
						<td><s:property value="status==1?'Active':'Inactive'"/></td>						
						<td><s:property value="createdDate"/></td>
						<%-- <td><s:property value="cercUserNodalOfficerId.mobile"/></td>
						<td><s:property value="cercUserNodalOfficerId.email"/></td> --%>
<%-- 						<s:url var="nodalOfficerDetailsDelete" action="nodalOfficerDetailsDelete"> --%>
<%-- 							<s:param name="struts.token.name">token</s:param> --%>
<%-- 							<s:param name="token" value="token"/> --%>
<%-- 							<s:param name="filingBeanId" value="filingBeanId"/> --%>
<%-- 							<s:param name="cercPetitionNodalOfficerDetailsId" value="id"/> --%>
<%-- 						</s:url> --%>
<%-- 					<td><s:a href="%{nodalOfficerDetailsDelete}" onClick="return deleteConfirmation();"></s:a></td> --%>
					</tr>
					</s:if>
					</s:iterator>
					
				</table>
			</td>
		</tr>	
		<tr>
			<!-- <td>
				<input type="submit" id="submitbutton" name="submitbutton" value="Submit" class="formbutton" onClick="filingSummary()" />
			</td> -->
			<td align="right" colspan="7">
			<s:if test="#session.ACTIVE_MENU=='Draft Petition'">
				<input type="button" id="previousbutton" name="previousbutton" value=" &lt;&lt; Previous" class="formbutton" onClick="filingGeneralInformation()"/>&nbsp;&nbsp;
				<input type="button" id="nextbutton" name="nextbutton" value="Next &gt;&gt;" class="formbutton" onClick="filingCourtDetailsList()"/>&nbsp;&nbsp;
			</s:if>
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
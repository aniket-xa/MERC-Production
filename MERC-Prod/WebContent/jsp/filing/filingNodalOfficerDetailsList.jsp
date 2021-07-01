<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">
	function filingGeneralInformation(){
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
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="filingPartyDetailsList">

	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Nodal Officer List</th>
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
				
					<s:a action="filingNodalOfficerDetails">
					<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="filingBeanId" value="filingBeanId"/>
					Add Nodal Officer</s:a>
				
			</td>
		</tr>
		<tr>
			<td colspan="7">
				<table border = "0">
					<tr class="subheading">
						<td width="5%">S. No.</td>
						<td width="30%">Name</td>
						<td width="31%">Address</td>
						<td width="12%">Mobile</td>
						<td width="18%">e-Mail</td>
						<td width="4%"><s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'  or #session.CERC_USER.refOrganisationId.id==1">Delete</s:if></td>
					</tr>
					
					<s:iterator value="cercNodalOfficerDetailsList" status="rowstatus">
					<s:if test='cercUserNodalOfficerId!=null'>
					<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
						<td><s:property value="#rowstatus.count"/></td>
						<td><s:property value="cercUserNodalOfficerId.firstName+' '+cercUserNodalOfficerId.lastName"/></td>
						<td>
						<s:property value="cercUserNodalOfficerId.address"/>,<br/>
						<s:property value="cercUserNodalOfficerId.refCityId.cityName"/>,<br/>
						<s:property value="cercUserNodalOfficerId.refStateId.stateName"/> - <s:property value="cercUserNodalOfficerId.pinCode"/></td>
						<td><s:property value="cercUserNodalOfficerId.mobile"/></td>
						<td><s:property value="cercUserNodalOfficerId.email"/></td>
						<s:url var="nodalOfficerDetailsDelete" action="nodalOfficerDetailsDelete">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="filingBeanId" value="filingBeanId"/>
							<s:param name="cercPetitionNodalOfficerDetailsId" value="id"/>
						</s:url>
						<td><s:a href="%{nodalOfficerDetailsDelete}" onClick="return deleteConfirmation();">Delete</s:a></td>
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
            	
<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">

// 08-05-2020 start SH

function filingDocumentDetailsList(){
	document.filingAssetDetailsList.action="filingDocumentDetailsList?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
	document.filingAssetDetailsList.submit();
}

// 08-05-2020 end SH

function filingFeeDetails(){
	document.filingAssetDetailsList.action="filingFeeDetails?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
	document.filingAssetDetailsList.submit();
}

function filingCheckList(){
	document.filingAssetDetailsList.action="filingCheckList?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
	document.filingAssetDetailsList.submit();
}

</script>
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="filingAssetDetailsList">

	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Asset Details List</th>
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
						<td width="34%">Asset Details</td>
						<td width="20%">Refered As</td>
						<td width="20%">Anticipated Doco Date</td>
						<td width="20%">Actual Doco Date</td>
					</tr>
					<s:if test="cercAssetDetailsViewList.size()>0">
					<s:iterator value="cercAssetDetailsViewList" status="rowstatus">
					<tr class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
					<td><s:property value="#rowstatus.count"/></td>
					<td><s:property value="refAssetsId.assetDetails"/></td>
					<td><s:property value="assetName"/></td>
					<td><s:date name="anticipatedDocoDate" format="dd/MM/yyyy"/></td>
					<td><s:date name="actualDocoDate" format="dd/MM/yyyy"/></td>
						<%-- <s:url var="filingCourtDetailsEdit" action="filingCourtDetailsEdit">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="filingBeanId" value="filingBeanId"/>
							<s:param name="courtDetailsId" value="id"/>
						</s:url>
						<td><s:a href="%{filingCourtDetailsEdit}"><s:property value="#rowstatus.count"/></s:a></td>
						<td><s:property value="agencyType"/></td>
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
					 --%>
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
<%-- 				<s:if test="#session.ACTIVE_MENU=='Draft Petition'"> --%>
<s:if test = "filingBean.diaryNumber == null">
					<s:if test = "#session.CERC_USER.refOrganisationId.id==1">
					<input type="button" id="previousbutton" name="previousbutton" value=" &lt;&lt; Previous" class="formbutton" onClick="filingDocumentDetailsList()"/>&nbsp;&nbsp;
				</s:if>
					
					<s:else>
					<input type="button" id="previousbutton" name="previousbutton" value=" &lt;&lt; Previous" class="formbutton" onClick="filingFeeDetails()"/>&nbsp;&nbsp;
					</s:else>
					
					<input type="button" id="nextbutton" name="nextbutton" value="Next &gt;&gt;" class="formbutton" onClick="filingCheckList()"/>&nbsp;&nbsp;
<%-- 				</s:if> --%>
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/>
				</s:if>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
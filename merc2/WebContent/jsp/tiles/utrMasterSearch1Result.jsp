<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<s:form theme="simple" name="utrMasterSearch1Case" action="utrMasterSearch1Case">
<table border="0">
		
		<!-- Search for utr number START-->
		
		<s:if test="searchResultList.size>0">
			<tr>
				<th colspan="8" class="mainheading">Searched UTR</th>				
			</tr>
			<tr>
				<td colspan="8"><s:property value="searchCriteria"/></td>				
			</tr>
			<tr>
				<td colspan="8">
					<display:table export="true" id="searchResult" name="searchResultList" pagesize="20" requestURI="/utrMasterSearch1Case.action">
					<s:set name="rowstatus" value="%{#attr.searchResult_rowNum-1}"/>
					<display:column title="Sr. No." sortable="false" media="html">
						<s:property value="%{#rowstatus+1}"/>
					</display:column>
					<display:column title="Sr. No." sortable="false" media="excel">
						<s:property value="%{#rowstatus+1}"/>
					</display:column>
				   <display:column title="UTR Number" sortable="true">
						<s:property value="searchResultList[#rowstatus][3]"/> 
					</display:column>
					<display:column title="Amount Deposited" sortable="true">
						<s:property value="searchResultList[#rowstatus][4]"/>
					</display:column>
					<display:column title="Deposit Date" sortable="true">
						<%-- <s:property value="searchResultList1[#rowstatus][5]"/> --%>
						<s:date name ="searchResultList[#rowstatus][5]" format="dd/MM/yyyy"/>
					</display:column>
					<display:column title="Bank Name" sortable="true">
						<s:property value="searchResultList[#rowstatus][6]"/>
					</display:column>
					<display:column title="Branch Name" sortable="true">
						<s:property value="searchResultList[#rowstatus][7]"/>
					</display:column>
					<display:column title="Balance Amount" sortable="true">
						<s:property value="searchResultList[#rowstatus][8]"/>
					</display:column>
					<display:column title="Status" sortable="true">
						<s:property value="searchResultList[#rowstatus][19]"/>
					</display:column>
					<%-- <display:column title="Updated On" sortable="true">
						<s:property value="searchResultList1[#rowstatus][13]"/>
					</display:column> --%>
				</display:table>
				</td>
			</tr>
		</s:if>
		
		<!-- Search for utr number END -->
		
		
		<s:else>
			<tr>
				<td colspan="8"><s:property value="searchCriteria"/></td>				
			</tr>
			<tr align="center">
				<td  colspan="8"><span class="required">No Record Found.</span></td>
			</tr>
		</s:else>
		<tr align="right">
			<td colspan="8">
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="utrMasterSearch1"/>
			</td>
		</tr>
</table>
<s:token/>
<%-- <s:property value="%{filedOn}"/> --%>

<%-- <table border="0">
		<s:if test="searchResultList.size>0">
			<tr>
				<th colspan="7" class="mainheading">Searched Petitions</td>				
			</tr>
			<tr class="subheading">
				<td width="5%">S.No.</td>
				<td width="18%">Petition Number/Year</td>
				<td width="24%">Petitioner Name</td>
				<td width="18%">Filed By</td>
				<td width="13%">Disposed of On</td>
				<td width="10%">Filed On</td>
				<td width="12%">Registered On</td>
			</tr>
			<s:iterator value="searchResultList" status="rowstatus">
				<s:url var="url" action="filingGeneralInformation">
					<s:param name="struts.token.name">token</s:param>
					<s:param name="token" value="token" />
					<s:param name="filingBeanId" value="id" />
				</s:url>
				<tr class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>' valign="top">
					<td><s:property value="#rowstatus.count" /></td>
					<td><s:a href="%{url}">
							<s:property value="registrationNumberDisplay" />
						</s:a>
					</td>
					<td><s:property value="cercUserPetitionerId.firstName"/> <s:property value="cercUserPetitionerId.middleName"/> <s:property value="cercUserPetitionerId.lastName"/></td>
					<td><s:property value="cercUserFiledBy.firstName"/> <s:property value="cercUserFiledBy.middleName"/> <s:property value="cercUserFiledBy.lastName"/></td>
					<td><s:date name="updatedOn" format="dd/MM/yyyy"/></td>
					<td><s:date name="filedOn" format="dd/MM/yyyy"/></td>
					<td><s:date name="registeredOn" format="dd/MM/yyyy"/></td>
				</tr>

			</s:iterator>
		</s:if>
		<s:else>
			<tr align="center">
				<td colspan="3"><span class="required">No Record Found.</span></td>
			</tr>
		</s:else>
		<tr align="right">
			<td colspan="7">
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="miscSearch"/>
			</td>
		</tr>
	</table> --%>
	<%-- <s:token/> --%>	
</s:form>
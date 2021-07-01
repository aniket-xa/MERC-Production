<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<s:form theme="simple" name="assetMasterSearchCase" action="assetMasterSearchCase">
<table border="0">
		<s:if test="searchResultList.size>0">
			<tr>
				<th colspan="8" class="mainheading">Searched Assets</th>				
			</tr>
			<tr>
				<td colspan="8"><s:property value="searchCriteria"/></td>				
			</tr>
			<tr>
				<td colspan="8">
					<display:table export="true" id="searchResult" name="searchResultList" pagesize="20" requestURI="/assetMasterSearchCase.action">
					<s:set name="rowstatus" value="%{#attr.searchResult_rowNum-1}"/>
					<display:column title="Sr. No." sortable="false" media="html">
						<s:property value="%{#rowstatus+1}"/>
					</display:column>
					<display:column title="Sr. No." sortable="false" media="excel">
						<s:property value="%{#rowstatus+1}"/>
					</display:column>
					<display:column title="Petition Number" sortable="true" media="html">
					<s:if test='#session.CERC_USER.userType=="O" or #session.CERC_USER.userType=="E" or #session.CERC_USER.userType=="A"'>
					<s:a action="filingSummary">
   						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						<s:param name="filingBeanId" value="searchResultList[#rowstatus][0]"/>
						<s:property value="searchResultList[#rowstatus][1]"/>
						<%-- <s:if test="%{#attr.searchResult.registrationNumberDisplay!=null}"><s:property value="%{#attr.searchResult.registrationNumberDisplay}"/></s:if>
						<s:else><s:property value="%{#attr.searchResult.diaryNumberDisplay}"/></s:else> --%>
					</s:a>
					</s:if>
					<s:else>
						<s:property value="searchResultList[#rowstatus][1]"/>
					</s:else>
					</display:column>
					<display:column title="Petition Number" sortable="true" media="excel">
					<%-- <s:if test="%{#attr.searchResult.registrationNumberDisplay!=null}"><s:property value="%{#attr.searchResult.registrationNumberDisplay}"/></s:if>
						<s:else><s:property value="%{#attr.searchResult.diaryNumberDisplay}"/></s:else> --%>
						<s:property value="searchResultList[#rowstatus][1]"/>
					</display:column>
					<display:column title="Petitioner Name" sortable="true">
						<s:property value="searchResultList[#rowstatus][3]"/>
					</display:column>
					<display:column title="Region" sortable="true">
						<s:property value="searchResultList[#rowstatus][13]"/>
					</display:column>
					<display:column title="Petition Type" sortable="true">
						<s:property value="searchResultList[#rowstatus][5]"/> 
					</display:column>
					<display:column title="Asset Name" sortable="true">
						<s:property value="searchResultList[#rowstatus][6]"/> 
					</display:column>
					<display:column title="Asset Type" sortable="true">
						<s:property value="searchResultList[#rowstatus][7]"/> 
					</display:column>
					<display:column title="Generation Transmission Name" sortable="true">
						<s:property value="searchResultList[#rowstatus][12]"/> 
					</display:column>
					<display:column title="Capacity(MW)/ATC(Rs)" sortable="true">
						<s:property value="getText('{0,number,#,###.##}',{searchResultList[#rowstatus][8]})"/> 
					</display:column>
					
						<%-- <s:if test="%{#attr.searchResult.refStatusId.isDivisionConcat==true}">
						test
							<s:if test="%{#attr.searchResult.cercPetitionStatusDivisionList.size()>0}">
							test 1
								<s:iterator value="%{#attr.searchResult.cercPetitionStatusDivisionList}" status="rowstatus">
								test 2
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
						</s:if> --%>
					
					</display:table>
				</td>
			</tr>
		</s:if>
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
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="assetMasterSearch"/>
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
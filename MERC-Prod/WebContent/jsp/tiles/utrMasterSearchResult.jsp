<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<s:form theme="simple" name="utrMasterSearchCase" action="utrMasterSearchCase">
<table border="0">
		<s:if test="searchResultList.size>0">
			<tr>
				<th colspan="8" class="mainheading">Searched UTR used in transaction</th>				
			</tr>
			<tr>
				<td colspan="8"><s:property value="searchCriteria"/></td>				
			</tr>
			<tr>
				<td colspan="8">
					<display:table export="true" id="searchResult" name="searchResultList" pagesize="20" requestURI="/utrMasterSearchCase.action">
					<s:set name="rowstatus" value="%{#attr.searchResult_rowNum-1}"/>
					<display:column title="Sr. No." sortable="false" media="html">
						<s:property value="%{#rowstatus+1}"/>
					</display:column>
					<display:column title="Sr. No." sortable="false" media="excel">
						<s:property value="%{#rowstatus+1}"/>
					</display:column>
					<display:column title="Diary Number" sortable="true" media="html">
					<%-- <s:if test='#session.CERC_USER.userType=="O" or #session.CERC_USER.userType=="E" or #session.CERC_USER.userType=="A"'> --%>
					<s:a action="filingSummary">
   						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						<s:param name="filingBeanId" value="searchResultList[#rowstatus][0]"/>
						<s:property value="searchResultList[#rowstatus][1]"/>
						<%-- <s:if test="%{#attr.searchResult.registrationNumberDisplay!=null}"><s:property value="%{#attr.searchResult.registrationNumberDisplay}"/></s:if>
						<s:else><s:property value="%{#attr.searchResult.diaryNumberDisplay}"/></s:else> --%>
					</s:a>
					<%-- </s:if> --%>
					</display:column>
					<display:column title="Petition Number" sortable="true" media="html">
					<s:a action="filingSummary">
   						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						<s:param name="filingBeanId" value="searchResultList[#rowstatus][0]"/>
						<s:property value="searchResultList[#rowstatus][2]"/></s:a>
		            </display:column>
					<%-- <display:column title="Petition Number" sortable="true" media="excel">
					<s:if test="%{#attr.searchResult.registrationNumberDisplay!=null}"><s:property value="%{#attr.searchResult.registrationNumberDisplay}"/></s:if>
						<s:else><s:property value="%{#attr.searchResult.diaryNumberDisplay}"/></s:else>
						<s:property value="searchResultList[#rowstatus][2]"/>
					</display:column> --%>
					<display:column title="User Name" sortable="true">
						<s:property value="searchResultList[#rowstatus][9]"/>
					</display:column>
					<display:column title="Registered On" sortable="true">
						<s:property value="searchResultList[#rowstatus][6]"/>
					</display:column>
					<display:column title="Filed On" sortable="true">
						<s:property value="searchResultList[#rowstatus][7]"/> 
					</display:column>
					<display:column title="Disposed On" sortable="true">
						<s:property value="searchResultList[#rowstatus][8]"/> 
					</display:column>
					<display:column title="UTR Number" sortable="true">
						<s:property value="searchResultList[#rowstatus][11]"/> 
					</display:column>
					<display:column title="Amount Deposited" sortable="true">
						<s:property value="searchResultList[#rowstatus][12]"/>
					</display:column>
					<display:column title="Deposit Date" sortable="true">
						<s:date name ="searchResultList[#rowstatus][13]" format="dd/MM/yyyy"/>
					</display:column>
					<display:column title="Branch Name" sortable="true">
						<s:property value="searchResultList[#rowstatus][14]"/>
					</display:column>
					<display:column title="Balance Amount" sortable="true">
						<s:property value="searchResultList[#rowstatus][15]"/>
					</display:column>
					<display:column title="Status" sortable="true">
						<s:property value="searchResultList[#rowstatus][20]"/>
					</display:column>
					<display:column title="Verified on" sortable="true">
						<%-- <s:property value="searchResultList[#rowstatus][17]"/> --%>
						<s:date name ="searchResultList[#rowstatus][17]" format="dd/MM/yyyy"/>
					</display:column>
					<display:column title="Amount Paid" sortable="true">
						<s:property value="searchResultList[#rowstatus][21]"/>
					</display:column>
				</display:table>
				</td>
			</tr>
		</s:if>
		
		<s:if test="searchResultList2.size>0">
			<tr>
				<th colspan="8" class="mainheading">Searched UTR AssetWise</th>				
			</tr>
			<tr>
				<td colspan="8"><s:property value="searchCriteria"/></td>				
			</tr>
			<tr>
				<td colspan="8">
					<display:table export="true" id="searchResult" name="searchResultList2" pagesize="20" requestURI="/utrMasterSearchCase.action">
					<s:set name="rowstatus" value="%{#attr.searchResult_rowNum-1}"/>
					<display:column title="Sr. No." sortable="false" media="html">
						<s:property value="%{#rowstatus+1}"/>
					</display:column>
					<display:column title="Sr. No." sortable="false" media="excel">
						<s:property value="%{#rowstatus+1}"/>
					</display:column>
				   <display:column title="Diary Number" sortable="true">
						<s:property value="searchResultList2[#rowstatus][5]"/>
					</display:column>
					<display:column title="Petition Number" sortable="true">
						<s:property value="searchResultList2[#rowstatus][4]"/>
					</display:column>
					<%-- <display:column title="Asset Name" sortable="true">
						<s:property value="searchResultList2[#rowstatus][6]"/>
					</display:column> --%>
					<display:column title="Net  Fee Payable" sortable="true">
						<s:property value="searchResultList2[#rowstatus][1]"/>
					</display:column>
					<display:column title="UTR Number" sortable="true">
						<s:property value="searchResultList2[#rowstatus][0]"/>
						</display:column>
						<%-- <display:column title="Total Fee Adjusted" sortable="true">
						<s:property value="searchResultList2[#rowstatus][7]"/>
						</display:column> --%>
				</display:table>
				
				</td>
			</tr>
		</s:if>
		<s:else>
			<tr>
				<td colspan="8"><s:property value="searchCriteria"/></td>				
			</tr>
		</s:else>
		<s:if test="cercPetitionFeeAdjustmentAssetList.size>0">
			
			<tr align="center">
			<td width="20%">Total Fee Adjuted</td>
			<td width="1%">:</td></tr>
			<s:iterator value="cercPetitionFeeAdjustmentAssetList">
		     <s:property value="totalFeeAdjusted"/>
		</s:iterator>
		</s:if>
		<tr align="right">
			<td colspan="8">
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="utrMasterSearch"/>
			</td>
		</tr>
</table>
<s:token/>
</s:form>
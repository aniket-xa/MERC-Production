<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<s:form theme="simple" name="communicationTypeSearchCase" action="communicationTypeSearchCase">
<table border="0">
		<s:if test="searchResultList.size>0">
			<tr>
				<th colspan="8" class="mainheading">ROP/ORDER Search Result</th>				
			</tr>
			<tr>
				<td colspan="8"><s:property value="searchCriteria"/></td>				
			</tr>
			<tr>
				<td colspan="8">
					<display:table export="true" id="searchResult" name="searchResultList" pagesize="20" requestURI="/communicationTypeSearchCase.action">
					<s:set name="rowstatus" value="%{#attr.searchResult_rowNum-1}"/>
					<display:column title="Sr. No." sortable="false" media="html">
					<s:url var="url" action="filingSummary">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token" />
							<s:param name="filingBeanId" value="searchResultList[#rowstatus][0]" />
						</s:url>
						<s:a href="%{url}"><s:property value="%{#rowstatus+1}"/></s:a>
					</display:column>
					<display:column title="Sr. No." sortable="false" media="excel">
						<s:a href="%{url}"><s:property value="%{#rowstatus+1}"/></s:a>
					</display:column>
					<display:column title="Diary No" sortable="true">
						<s:a href="%{url}"><s:property value="searchResultList[#rowstatus][5]"/></s:a> 
					</display:column>
					<display:column title="Petition Number" sortable="true" media="html">
				    <s:if test='#session.CERC_USER.userType=="O" or #session.CERC_USER.userType=="E" or #session.CERC_USER.userType=="A"'>
					<s:a action="filingSummary">
   						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						<s:param name="filingBeanId" value="searchResultList[#rowstatus][0]"/>
						<s:a href="%{url}"><s:property value="searchResultList[#rowstatus][1]"/></s:a>
						<%-- <s:if test="%{#attr.searchResult.registrationNumberDisplay!=null}"><s:property value="%{#attr.searchResult.registrationNumberDisplay}"/></s:if>
						<s:else><s:property value="%{#attr.searchResult.diaryNumberDisplay}"/></s:else> --%>
					</s:a>
					</s:if>
					 <s:else>
						<s:a href="%{url}"><s:property value="searchResultList[#rowstatus][1]"/></s:a>
					 </s:else>
					</display:column>
					<display:column title="Petition Number" sortable="true" media="excel">
					<%-- <s:if test="%{#attr.searchResult.registrationNumberDisplay!=null}"><s:property value="%{#attr.searchResult.registrationNumberDisplay}"/></s:if>
						<s:else><s:property value="%{#attr.searchResult.diaryNumberDisplay}"/></s:else> --%>
						<s:a href="%{url}"><s:property value="searchResultList[#rowstatus][1]"/></s:a>
					</display:column>
					<display:column title="Petitioner Name" sortable="true">
						<s:property value="searchResultList[#rowstatus][2]"/>
					</display:column>
					<display:column title="Subject" sortable="true">
						<s:property value="searchResultList[#rowstatus][4]"/>
					</display:column>
					<display:column title="Date Of Hearing" sortable="true" >
						<s:property value="searchResultList[#rowstatus][7]"/> 
					</display:column>
					<display:column title="Date Of Uploading" sortable="true" >
						<s:property value="searchResultList[#rowstatus][8]"/> 
					</display:column>
					<display:column title="Description" sortable="true">
						<s:property value="searchResultList[#rowstatus][10]"/>
					</display:column>
					<display:column title="Status" sortable="true">
						<s:property value="searchResultList[#rowstatus][16]"/> 
					</display:column>
					<display:column title="FileName" sortable="true" style="width:10%">
					   <%-- <s:property value="searchResultList[#rowstatus][10]"/>  --%>
					<s:url action="downloadFullPetitionDocuments" var="downloadFullPetitionDocuments" escapeAmp="false">
						<s:param name="struts.token.name">token</s:param>
						<s:param name="token" value="token"/>
            		    <s:param name="filingBeanId" value="searchResultList[#rowstatus][0]"/>
            		    <s:param name="openUploadedFileName" value="searchResultList[#rowstatus][11]"/>
        			</s:url>
						<s:a href="%{downloadFullPetitionDocuments}" title="Click to Open"><input type="button" id="downloadbutton" name="downloadbutton" value="Download" class="formbutton"/></s:a>
					</display:column>
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
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="communicationTypeSearch"/>
			</td>
		</tr>
</table>
<s:token/>
</s:form>
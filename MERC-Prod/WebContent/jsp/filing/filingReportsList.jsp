<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
	
	function reportWindow(url) {
		winddd = window.open(url,"report",'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no, addressbar=no');
		winddd.focus();	
	}
	
</script>  

<s:include value="/jsp/tiles/tabs.jsp"></s:include>     
<s:form theme="simple" name="filingReportsList">
	<s:hidden name="filingBeanId"/>
	<table border = "0" width="100%">
		<tr>
			<th colspan="7" class="mainheading">Report List</th>
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
		<s:if test="reportTemplateList.size>0">
			<tr>
				<td colspan="7">
					<table border = "0">
						<tr class="subheading">
							<td width="5%">S.No.</td>
							<td width="95%">Report Name</td>
						</tr>
						<s:iterator value="reportTemplateList" status="rowstatus">
						<tr class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>' valign="top">
							<td><s:property value="#rowstatus.count"/></td>
							<%-- <td><s:a id="reportWindow%{id}"  onclick="reportWindow('/cerc/run?__report=%{reportFileName}&petitionId=%{filingBeanId}&__format=pdf');" href="#"><s:property value="description"/></s:a></td> --%>
							<td>
							<s:if test="description=='Details of Petition (Law Division)'">
								<s:a id="reportWindow%{id}" onclick="reportWindow('/run?__report=%{reportFileName}&petitionId=%{filingBeanId}&__format=docx');" href="#">
								<s:property value="description"/></s:a>
							</s:if>
							<s:else>
								<s:a action="openSummaryReport">
	   								<s:param name="struts.token.name" value="%{'token'}"/>
									<s:param name="token" value="token"/>
									<s:param name="filingBeanId" value="%{filingBeanId}"/>
									<s:param name="reportName" value="%{reportFileName}"/>
									<s:property value="description"/>
								</s:a>
							</s:else>
							</td>
						</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
		</s:if>
		</table>
		<s:token/>	
</s:form>
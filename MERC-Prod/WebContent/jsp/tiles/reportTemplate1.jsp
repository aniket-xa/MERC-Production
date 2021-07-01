<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
function reportWindow(url) {
	winddd = window.open(url,"report",'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no');
	winddd.focus();
}
</script>       
<%-- <s:form theme="simple" name="pleadingList"> --%>
	<table border = "0">
		<tr>
			<th colspan="2" class="mainheading">Report List</th>
		</tr>
		<s:if test="reportTemplateList.size>0">
			<tr>
			<td colspan="2">
				<table border = "0">
					<tr class="subheading">
						<td width="5%">S.No.</td>
						<td width="95%">Report Name</td>
					</tr>
					<s:iterator value="reportTemplateList" status="rowstatus">
					<tr class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>' valign="top">
						<td><s:property value="#rowstatus.count"/></td>
						
						<td>
						<s:a action="openReportTemplateReport1">
	   								<s:param name="struts.token.name" value="%{'token'}"/>
									<s:param name="token" value="token"/>
									<s:param name="cercUserId" value="%{#session.CERC_USER.id}"/>
									<s:param name="reportName" value="%{reportFileName}"/>
									<s:property value="description"/>
								</s:a>
								
								<%-- <s:a id="reportWindow%{id}" onclick="reportWindow('/cerc/frameset?__report=%{reportFileName}&__parameterpage=false&userId=%{#session.CERC_USER.id}');" href="#"><s:property value="description"/></s:a> --%>
							
							<%-- <s:if test="isParameter==false">	
								<s:a id="reportWindow%{id}" onclick="reportWindow('/cerc/frameset?__report=%{reportFileName}&__parameterpage=false&userId=%{#session.CERC_USER.id}');" href="#"><s:property value="description"/></s:a>
							</s:if>
							<s:else>
								<s:a id="reportWindow%{id}" onclick="reportWindow('/cerc/frameset?__report=%{reportFileName}&__parameterpage=%{isParameter}');" href="#"><s:property value="description"/></s:a>
							</s:else> --%>	
						</td>
					</tr>
					</s:iterator>
					
					
					
				</table>
			</td>
		</tr>
		</s:if>	
		</table>	
<%-- </s:form> --%>
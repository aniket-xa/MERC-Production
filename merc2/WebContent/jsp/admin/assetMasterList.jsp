<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
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
<s:form theme="simple" name="newUserRegistration">
	<table border="0">
		<tr>
			<th colspan="10" class="mainheading">Assets / Units</th>
		</tr>
		<tr>
			<td colspan="10">
				<s:a action="assetMaster">
				<s:param name="struts.token.name" value="%{'token'}"/>
   				<s:param name="token" value="token"/>
   				Add Asset / Units</s:a>
			</td>
		</tr>
		<s:if test="assetMasterViewList.size>0">
			<tr class="subheading">
				<td width="7%">Sr. No.</td>
				<td width="10%">Region</td>
				<td width="8%">Type</td>
				<td width="15%">Name</td>
				<td width="15%">Asset</td>
				<td width="10%">Asset Type</td>
				<td width="10%">Capacity(MW) / ATC(Rs)</td>
				<td width="15%">Anti. Doco Date</td>
				<td width="17%">Doco Date</td>
				<td width="8%">Delete</td>
			</tr>
			<s:iterator value="assetMasterViewList" status="rowstatus">
				<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
					<s:url action="assetMasterEdit" var="assetMasterEdit">
					<s:param name="struts.token.name">token</s:param>
					<s:param name="token" value="token"/>
					<s:param name="assetMasterId" value="assetMasterViewList[#rowstatus.index][6]"/>
					</s:url>
					<td>
						<s:a href="%{assetMasterEdit}"><s:property value="#rowstatus.count" /></s:a>
					</td>
					<td>
					<s:if test="#rowstatus.index==0 or assetMasterViewList[#rowstatus.index][1]!=assetMasterViewList[#rowstatus.index-1][1]">
					<s:property value="assetMasterViewList[#rowstatus.index][1]"/>
					</s:if>
					</td>
					<td>
					<s:if test="#rowstatus.index==0 or assetMasterViewList[#rowstatus.index][2]!=assetMasterViewList[#rowstatus.index-1][2]">
					<%-- <s:if test="assetMasterViewList[#rowstatus.index][2]==3">TL</s:if>
					<s:elseif test="assetMasterViewList[#rowstatus.index][4]">GT</s:elseif>
					<s:elseif test="assetMasterViewList[#rowstatus.index][10]">TT</s:elseif> --%>
					<s:property value="assetMasterViewList[#rowstatus.index][16]"/>
					</s:if>
					</td>
					<td>
					<s:if test="#rowstatus.index==0 or assetMasterViewList[#rowstatus.index][5]!=assetMasterViewList[#rowstatus.index-1][5]">
					<s:property value="assetMasterViewList[#rowstatus.index][5]"/>
					</s:if>
					</td>
					<td><s:property value="assetMasterViewList[#rowstatus.index][7]"/></td>
					<td><s:property value="assetMasterViewList[#rowstatus.index][8]"/></td>
					<td align="right"><s:property value="getText('{0,number,#,###.##}',{assetMasterViewList[#rowstatus.index][9]})"/></td>
					<td><s:date name="assetMasterViewList[#rowstatus.index][10]" format="dd/MM/yyyy"/></td>
					<td><s:date name="assetMasterViewList[#rowstatus.index][11]" format="dd/MM/yyyy"/></td>
					<td>
						<s:url var="assetMasterDelete" action="assetMasterDelete">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="assetMasterId" value="assetMasterViewList[#rowstatus.index][6]"/>
						</s:url>
						<s:a href="%{assetMasterDelete}" onClick="return deleteConfirmation();">Delete</s:a>
					</td>
				</tr>

			</s:iterator>
		</s:if>
		<s:else>
			<tr align="center">
				<td colspan="6"><span class="required">No Record Found.</span></td>
			</tr>
		</s:else>
	</table>
	<br/>
	<s:token/>
</s:form>

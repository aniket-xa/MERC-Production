<%@ taglib uri="/struts-tags" prefix="s"%>

<s:form theme="simple" name="newUserRegistration">
	<table border="0">
		<s:if test="utrCountList.size>0">
			<tr class="subheading">
				<td width="2%">S.No.</td>
				<td width="11%">UTR No.</td>
				<td width="14%">Amount (Rs.)</td>
				<td width="16%">Bank Name</td>
				<td width="16%">Branch</td>
				<td width="13%">Deposited On</td>
				<td width="14%">Balance</td>
				<td width="16%">Deposited By</td>
				
			</tr>
			<s:iterator value="utrCountList" status="rowstatus">
				<s:url var="url" action="viewPendingUTR">
					<s:param name="struts.token.name">token</s:param>
					<s:param name="token" value="token" />
					<s:param name="filingBeanId" value="id" />
				</s:url>
				<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
					<td><s:a href="%{url}"><s:property value="#rowstatus.count" /></s:a></td>
					<td><s:property value="utrNumber"/></td>
					<td><s:property value="amountDeposited"/></td>
					<td><s:property value="bankName"/></td>
					<td><s:property value="branchName"/></td>
					<td><s:date name="depositDate" format="dd/MM/yyyy"/></td>
					<td><s:property value="balanceAmount"/></td>
					<td><s:property value="cercUserDepositedBy.firstName"/> <s:property value="cercUserDepositedBy.lastName"/></td>
				</tr>

			</s:iterator>
		</s:if>
		<s:else>
			<tr align="center">
				<td colspan="3"><span class="required">No Record Found.</span></td>
			</tr>
		</s:else>
	</table>
</s:form>

<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<script type="text/javascript">
	function feeReceiptReportWindow() {
		alert(this.href);
		/* winddd = window.open(url,"report",'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no');
		winddd.focus(); */
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
function payutrMaster(){
	
	//document.filingFeeDetails.action="payutrMaster?struts.token.name=token&token=<s:property value="token"/>";
	document.newUserRegistration.action="payutrMaster";
	document.newUserRegistration.submit();
}
</script>
<s:form theme="simple" id="newUserRegistration" name="newUserRegistration">
	<table border="0">
		<tr>
			<th colspan="9" class="mainheading">PAYMENT GATEWAY UTR Details for 
			<s:if test="#session.CERC_USER.refOrganisationId!=null">
			<s:property value="#session.CERC_USER.refOrganisationId.organisationName"/>
			</s:if>
			<s:else>
			<s:property value="#session.CERC_USER.firstName"/>
			<s:if test='#session.CERC_USER.middleName!=null and #session.CERC_USER.middleName!=""'> <s:property value="#session.CERC_USER.middleName"/></s:if>
			 <s:property value="#session.CERC_USER.listName"/>
			</s:else>
			</th>
		</tr>
		<tr>
			<%-- <td colspan="9">
				<s:a action="utrMaster">
				<s:param name="struts.token.name" value="%{'token'}"/>
   				<s:param name="token" value="token"/>
   				Add UTR</s:a>
			</td> --%>
			<td colspan="9">
			<span><s:submit id="" name="" value="Pay Online" class="formbutton" onclick="payutrMaster()" /></span>
			</td>
		</tr>
		<s:if test="utrMasterList.size>0">
		
			<tr>
				<td colspan="9">
					<display:table export="false" id="utrMaster" name="utrMasterList" pagesize="20" requestURI="">
						<display:column property="merchant_order_number" title="Order Id" sortable="true"/>
						<display:column property="amount" title="Order Amount(&#8377;)" sortable="true" style="text-align:right" format=""/>
						<display:column property="paymode" title="Payment Mode" sortable="true"/>
						<display:column property="sbiepay_reference_id_atrn" title="Transaction Id" sortable="true"/>
						<display:column property="transaction_status" format="" title="Transaction Status" sortable="true"/>
						<display:column  property="transaction_date" title="Transaction Date" sortable="true" style="text-align:right" format="{0,date,dd/MM/yyyy hh:mm:ss}"/>
						<display:column title="Deposited By" sortable="true">
							(<s:property value="%{#attr.utrMaster.updatedby.userType}"/>)
							<s:property value="%{#attr.utrMaster.updatedby.firstName}"/>
							<s:property value="%{#attr.utrMaster.updatedby.middleName}"/>
							<s:property value="%{#attr.utrMaster.updatedby.lastName}"/>
						</display:column>
						<%-- <display:column title="Verified By" sortable="true">
							<s:if test="%{#attr.utrMaster.cercUserVerifiedBy!=null}">(<s:property value="%{#attr.utrMaster.cercUserVerifiedBy.userType}"/>)</s:if>
							<s:property value="%{#attr.utrMaster.cercUserVerifiedBy.firstName}"/>
							<s:property value="%{#attr.utrMaster.cercUserVerifiedBy.middleName}"/>
							<s:property value="%{#attr.utrMaster.cercUserVerifiedBy.lastName}"/>
						</display:column> --%>
						
						<%-- <display:column property="refStatusId.statusName" title="Status" sortable="true"/>
						<display:column property="remarks" title="remarks" sortable="true"/> --%>
						<display:column title="Print" sortable="false">
							<%-- <s:a id="feeReceiptReportWindow%{#attr.utrMaster.id}" onclick="feeReceiptReportWindow('/cerc/run?__report=feeReceipt.rptdesign&utrId=%{#attr.utrMaster.id}');" href="#">
								Print
							</s:a> --%>
							<s:a action="printUtrDetailsReport">
	   								<s:param name="struts.token.name" value="%{'token'}"/>
   									<s:param name="token" value="token"/>
									<s:param name="utrId" value="%{#attr.utrMaster.id}"/>
									<s:param name="reportName" value="%{'feeReceipt.rptdesign'}"/>
									Print
								</s:a>
						</display:column>
						<%-- <s:if test="#session.CERC_USER.refOrganisationId.id==1">
						<display:column title="Edit" sortable="false">
							<s:a id="feeReceiptReportWindow%{#attr.utrMaster.id}" onclick="feeReceiptReportWindow('/cerc/run?__report=feeReceipt.rptdesign&utrId=%{#attr.utrMaster.id}');" href="#">
								Print
							</s:a>
							<s:a action="utrMasterEdit">
	   								<s:param name="struts.token.name" value="%{'token'}"/>
   									<s:param name="token" value="token"/>
									<s:param name="utrId" value="%{#attr.utrMaster.id}"/>
									Edit
								</s:a>
						</display:column>
						</s:if> --%>
						
						<%-- <display:column title="Address" sortable="true">
							<s:property value="%{#attr.refPetitionerRespondentMapping.cercUserRespondentId.address}"/>,<br/> 
							<s:property value="%{#attr.refPetitionerRespondentMapping.cercUserRespondentId.refCityId.cityName}"/>,<br/> 
							<s:property value="%{#attr.refPetitionerRespondentMapping.cercUserRespondentId.refStateId.stateName}"/> - 
							<s:property value="%{#attr.refPetitionerRespondentMapping.cercUserRespondentId.pinCode}"/>
						</display:column>
						
						<display:column property="cercUserRespondentId.mobile" title="Mobile" sortable="true"/>
						
						<s:url var="respondentMappingDelete" action="respondentMappingDelete">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="refRespondentMappingId" value="%{#attr.refPetitionerRespondentMapping.id}"/>
						</s:url>
						<display:column title="Delete" sortable="false">
							<s:a href="%{respondentMappingDelete}" onClick="return deleteConfirmation();">Delete</s:a>
						</display:column>	 --%>								
					</display:table>
				</td>
			</tr>
			
			
			
			<%-- <tr class="subheading">
				<td width="2%">S.No.</td>
				<td width="10%">UTR No.</td>
				<td width="13%">Amount (Cr.)</td>
				<td width="15%">Bank Name</td>
				<td width="15%">Branch</td>
				<td width="12%">Deposited On</td>
				<td width="10%">Balance</td>
				<td width="12%">Deposited By</td>
				<td width="7%">Status</td>
				<td width="6%">Print</td>
				
			</tr>
			<s:iterator value="utrMasterList" status="rowstatus">
				<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
					<td><s:property value="#rowstatus.count" /></td>
					<td><s:property value="utrNumber"/></td>
					<td><s:property value="amountDeposited"/></td>
					<td><s:property value="bankName"/></td>
					<td><s:property value="branchName"/></td>
					<td><s:date name="depositDate" format="dd/MM/yyyy"/></td>
					<td><s:property value="balanceAmount"/></td>
					<td><s:property value="cercUserDepositedBy.firstName"/> <s:property value="cercUserDepositedBy.lastName"/></td>
					<td><s:property value="refStatusId.statusName"/></td>
					<td><s:a id="feeReceiptReportWindow%{id}" onclick="feeReceiptReportWindow('/birt/frameset?__report=feeReceipt.rptdesign&utrId=%{id}');" href="#">
					Print
					</s:a></td>
				</tr>

			</s:iterator> --%>
		</s:if>
		<s:else>
			<tr align="center">
				<td colspan="9"><span class="required">No Record Found.</span></td>
			</tr>
		</s:else>
	</table>
	<br/>
	<s:token/>
</s:form>

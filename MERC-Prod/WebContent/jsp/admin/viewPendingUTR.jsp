<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="js/inputFieldValidationFilter.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		/* $("input[name='savebutton']").click(function(){
				
		}); */ 
	});
	function utrVerifyConfirmation() 
	{
	    
	   /*  if(filterTextArea.test($('#accountOf').val())==false)
		{					
			alert("Invalid Account of description.");
			$('#accountOf').focus();
			return false;
		} */
	    var x=confirm('Are you sure you want to verify this UTR ?');
	    if (x) 
	    {
	    	document.utrMaster.action="verifyPendingUTR?struts.token.name=token&token=<s:property value="token"/>";
			document.utrMaster.submit()
	    	return true;
	    } 
	    else 
	    {
	        return false;
	    }
	    
	}
	function utrRejectConfirmation() 
	{
	    
	    /* if(filterTextArea.test($('#accountOf').val())==false)
		{					
			alert("Remarks missing.");
			$('#accountOf').focus();
			return false;
		} */
	    var x=confirm('Are you sure you want to reject this UTR ?');
	    if (x) 
	    {
	    	document.utrMaster.action="rejectPendingUTR?struts.token.name=token&token=<s:property value="token"/>";
			document.utrMaster.submit()
	    	return true;
	    } 
	    else 
	    {
	        return false;
	    }
	    
	}
</script>

<s:form theme="simple" name="utrMaster" >
<s:hidden name="filingBeanId"/>
	<table border="0">
		<tr>
			<th colspan="7" class="mainheading">UTR Details</th>
		</tr>
		<tr>
			<td width="20%">Deposited For</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="refUtr.cercUserDepositedFor.refOrganisationId.organisationName"/></td>
			<td width="20%">Deposited By</td>
			<td width="1%">:</td>
			<s:if test="refUtr.cercUserDepositedBy.refOrganisationId!!=null">
				<td width="28%"><s:property value="refUtr.cercUserDepositedBy.refOrganisationId.organisationName"/></td>
			</s:if>
			<s:else>
				<td width="28%"><s:property value="refUtr.cercUserDepositedBy.firstName"/> <s:property value="refUtr.cercUserDepositedBy.lastName"/></td>
			</s:else>
		</tr>
		<tr>
			<td width="20%">UTR No<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%" colspan="3"><s:property value="refUtr.utrNumber"/></td>
		</tr>
		<tr>
			<td>Amount Deposited<span class="required">*</span></td>
			<td>:</td>
			<td><s:property value="%{getText('{0,number,#,###.##}',{refUtr.amountDeposited})}"/></td>
			<td>Deposit Date<span class="required">*</span></td>
			<td>:</td>
			<td><s:date name="refUtr.depositDate" format="dd/MM/yyyy"/></td>
		</tr>
		<tr>
			<td>Bank Name<span class="required">*</span></td>
			<td>:</td>
			<td><s:property value="refUtr.bankName"/></td>
			<td>Branch Name<span class="required">*</span></td>
			<td>:</td>
			<td><s:property value="refUtr.branchName"/></td>
		</tr>
		<tr>
			<td>Remarks</td>
			<td>:</td>
			<td colspan="4"><s:textarea name="refUtr.accountOf" id="accountOf" cols="150"/></td>
		</tr>
		
		<tr>
				<td align="right" colspan="7">
				<input type="submit" id="savebutton" name="savebutton" onClick="return utrRejectConfirmation();" value="Reject" class="formbutton" />&nbsp;&nbsp;
				<input type="submit" id="savebutton" name="savebutton" onClick="return utrVerifyConfirmation();" value="Verify" class="formbutton" />&nbsp;&nbsp;
				<s:submit id="searchbutton" value="Cancel" cssClass="formbutton" action="viewPendingUTRCount"/></td>
			</tr>
	</table>
	<s:token/>
</s:form>
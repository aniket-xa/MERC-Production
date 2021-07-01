<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="js/inputFieldValidationFilter.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var crDt=new Date();
		$("input[name='savebutton']").click(function(){
			
			if($('#utrNumber').val()=="")
			{
				alert("Please enter UTR Number.")
				$('#utrNumber').focus();
				return false;
			}
			else if(filterTextArea.test($('#utrNumber').val())==false)
			{
				alert("Invalid UTR Number.")
				$('#utrNumber').focus();
				return false;
			}
			
			
			else if($('#bankName').val()=="")
			{
				alert("Please enter bank name.")
				$('#bankName').focus();
				return false;
			}
			else if(filterTextArea.test($('#bankName').val())==false)
			{					
				alert("Invalid bank name.");
				$('#bankName').focus();
				return false;
			} 
			else if($('#branchName').val()=="")
			{
				alert("Please enter branch name.")
				$('#branchName').focus();
				return false;
			}
			else if(filterTextArea.test($('#branchName').val())==false)
			{					
				alert("Invalid branch name.");
				$('#branchName').focus();
				return false;
			}
			
			else if($('#remarks').val()=="")
			{
				alert("Please enter remarks")
				$('#remarks').focus();
				return false;
			}
			  
		});

	});

	
</script>
<div class="message">
	<s:fielderror />
	<s:actionerror />
	<s:actionmessage />
</div>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:form theme="simple" name="utrMasterEdit" action="utrMasterEditSave">
<s:hidden name="refUtr.id" />
<s:hidden name="refUtr.utrNumber" />
<s:hidden name="refUtr.bankName" />
<s:hidden name="refUtr.branchName" />
<s:hidden name="refUtr.amountDeposited" />
<s:hidden name="refUtr.depositDate" />
<s:hidden name="refUtr.balanceAmount" />
<s:hidden name="refUtr.refStatusId.id" />
<%-- <s:hidden name="refUtr.cercUserVerifiedBy.id" /> --%>
<s:hidden name="refUtr.verifiedOn" />
<s:hidden name="refUtr.accountOf" />
<s:hidden name="refUtr.updatedOn" />
<%-- <s:hidden name="refUtr.updatedBy.id" /> --%>


<table border="0">
		<s:if test="hasActionMessages()">
			<tr align="left">
				<td colspan="7"><font color="red" size="3pt"><s:actionmessage/></font></td>
			</tr>
		</s:if>
		<tr>
			<th colspan="7" class="mainheading">UTR Details : <s:date name="refUtr.depositDate" format="dd/MM/yyyy"/></th>
		</tr>
		<tr>
		<s:hidden name="refUtr.cercUserDepositedFor.id"/>
		<s:hidden name="refUtr.cercUserDepositedBy.id"/>
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
			<td width="20%">RTGS-UTR No/NEFT-Ref No<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%" colspan="3"><%-- <s:property value="refUtr.utrNumber"/><br/> --%>
			<s:textfield name="utrNumber" id="utrNumber" value = "%{refUtr.utrNumber}"/>
			</td>
		</tr>
		<tr>
			<td width="20%">Amount Deposited</td>
			<td width="1%">:</td>
			<td width="28%">&#8377;<s:property value="refUtr.amountDeposited"/></td>
			<td width="20%">Deposit Date</td>
			<td width="1%">:</td>
			<td width="28%"><s:date name="refUtr.depositDate" format="dd/MM/yyyy"/></td>
		</tr>
		<tr>
			<td width="20%">Bank Name<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"><%-- <s:property value="refUtr.bankName"/><br/> --%>
			<s:textfield name="bankName" id="bankName" value = "%{refUtr.bankName}"/></td>
			<td width="20%">Branch Name<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"><%-- <s:property value="refUtr.branchName"/><br/> --%>
			<s:textfield name="branchName" id="branchName" value = "%{refUtr.branchName}"/></td>
		</tr>
		<tr>
			<td width="20%">Remarks<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"><%-- <s:property value="refUtr.remarks"/><br/> --%>
			<s:textfield name="remarks" id="remarks" value = "%{refUtr.remarks}"/></td>
		</tr>
		<tr>
				<td align="right" colspan="7"><input type="submit"
					id="savebutton" name="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp;<input
					type="reset" id="searchbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
					<s:submit id="searchbutton" value="Cancel" cssClass="formbutton" action="utrMasterList"/></td>
			</tr>
	</table>
	<s:token/>
</s:form>
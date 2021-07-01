<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="js/inputFieldValidationFilter.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var crDt=new Date();
		$("input[name='savebutton']").click(function(){
			var depositDate=null;
			//alert("Hiiiiiiii" +$("#orderDateId").val());
			if ($("#depositDate").val()!="")
			{
				
				var from = $("#depositDate").val().split("/");
				depositDate = new Date(from[2], from[1] - 1, from[0]);
			}
			
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
			else if($('#amountDeposited').val()=="")
			{
				alert("Please enter amount deposited.")
				$('#amountDeposited').focus();
				return false;
			}
			else if(filterNumeric.test($('#amountDeposited').val())==false)
			{					
				alert("Amount should be numeric.");
				$('#amountDeposited').focus();
				return false;
			} 
			else if($('#depositDate').val()=="")
			{
				alert("Please enter deposit date.")
				$('#depositDate').focus();
				return false;
			}
			else if(dtRegex.test($('#depositDate').val())==false)
			{
				alert("Invalid deposit date.")
				$('#depositDate').focus();
				return false;
			}
			else if(depositDate.getTime()>crDt.getTime())
			{
				alert("Deposit date should not be future date.");
				$('#depositDate').focus();
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
			  
		});

	});

	
</script>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:form theme="simple" name="utrMaster" action="utrMasterSave">
	<table border="0">
		<s:if test="hasActionMessages()">
			<tr align="left">
				<td colspan="7"><font color="red" size="3pt"><s:actionmessage/></font></td>
			</tr>
		</s:if>
		<tr>
			<th colspan="7" class="mainheading">UTR Details</th>
		</tr>
		<tr>
		<s:hidden name="cercUserDepositedFor.id"/>
		<s:hidden name="cercUserDepositedBy.id"/>
			<td width="20%">Deposited For</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercUserDepositedFor.refOrganisationId.organisationName"/></td>
			<td width="20%">Deposited By</td>
			<td width="1%">:</td>
			<s:if test="cercUserDepositedBy.refOrganisationId!!=null">
				<td width="28%"><s:property value="cercUserDepositedBy.refOrganisationId.organisationName"/></td>
			</s:if>
			<s:else>
				<td width="28%"><s:property value="cercUserDepositedBy.firstName"/> <s:property value="cercUserDepositedBy.lastName"/></td>
			</s:else>
		</tr>
		<tr>
			<td width="20%">RTGS-UTR No/NEFT-Ref No<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%" colspan="3"><s:textfield name="utrNumber" id="utrNumber"/></td>
		</tr>
		<tr>
			<td width="20%">Amount Deposited<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%">&#8377; <s:textfield name="amountDeposited" id="amountDeposited" value="%{getText('{0,number,#,###.##}',{amountDeposited})}"/></td>
			<td width="20%">Deposit Date<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"><s:textfield name="depositDate" id="depositDate" cssClass="tcal"/></td>
		</tr>
		<tr>
			<td width="20%">Bank Name<span class="required">*</span></td>
			<td width="1%">:</td>
			<!-- 			04-02-2020 start AK -->
			<td width="28%"><s:textfield onkeypress="return /[a-z- -]/i.test(event.key)" name="bankName" id="bankName" /></td>
			
			<td width="20%">Branch Name<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"><s:textfield onkeypress="return /[a-z- -]/i.test(event.key)" name="branchName" id="branchName"/></td>
		<!-- 			04-02-2020 end AK -->
		</tr>
<!-- 		<tr> -->
<%-- 			<td width="20%">Remarks<span class="required">*</span></td> --%>
<!-- 			<td width="1%">:</td> -->
<%-- 			<td width="28%"><s:textfield name="remarks" id="remarks"/></td> --%>
<!-- 		</tr> -->
		<tr>
				<td align="right" colspan="7"><input type="submit"
					id="savebutton" name="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp;<input
					type="reset" id="searchbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
					<s:submit id="searchbutton" value="Cancel" cssClass="formbutton" action="utrMasterList"/></td>
			</tr>
	</table>
	<s:token/>
</s:form>
<%@ taglib uri="/struts-tags" prefix="s"%>


<script src="js/inputFieldValidationFilter.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		var crDt=new Date();
		/* $("input[name='savebutton']").click(function(){
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
 */
	});

	function payutrsuccess(){
		
		 
		document.payutrMaster.action="filingFeeDetails?struts.token.name=token&token=<s:property value="token"/>";
		document.payutrMaster.submit();
	}	
	
	function utrpaysucfail(){
		if($('#oredramt').val()=="")
		{
			alert('Please Enter Order Amount.')
			$('#oredramt').focus()
			return false; 
		}
		
		
		document.payutrMaster.action="utrpaysucfail?struts.token.name=token&token=<s:property value="token"/>";
		document.payutrMaster.submit();
	}
</script>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:form theme="simple" name="payutrMaster" action="payutrMaster">
<s:hidden name="filingBeanId"/>
<s:hidden name="cercPetition.refPetitionTypeId.petitionTypeCode" id="petitionTypeCode"/>
	<table border="0">
		<s:if test="hasActionMessages()">
			<tr align="left">
				<td colspan="7"><font color="red" size="3pt"><s:actionmessage/></font></td>
			</tr>
		</s:if>
		<tr>
			<th colspan="7" class="mainheading">Merc Customer Checkout page</th>
			
		</tr>
		<tr>
		
		<tr>
			<td width="20%">Order ID<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"  align="right" colspan="2"><s:textfield disabled="true"  readonly="true" size="45"  name="oredrid" id="oredrid"/></td>
		</tr>
		<tr>
			<td width="20%">Order Amount<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="27%" align="right" colspan="2">&#8377;<s:textfield size="45" onkeypress="return /[0-9- -]/i.test(event.key)" name="oredramt" id="oredramt"/></td>
		</tr>
		
		<%-- <tr>
			<td width="20%">Currency<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%" align="right" colspan="2"><s:textfield  readonly="true" size="45" value="INR" name="oredrcurncy" id="oredrcurncy"/></td>
		</tr> --%>
		
		<tr>
			<td width="20%">Customer Details</td>
			<td width="1%">:</td>
		</tr>
		
		
		<tr>
			<td width="20%">First Name<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"> <s:textfield  readonly="true"  name="firstname" id="firstname" onkeypress="return /[a-z- -]/i.test(event.key)"/></td>
			<td width="20%">Last Name<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"><s:textfield readonly="true"  name="lastname" id="lastname" onkeypress="return /[a-z- -]/i.test(event.key)"/></td>
		</tr>
		<tr>
			<td width="20%">Address<span class="required">*</span></td>
			<td width="1%">:</td>
			<!-- 			04-02-2020 start AK -->
			<td width="28%"><s:textfield readonly="true"  onkeypress="return /[a-z- -]/i.test(event.key)" name="add" id="add" /></td>
			
			<td width="20%">State<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"><s:textfield  readonly="true"  onkeypress="return /[a-z- -]/i.test(event.key)" name="state" id="state"/></td>
		<!-- 			04-02-2020 end AK -->
		</tr>
		
		<tr>
			<td width="20%">City<span class="required">*</span></td>
			<td width="1%">:</td>
			<!-- 			04-02-2020 start AK -->
			<td width="28%"><s:textfield readonly="true"  onkeypress="return /[a-z- -]/i.test(event.key)" name="city" id="city" /></td>
			
			<td width="20%">Pincode<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"><s:textfield readonly="true"  onkeypress="return /[a-z- -]/i.test(event.key)" name="pincode" id="pincode"/></td>
		<!-- 			04-02-2020 end AK -->
		</tr>
		
<!-- 		<tr> -->
<%-- 			<td width="20%">Remarks<span class="required">*</span></td> --%>
<!-- 			<td width="1%">:</td> -->
<%-- 			<td width="28%"><s:textfield name="remarks" id="remarks"/></td> --%>
<!-- 		</tr> -->
		<tr>
				<td align="center" colspan="7">
				<br>
				<s:if test="#session.CERC_USER.userType != 'E'">
				
				<s:submit id="" name="" value="Pay Now" class="formbutton" onClick= "utrpaysucfail()"/>
				<s:if test="filingBeanId != null"> 
				<s:submit id="" name="" value="cancel" class="formbutton" onClick="payutrsuccess()"/>
				</s:if>
				</s:if>
<!-- 				&nbsp;&nbsp;	 -->
<%-- 				<s:submit id="" name="" value="cansel" class="formbutton" onClick="payutrsuccess()"/> --%>
				<s:else>
<%-- 				<s:submit id="" name="" value="Pay Now" class="formbutton" onClick= ""/> --%>
<!-- 				&nbsp;&nbsp;	 -->
<%-- 				<s:submit id="" name="" value="cancel" class="formbutton" onClick=""/> --%>
				</s:else>
				<td>	
			</tr>
	</table>
	<s:token/>
</s:form>
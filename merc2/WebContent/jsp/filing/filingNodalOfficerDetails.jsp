<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
</script>

<script type="text/javascript">
	$(document).ready(function() {
     
		$("input[name='savebutton']").click(function(){
			if($('#cercUserNodalOfficerId').val()=="")
			{
				alert("Please select Nodal Officer.");
				return false;
			}
			else
			{
				document.filingNodalOfficerDetails.action="filingNodalOfficerDetailsSave";
    			document.filingNodalOfficerDetails.submit();
			}
		});
		
		
		
	});
</script>

<s:include value="/jsp/tiles/tabs.jsp"></s:include>
	<s:form theme="simple" name="filingNodalOfficerDetails">
	<s:hidden name="filingBeanId"/>
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Nodal Officer Details</th>
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
		<s:hidden name="referenceNumber"/>
		<s:hidden name="referenceYear"/>
		<s:hidden name="referenceNumberDisplay"/>
		<s:hidden name="diaryNumber"/>
		<s:hidden name="diaryYear"/>
		<s:hidden name="diaryNumberDisplay"/>
		<s:hidden name="registrationNumber"/>
		<s:hidden name="registrationYear"/>
		<s:hidden name="registrationNumberDisplay"/>
		
		<tr>
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>
			<td width="2%"></td>
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>					
		</tr>
		<tr valign="top">
			<td>Nodal Officer<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<s:select list="cercUserList" listKey="id" listValue="'['+refOrganisationId.organisationName+' - '+refOrganisationId.shortName+'] - '+userName+' ['+employeeDepartment+'-'+employeeDesignation+']'" name="cercUserNodalOfficerId" id="cercUserNodalOfficerId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:242pt"/>
			</td>
		</tr>
		
		<tr><td colspan="7"></td></tr>
		<tr><td colspan="7" align="right">
		<input type="submit" id="savebutton" name="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp;
		<input type="submit" id="searchbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
		<s:submit type="submit" id="searchbutton" value="Cancel" class="formbutton" action="filingNodalOfficerDetailsList"/>
		</td></tr>
	</table>
	<s:token/>
</s:form>	
            	
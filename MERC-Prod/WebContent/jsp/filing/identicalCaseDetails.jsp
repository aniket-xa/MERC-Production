<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">
	function searchIdenticalCase(){
		if($('#refCaseTypeId').val()=="")
		{
			alert("Please select case type.");
			$('#refCaseTypeId').focus();
			return false;
		}
		else if($('#registrationNumberId').val()=="")
		{
			alert("Please enter Petition Number.");
			$('#registrationNumberId').focus();
			return false;
		}
		else if($('#registrationYearId').val()=="")
		{
			alert("Please select year.");
			$('#registrationYearId').focus();
			return false;
		}
		else
		{
			document.identicalCaseDetails.action="searchIdenticalCase?struts.token.name=token&token=<s:property value="token"/>";
			document.identicalCaseDetails.submit();
		}
	}
	$(document).ready(function() {
		
		$("#registrationNumberId").on('keypress',function (e) 
	    	    {
	    	        //if the letter is not digit then display error and don't type anything
	    	        if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57))
	    	        {
	    	           //display error message
	    	        	$("#regNoerrmsg").html("Digits Only").hide();
	    	            return true;
	    	       	}
	    	        else
	    	        {
	    	        	$("#regNoerrmsg").html("Digits Only").show();
	    	        	e.preventDefault();
	    	            
	    	        }
	    	    });
		});
</script>
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="identicalCaseDetails" action="searchIdenticalCaseSave">
<s:hidden name="filingBeanId"/>
<s:hidden name="cercIdenticalPetitionId"/>
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Add Identical Petitions</th>
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
			<td colspan="7">
				<table border = "0">
		<tr>
			<td>
			Petition Type&nbsp;<span class="required">*</span>:&nbsp;
			<s:select list="refPetitionTypeList" name="refPetitionTypeToSearch.id" id="refCaseTypeId" listKey="id" listValue="petitionTypeCode+'  '+petitionType" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/>	
			&nbsp;&nbsp;Number&nbsp;<span class="required">*</span>:&nbsp;<s:textfield type="text" size="10" name="registrationNumberSearch" id="registrationNumberId"/><span id="regNoerrmsg" class="tooltip"></span>
			&nbsp;&nbsp;Year&nbsp;<span class="required">*</span>:&nbsp;
			<s:select  name="registrationYearSearch" id="registrationYearId" list="yearList" headerValue="- Select -" headerKey=""/>
			&nbsp;&nbsp;
			<input type="submit" name="searchbutton" id="searchbutton" value="Search" class="formbutton" onclick="return searchIdenticalCase();" />	
		</tr>		
	</table>
			</td>
		</tr>
		<s:if test="cercPetitionSearched!=null">
		<tr>
		<td>
		<table border="0">
		<tr class="subheading">
			<td width="16%">Petition No.</td>
			<td width="*">Subject</td>
			<td width="20%">Filed By</td>
		</tr>
		<tr>
		<td><s:property value="cercPetitionSearched.registrationNumberDisplay"/></td>
		<td><s:property value="cercPetitionSearched.refSubjectId.subject"/><br/><s:property value="cercPetitionSearched.subject"/></td>
		<td><s:property value="cercPetitionSearched.cercUserFiledBy.firstName"/> <s:property value="cercPetitionSearched.cercUserFiledBy.lastName"/></td>
		</tr>
		</table>
		</td>
		</tr>
		<tr>
		<td align="right">
		<input type="submit" id="savebutton" name="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp;
		<input type="reset" id="searchbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
		<s:submit type="submit" id="searchbutton" value="Cancel" class="formbutton" action="identicalCaseDetailsList"/></td></tr>
		</s:if>
		<s:elseif test="counter==1">
		<tr align="center">
		<td colspan="7"><span class="required">Petition not found</span></td>
		</tr>
		</s:elseif>
	</table>
	<s:token/>
</s:form>	
            	
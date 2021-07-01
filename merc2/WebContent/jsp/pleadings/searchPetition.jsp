<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
	$(document).ready(function() {
     
		if($('input[name="searchBy"]:checked').val()=="1")
		{
			$('#refPetitionTypeId').val("");
			$('#refPetitionTypeId').attr('disabled', true);
		}
		else if($('input[name="searchBy"]:checked').val()=="2")
		{
			$('#refPetitionTypeId').attr('disabled', false);
		}
		else
		{
			$('#refPetitionTypeId').val("");
			
			$('#refPetitionTypeId').attr('disabled', true);
		}
		
		$(".petitionDetails").hide();
		 
		$('input[name="searchbutton"]').on('click',function () {
			$(".petitionDetails").show();			
		});
	});  
	
	      	
</script>


<s:form theme="simple" name="searchPetition" action="searchPetition">
	<table border = "0">
		<tr>
			<td>
			Search By&nbsp;:&nbsp;
			<s:select list="#{1:'Diary Number',2:'Petition Number'}" name="searchBy" id="searchBy" headerKey="" headerValue="- Select -" theme="simple" cssStyle="width:115pt"/>
			&nbsp;&nbsp;
			Type&nbsp;:&nbsp;
			<span class="registrationSearch">
				<s:select list="refPetitionTypeList" name="refPetitionType.id" id="refPetitionTypeId" listKey="id" listValue="petitionType+'  ('+petitionTypeCode+')'" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/>
			</span>
			&nbsp;&nbsp;
			Number&nbsp;:&nbsp;
			<span class="diaryRegistrationSearch">
				<s:textfield size="8" name="searchPetitionNumber" id="searchPetitionNumber"/>
			</span>	
			&nbsp;&nbsp;
			Year&nbsp;:&nbsp;
			<span class="diaryRegistrationSearch">
				<s:select  name="relatedCaseYear" id="relatedCaseYearId" list="yearList" headerValue="- Select -" headerKey="" cssStyle="width:60pt"/>
			</span>	
			&nbsp;&nbsp;
			<span class="diaryRegistrationSearch">
				<input type="submit" name="searchbutton" id="searchbutton" value="Search" class="formbutton" />
			</span>		
		</tr>		
	</table>
	<s:token/>
</s:form>	
            	
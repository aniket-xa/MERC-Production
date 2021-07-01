<%@ taglib uri="/struts-tags" prefix="s"%>


<s:form theme="simple" name="searchPetition" action="searchPetition">
	<table border = "0">
		<tr>
			<td>
			Search By&nbsp;:&nbsp;
			<s:select list="#{1:'Diary Number',2:'Petition Number'}" name="searchBy" id="searchBy" headerKey="" headerValue="- Select -" theme="simple" cssStyle="width:115pt"/>
				&nbsp;&nbsp;Type&nbsp;:&nbsp;
			<s:select list="refPetitionTypeList" name="refPetitionType.id" id="refPetitionTypeId" listKey="id" listValue="petitionType+'  ('+petitionTypeCode+')'" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/>
			&nbsp;&nbsp;Number&nbsp;:&nbsp;<s:textfield size="8" name="searchedPetitionNumber" id="searchNumber"/>
			&nbsp;&nbsp;Year&nbsp;:&nbsp;
			<s:select name="searchedPetitionYear" id="relatedCaseYearId" list="yearList" headerValue="- Select -" headerKey="" cssStyle="width:60pt"/>
			&nbsp;&nbsp;
			<input type="submit" name="searchbutton" id="searchbutton" value="Search" class="formbutton" />	
		</tr>		
	</table>
	<s:token/>
</s:form>
	
            	
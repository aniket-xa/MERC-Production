<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="sjt" uri="/struts-jquery-tree-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<sj:head jqueryui="true" customBasepath="css" jquerytheme="jquery_tree_ui" debug="true" />
<script type="text/javascript">

$(document).ready(function() {
	//$(".petitionNumber").attr('disabled', true);
	
	if ($('input:radio[name=petitionSelected]:checked').val() == "Y") 
	{
		
		$('#refCaseTypeId').attr('disabled',false);
		$('#registrationNumberId').attr('disabled',false);
		$('#registrationYearId').attr('disabled',false);
		$('#searchbutton').attr('disabled',false);
	}
	else if ($('input:radio[name=petitionSelected]:checked').val() == "N") 
	{
		$('#refCaseTypeId').attr('disabled',true);
		$('#refCaseTypeId').val("")
		$('#registrationNumberId').attr('disabled',true);
		$('#registrationNumberId').val("")
		$('#registrationYearId').attr('disabled',true);
		$('#registrationYearId').val("")
		$('#searchbutton').attr('disabled',true);
	}
	
	$('input[name="petitionSelected"]').change(function () {
	if ($('input:radio[name=petitionSelected]:checked').val() == "Y") {
		$('#refCaseTypeId').attr('disabled',false);
		$('#registrationNumberId').attr('disabled',false);
		$('#registrationYearId').attr('disabled',false);
		$('#searchbutton').attr('disabled',false);
	}
	else if ($('input:radio[name=petitionSelected]:checked').val() == "N") 
	{
		$('#refCaseTypeId').attr('disabled',true);
		$('#refCaseTypeId').val("")
		$('#registrationNumberId').attr('disabled',true);
		$('#registrationNumberId').val("")
		$('#registrationYearId').attr('disabled',true);
		$('#registrationYearId').val("")
		$('#searchbutton').attr('disabled',true);
	}
	});
	$("input[name='savebutton']").click(function () {
		
		var checked_ids = [];
    
    $('#treeDynamicCheckboxes').jstree("get_checked",null,true).each(function(){
        checked_ids.push(this.id);
    });
    //setting to hidden field
    document.getElementById('blockedDocument').value = checked_ids.join(",");
    if($('#blockUser').val()=="")
    {
    	alert("Please select user.");
    	return false;
    }
    
    
	
    
    var test = document.getElementById("blockedDocument").value;
    //alert(test);
    if(test==null ||test==""){
    	alert("Please select atleast one document type");
    	return false;
    }
    	
    
});
});
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

function searchCaseToBlock(){
	var filterRegNo = /^([0-9.]+)$/;
	if($('#refCaseTypeId').val()=="")
	{
		alert("Please select petition type.");
		$('#refCaseTypeId').focus();
		return false;
	}
	else if($('#registrationNumberId').val()=="")
	{
		alert("Please enter Petition Number.");
		$('#registrationNumberId').focus();
		return false;
	}
	else if(filterRegNo.test($('#registrationNumberId').val())==false)
	{
		alert("Invalid petition number.")
		$('#registrationNumberId').focus();
		return false;
	}
	else if($('#registrationYearId').val()=="")
	{
		alert("Please select year.");
		$('#registrationYearId').focus()
		return false;
	}
	else
	{
		document.documentAuthorisation.action="searchCaseToBlock?struts.token.name=token&token=<s:property value="token"/>";
		document.documentAuthorisation.submit();
	}
}</script>
<s:form theme="simple" name="documentAuthorisation" action="searchCaseToBlockSave" id="documentAuthorisation">
	<table border="0">
		<tr>
			<th colspan="3" class="mainheading">Petitioner Document Authorisation</th>
		</tr>
		<tr>
			<td>Block For</td>
			<td>:</td>
			<td><s:radio list="#{'O':'Organisation','E':'Employee','I':'Any Person/Individual' }" name="blockFor"/></td>
		</tr>
		<tr>
			<td>Users<span class="required">*</span></td>
			<td>:</td>
			<td><s:select list="userList" name="blockUser" id="blockUser" listKey="id" listValue="firstName" headerKey="" headerValue="- Select -"/></td>
		</tr>
		<tr>
			<td>Petition</td>
			<td colspan="2" align="left"><s:radio list="#{'Y':'Yes','N':'No'}" name="petitionSelected" ></s:radio></td>
		</tr>
		<tr class="petitionNumber">
			<td colspan="3">
			Petition Type&nbsp;<span class="required">*</span>:&nbsp;
			<s:select list="refPetitionTypeList" name="refPetitionTypeId" id="refCaseTypeId" listKey="id" listValue="petitionTypeCode+'  '+petitionType" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/>	
			&nbsp;&nbsp;Number&nbsp;<span class="required">*</span>:&nbsp;<s:textfield type="text" size="10" name="registrationNumberSearch" id="registrationNumberId"/>
			&nbsp;&nbsp;Year&nbsp;<span class="required">*</span>:&nbsp;
			<s:select  name="registrationYearSearch" id="registrationYearId" list="yearList" headerValue="- Select -" headerKey=""/>
			&nbsp;&nbsp;
			<input type="submit" name="searchbutton" id="searchbutton" value="Search" class="formbutton" onclick="return searchCaseToBlock();" />
			</td>
		</tr>		
	</table>
	<br/>
	<%-- <s:if test="cercPetitionSearched!=null"> --%>
	<s:hidden name="filingBeanId" value="%{cercPetitionSearched.id}"/>
	<%-- <sj:submit onClickTopics="checkAllNodesTopic" value="Check all Nodes" button="true" />
    	<sj:submit onClickTopics="uncheckAllNodesTopic" value="Uncheck all Nodes" button="true" />
    	<sj:submit onClickTopics="showCheckboxesTopic" value="Show Checkboxes" button="true" />
    	<sj:submit onClickTopics="hideCheckboxesTopic" value="Hide Checkboxes" button="true" /> --%>
	 <sjt:tree 
                name="echo"
                id="treeDynamicCheckboxes" 
                jstreetheme="apple"
                rootNode="nodes"
                childCollectionProperty="children"
                nodeTitleProperty="title"
                nodeIdProperty="id"
                openAllOnLoad="false" 
                checkbox="true"
                checkboxCheckAllTopics="checkAllNodesTopic"
                checkboxUncheckAllTopics="uncheckAllNodesTopic"
                checkboxShowTopics="showCheckboxesTopic"
                checkboxHideTopics="hideCheckboxesTopic"
                onClickTopics="treeClicked" />
                <br/>
        <input type="submit" id="savebutton" name="savebutton" value="Save" class="formbutton"/>
        <input type="hidden" name="blockedDocument" id="blockedDocument" value="" />
    <%-- </s:if> --%>
   <s:token/>
</s:form>

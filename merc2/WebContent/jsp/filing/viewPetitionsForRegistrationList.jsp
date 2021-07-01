<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<script type="text/javascript">
	$(document).ready(function() {
		
		if ($("#searchBy").val() == "1") {
			$("#refPetitionTypeId").prop('disabled', 'disabled');
			$("#searchedPetitionNumber").removeAttr("disabled");
			$("#searchedPetitionYear").removeAttr("disabled");
			$("#searchbutton").removeAttr("disabled");
			$("#searchedPetitionNumber").focus();
		}
		else if ($("#searchBy").val() == "2") {
			$("#refPetitionTypeId").removeAttr("disabled");
			$("#searchedPetitionNumber").removeAttr("disabled");
			$("#searchedPetitionYear").removeAttr("disabled");
			$("#searchbutton").removeAttr("disabled");
			$("#refPetitionTypeId").focus();
		}
		else{
			$("#refPetitionTypeId").prop('disabled', 'disabled');
			$("#searchedPetitionNumber").removeAttr("disabled");
			$("#searchedPetitionYear").removeAttr("disabled");
			$("#searchbutton").removeAttr("disabled");
			$("#searchedPetitionNumber").focus();
		}
	
		$("#searchBy").change(function () {
			if ($(this).val() == "1") {
				$("#refPetitionTypeId").val("");	
				$("#refPetitionTypeId").prop('disabled', 'disabled');
				$("#searchedPetitionNumber").removeAttr("disabled");
				$("#searchedPetitionYear").removeAttr("disabled");
				$("#searchbutton").removeAttr("disabled");
				$("#searchedPetitionNumber").focus();
			}
			else if ($(this).val() == "2") {
				$("#refPetitionTypeId").removeAttr("disabled");
				$("#searchedPetitionNumber").removeAttr("disabled");
				$("#searchedPetitionYear").removeAttr("disabled");
				$("#searchbutton").removeAttr("disabled");
				$("#refPetitionTypeId").focus();
			}
			else{
				$("#refPetitionTypeId").prop('disabled', 'disabled');
				$("#searchedPetitionNumber").prop('disabled', 'disabled');
				$("#searchedPetitionYear").prop('disabled', 'disabled');
				$("#searchbutton").prop('disabled', 'disabled');
			}				
		});
		$("input[name='searchbutton']").click(function(){
			var filter = /^([0-9]+)$/;
			if ($("#searchBy").val() == "1")
			{
// 				<!-- 			04-01-2020 start AK -->
				if(filter.test($('#searchedPetitionNumber').val())==false)
				{	
					if($('#searchedPetitionNumber').val()=="") 
					{alert("Please Enter Diary Number");
					$('#searchedPetitionNumber').focus();
					return false;}
					
					else{
					alert("Please Enter Diary  Number In numeric.");
					$('#searchedPetitionNumber').focus();
					return false;
					}

				}
				else if($('#searchedPetitionYear').val()=="")
				{
					alert("Please select diary year.");
					$('#searchedPetitionYear').focus();
					return false;
				}
			}
			else if ($("#searchBy").val() == "2")
			{
				if($("#refPetitionTypeId").val()=="")
				{
					alert("Please select petition type.");
					$("#refPetitionTypeId").focus();
					return false;
				}
				else if(filter.test($('#searchedPetitionNumber').val())==false)
				{
					alert("Petition Number should be numeric.");
					$('#searchedPetitionNumber').focus();
					return false;
				}
				else if($('#searchedPetitionYear').val()=="")
				{
					alert("Please select registration year.");
					$('#searchedPetitionYear').focus();
					return false;
				}
						
			}
		
		});
//			<!-- 			04-01-2020 end AK -->
	});  
function validateNumber(sNumber)
{
	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if (filter.test(sEmail)) {
		return true;
	}
	else {
		return false;
	}
}
	      	
</script>
<!-- 			04-03-2020 start AK -->
<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Search Filed Petition</th>
		</tr>
		<tr>
			<td colspan="7">
				<s:form theme="simple" name="searchPetition" action="searchPetitionForRegistration">
					<table border = "0">
						<tr>
							<td>
<%-- 								<s:hidden name="searchBy" value="1"/> --%>
								Search By&nbsp;:&nbsp;
<!-- 											04-03-2020 end AK -->
								<s:select list="#{1:'Diary Number',2:'Petition Number'}" name="searchBy" id="searchBy" headerKey="" headerValue="- Select -" theme="simple" cssStyle="width:115pt"/>
								&nbsp;&nbsp;Type&nbsp;:&nbsp;
								<s:select list="refPetitionTypeList" name="refPetitionType.id" id="refPetitionTypeId" listKey="id" listValue="petitionType+'  ('+petitionTypeCode+')'" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/>
								&nbsp;&nbsp; 
								Number&nbsp;:&nbsp;<s:textfield size="8" name="searchedPetitionNumber" id="searchedPetitionNumber"/>
								&nbsp;&nbsp;Year&nbsp;:&nbsp;
								<s:select name="searchedPetitionYear" id="searchedPetitionYear" list="yearList" headerValue="- Select -" headerKey="" cssStyle="width:60pt"/>
								&nbsp;&nbsp;
								<input type="submit" name="searchbutton" id="searchbutton" value="Search" class="formbutton" />	
							</td>	
						</tr>		
					</table>
					<s:token/>
				</s:form>
			</td>
		</tr>
</table>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>

<s:form theme="simple" name="petitionsForRegistrationList">
	<table border="0">
		<s:if test="hasActionMessages()">
			<tr align="left">
				<td colspan="7"><span class="required"><s:actionmessage/></span></td>
			</tr>
		</s:if>
			<s:if test="filedPetitionsCountList.size>0">
			<tr>
				<th colspan="7" class="mainheading">Petitions for Registration</td>				
			</tr>
			<tr>
				<td colspan="7">
					<display:table export="false" id="filedPetitions" name="filedPetitionsCountList" pagesize="20" requestURI="">
						<display:column property="refPetitionTypeId.petitionTypeCode" title="Type" sortable="true" style="width:4%"/>
						<s:url var="url" action="searchPetitionForRegistration">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token" />
							<s:param name="searchedPetitionNumber" value="%{#attr.filedPetitions.diaryNumber}" />
							<s:param name="searchedPetitionYear" value="%{#attr.filedPetitions.DiaryYear}" />
							<s:param name="searchBy" value="1"/>
						</s:url>
						<display:column title="Diary Number" sortable="true" style="width:8%">
							<s:a href="%{url}">
								<s:property value="%{#attr.filedPetitions.diaryNumber}"/>/<s:property value="%{#attr.filedPetitions.diaryYear}"/>
							</s:a>
						</display:column>
						<display:column title="Subject" sortable="true" style="width:40%">
						<s:property value="%{#attr.filedPetitions.refSubjectId.subject}"/><!-- <br/> -->
						<s:property value="%{#attr.filedPetitions.subject}"/>
						</display:column>
						<display:column title="Petitioner Name" sortable="true" style="width:15%">
							<s:property value="%{#attr.filedPetitions.cercUserPetitionerId.firstName}"/>
							<s:property value="%{#attr.filedPetitions.cercUserPetitionerId.middleName}"/>
							<s:property value="%{#attr.filedPetitions.cercUserPetitionerId.lastName}"/>
						</display:column>
						<display:column title="Filed By" sortable="true" style="width:15%">
							(<s:property value="%{#attr.filedPetitions.cercUserFiledBy.userType}"/>)
							<s:property value="%{#attr.filedPetitions.cercUserFiledBy.firstName}"/>
							<s:property value="%{#attr.filedPetitions.cercUserFiledBy.middleName}"/>
							<s:property value="%{#attr.filedPetitions.cercUserFiledBy.lastName}"/> 
						</display:column>
						<display:column property="filedOn" format="{0,date,dd/MM/yyyy}" title="Filed On" sortable="true" style="width:8%"/>
						<display:column property="refStatusId.statusName"  title="Status" sortable="true" style="width:10%"/>				
					</display:table>
				</td>
			</tr>			
		</s:if>
		<s:else>
			<tr align="center">
				<td colspan="7"><span class="required">No Record Found.</span></td>
			</tr>
		</s:else>
	</table>
</s:form>

<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<script type="text/javascript">
	$(document).ready(function() {
		
		
// 		$('#searchBy').val('1');
// 		$('#searchBy').attr("disabled", true);
		
		
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
			$("#searchedPetitionNumber").prop('disabled', 'disabled');
			$("#searchedPetitionYear").prop('disabled', 'disabled');
			$("#searchbutton").prop('disabled', 'disabled');
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
				if(filter.test($('#searchedPetitionNumber').val())==false)
				{					
					alert("Diary Number should be numeric.");
					$('#searchedPetitionNumber').focus();
					return false;
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
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Deficiencies</th>
		</tr>
		<tr>
			<td colspan="7">
				<s:form theme="simple" name="searchPetition" action="searchDeficiencyPetition">
					<table border = "0">
						<tr>
							<td>
								Search By&nbsp;:&nbsp;
								<s:select list="#{1:'Diary Number',2:'Petition Number'}" name="searchBy" id="searchBy" headerKey="" headerValue="- Select -" theme="simple" cssStyle="width:115pt"/>
<%-- 								<s:select list="#{1:'Diary Number'}" name="searchBy" id="searchBy" headerKey="" headerValue="- Select -" theme="simple" cssStyle="width:115pt"/> --%>
								&nbsp;&nbsp;Type&nbsp;:&nbsp;
								<s:select list="refPetitionTypeList" name="refPetitionType.id" id="refPetitionTypeId" listKey="id" listValue="petitionType+'  ('+petitionTypeCode+')'" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/>
								&nbsp;&nbsp;Number&nbsp;:&nbsp;<s:textfield size="8" name="searchedPetitionNumber" id="searchedPetitionNumber"/>
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
<%-- <s:actionmessage/> --%>
<%-- <s:include value="/jsp/tiles/tabsPleading.jsp"></s:include> --%>
<s:form theme="simple" name="deficienciesList">
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Deficiency List</th>
		</tr> 
		<s:if test="hasActionMessages()">
		<tr align="left">
			<td colspan="7"><font color="red" size="3pt"><s:actionmessage/></font></td>
		</tr>
		</s:if>
		<%-- <s:include value="/jsp/pleadings/pleadingPetitionDetails.jsp"></s:include> --%>
		<tr>
			<td colspan="7">
				<display:table export="false" id="deficiencies" name="deficienciesList" pagesize="20" requestURI="">
						<display:column property="refPetitionTypeId.petitionTypeCode" title="Type" sortable="true" style="width:4%"/>
						<s:url var="url" action="petitionerDeficienciesList">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token" />
							<s:param name="pleadingBeanId" value="%{#attr.deficiencies.id}" />
						</s:url>
						<display:column title="Diary Number" sortable="true" style="width:8%">
							<s:a href="%{url}">
								<s:property value="%{#attr.deficiencies.diaryNumber}"/>/<s:property value="%{#attr.deficiencies.diaryYear}"/>
							</s:a>
						</display:column>
						<display:column title="Subject" sortable="true" style="width:40%">
						<s:property value="%{#attr.deficiencies.refSubjectId.subject}"/><br/>
						<s:property value="%{#attr.deficiencies.subject}"/>
						</display:column>
						<display:column title="Petitioner Name" sortable="true" style="width:15%">
							<s:property value="%{#attr.deficiencies.cercUserPetitionerId.firstName}"/>
							<s:property value="%{#attr.deficiencies.cercUserPetitionerId.middleName}"/>
							<s:property value="%{#attr.deficiencies.cercUserPetitionerId.lastName}"/>
						</display:column>
						<display:column title="Filed By" sortable="true" style="width:15%">
							(<s:property value="%{#attr.deficiencies.cercUserFiledBy.userType}"/>)
							<s:property value="%{#attr.deficiencies.cercUserFiledBy.firstName}"/>
							<s:property value="%{#attr.deficiencies.cercUserFiledBy.middleName}"/>
							<s:property value="%{#attr.deficiencies.cercUserFiledBy.lastName}"/> 
						</display:column>
						<display:column property="filedOn" format="{0,date,dd/MM/yyyy}" title="Filed On" sortable="true" style="width:8%"/>
						<%-- <display:column title="Notified By" sortable="true" style="width:15%">
							<s:if test="%{#attr.deficiencies.notifiedBy!=null}"> (<s:property value="%{#attr.deficiencies.notifiedBy.userType}"/>)</s:if>
							<s:property value="%{#attr.deficiencies.notifiedBy.firstName}"/>
							<s:property value="%{#attr.deficiencies.notifiedBy.middleName}"/>
							<s:property value="%{#attr.deficiencies.notifiedBy.lastName}"/> 
						</display:column>
						<display:column title="Cured By" sortable="true" style="width:15%">
							<s:if test="%{#attr.deficiencies.curedBy!=null}">(<s:property value="%{#attr.deficiencies.curedBy.userType}"/>)</s:if>
							<s:property value="%{#attr.deficiencies.curedBy.firstName}"/>
							<s:property value="%{#attr.deficiencies.curedBy.middleName}"/>
							<s:property value="%{#attr.deficiencies.curedBy.lastName}"/> 
						</display:column> --%>
						<display:column property="refStatusId.refStatusPublicDomainId.statusName"  title="Status" sortable="true" style="width:10%"/>				
					</display:table>
</td>
</tr>
</table>	
</s:form>
<br/>
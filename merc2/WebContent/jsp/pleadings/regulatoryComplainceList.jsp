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
<%-- <table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Additional Filing</th>
		</tr>
		<tr>
			<td colspan="7">
				<s:form theme="simple" name="searchPetition" action="searchPetition">
					<table border = "0">
						<tr>
							<td>
								Search By&nbsp;:&nbsp;
								<s:select list="#{1:'Diary Number',2:'Petition Number'}" name="searchBy" id="searchBy" headerKey="" headerValue="- Select -" theme="simple" cssStyle="width:115pt" value="%{2}"/>
								&nbsp;&nbsp;Type&nbsp;:&nbsp;
								<s:select list="refPetitionTypeList" name="refPetitionTypeId" id="refPetitionTypeId" listKey="id" listValue="petitionType+'  ('+petitionTypeCode+')'" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/>
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
</table> --%>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:if test="cercPetition!=null">
<%-- <s:include value="/jsp/tiles/tabsPleading.jsp"></s:include> --%>
<s:form theme="simple" name="pleadingList">
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Regulatory Compliance</th>
		</tr>
		<s:include value="/jsp/pleadings/pleadingPetitionDetails.jsp"></s:include>
		<tr>
			<td colspan="7" align="left">
			<s:a action="addCompliance">
					<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="pleadingBeanId" value="pleadingBeanId"/>
					<s:param name="filingBeanId" value="filingBeanId"/>
					<input type="button" id="printbutton" name="printbutton" value="Add Compliance" class="formbutton"/>
				</s:a>
			</td>
		</tr>
		<tr>
			<th colspan="7" class="mainheading">Regulatory Compliance List</th>
		</tr>
		<tr>
			<td colspan="7">
				<display:table export="false" id="pleadings" name="cercPetitionRcList" pagesize="20" requestURI="">
						<display:column title="Reference No." sortable="true">
							<s:url action="openRcAcknowledgement" var="openRcAcknowledgement">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="filingBeanId" value="%{#attr.pleadings.cercPetitionId.id}"/>
							<s:param name="pleadingId" value="%{#attr.pleadings.id}"/>
						</s:url>
							<s:a href="%{openRcAcknowledgement}">
								<s:property value="%{#attr.pleadings.pleadingReferenceNumber}"/>
							</s:a>
						</display:column>
						<s:url action="viewComplianceDetails" var="viewComplianceDetails">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/>
							<s:param name="pleadingId" value="%{#attr.pleadings.id}"/>
							<s:param name="pleadingBeanId" value="%{#attr.pleadings.cercPetitionId.id}"/>
						</s:url>
						<display:column title="Regulation" sortable="true">
						<s:a href="%{viewComplianceDetails}">
								<s:property value="%{#attr.pleadings.refRegulationId.regulationDescription}"/>
							</s:a>
						</display:column>
						<display:column property="dateOfFiling" format="{0,date,dd/MM/yyyy}" title="Date of Filing" sortable="true" style="color: red;"/>
						<display:column property="updatedBy.userName" title="Added By" sortable="true"/>
						<display:column property="updatedOn" format="{0,date,dd/MM/yyyy}" title="Added On" sortable="true"/>
					</display:table>
				
</td>
</tr>
<s:if test="pleadingList.size()>0">
		<tr>
			<td valign="top" colspan="7" align="right">
			<s:a id="reportWindow" onclick="reportWindow('/cerc/run?__report=pleadingList.rptdesign&petitionId=%{cercPetition.id}&userId=%{#session.CERC_USER.id}&adminId=%{#session.CERC_USER.refOrganisationId.updatedBy.id}');" href="#">
			<input type="button" id="printbutton" name="printbutton" value="Print" class="formbutton"/></s:a>&nbsp;
			<s:a action="filingSummary">
					<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="filingBeanId" value="pleadingBeanId"/>
					<input type="button" id="printbutton" name="printbutton" value="Back to Summary Page" class="formbutton"/>
				</s:a>
			</td>											
		</tr>
</s:if>
<s:else>
		<tr>
			<td valign="top" colspan="7" align="right">
			<s:a action="filingSummary">
					<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="filingBeanId" value="pleadingBeanId"/>
					<input type="button" id="printbutton" name="printbutton" value="Back to Summary Page" class="formbutton"/>
				</s:a>
			</td>
		</tr>
</s:else>
</table>	
</s:form>
</s:if>
<%-- <s:else>
		<tr align="center">
		<td colspan="7"><span class="required">Petition not found</span></td>
		</tr>
</s:else>
 --%><br/>
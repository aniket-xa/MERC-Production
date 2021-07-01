<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<script type="text/javascript">
	$(document).ready(function() {
		$("#reportWindow").click(function(event) {
	    	   event.preventDefault();
	           event.stopPropagation();
	           winddd = window.open(this.href,"report",'width=635px,directories=0, resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no, titlebar=no');
	       });

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
			<th colspan="7" class="mainheading">Search Current Petition</th>
		</tr>
		<tr>
			<td colspan="7">
				<s:form theme="simple" name="searchPetition" action="searchRegisteredPetition">
					<table border = "0">
						<tr>
							<td>
								Search By&nbsp;:&nbsp;
								<s:select list="#{1:'Diary Number',2:'Petition Number'}" name="searchBy" id="searchBy" headerKey="" headerValue="- Select -" theme="simple" cssStyle="width:115pt" value="%{2}"/>
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
<s:form theme="simple" name="newUserRegistration">
	<table border="0">
		<s:if test="hasActionMessages()">
			<tr align="left">
				<td colspan="8"><span class="required"><s:actionmessage/></span></td>
			</tr>
		</s:if>
		<s:if test="registeredPetitionsCountList.size>0">
			<tr>
				<th colspan="8" class="mainheading">Current Petitions</td>				
			</tr>
			<tr>
				<td colspan="8">
					<display:table export="false" id="registeredPetitions" name="registeredPetitionsCountList" pagesize="20" requestURI="">
						<s:url var="url" action="filingSummary">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token" />
							<s:param name="filingBeanId" value="%{#attr.registeredPetitions.id}" />
						</s:url>
						<s:url action="viewHardCopyRecieved" var="url1" escapeAmp="false">
						<s:param name="struts.token.name">token</s:param>
						<s:param name="token" value="token"/>
                        <s:param name="filingBeanId1" value="%{#attr.registeredPetitions.id}"/>
        			</s:url>
						<display:column title="Petition Number" sortable="true" style="width:10%">
							<s:a href="%{url}">
							<s:property value="%{#attr.registeredPetitions.registrationNumberDisplay}"/>
								<%-- <s:property value="%{#attr.registeredPetitions.refPetitionTypeId.petitionTypeCode}"/>/<s:property value="%{#attr.registeredPetitions.registrationNumber}"/>/<s:property value="%{#attr.registeredPetitions.registrationYear}"/> --%>
							</s:a>
						</display:column>
						<display:column title="Subject" sortable="true" style="text-align: justify;text-justify: inter-word;width:34%">
						<%-- <s:property value="%{#attr.registeredPetitions.refSubjectId.subject}"/><br/> --%>
						<s:property value="%{#attr.registeredPetitions.subject}"/>
						</display:column>
						<display:column title="Petitioner Name" sortable="true" style="width:15%">
							<s:property value="%{#attr.registeredPetitions.cercUserPetitionerId.userName}"/>
							<%-- <s:property value="%{#attr.registeredPetitions.cercUserPetitionerId.firstName}"/>
							<s:property value="%{#attr.registeredPetitions.cercUserPetitionerId.middleName}"/>
							<s:property value="%{#attr.registeredPetitions.cercUserPetitionerId.lastName}"/> --%>
						</display:column>
						<display:column title="Filed By" sortable="true" style="width:15%">
							(<s:property value="%{#attr.registeredPetitions.cercUserFiledBy.userType}"/>)
							<s:property value="%{#attr.registeredPetitions.cercUserFiledBy.userName}"/>
							<%-- <s:property value="%{#attr.registeredPetitions.cercUserFiledBy.firstName}"/>
							<s:property value="%{#attr.registeredPetitions.cercUserFiledBy.middleName}"/>
							<s:property value="%{#attr.registeredPetitions.cercUserFiledBy.lastName}"/> --%> 
						</display:column>
						<display:column property="filedOn" format="{0,date,dd/MM/yyyy}" title="Filed On" sortable="true" style="width:8%"/>
						<display:column property="registeredOn" format="{0,date,dd/MM/yyyy}" title="Registered On" sortable="true" style="width:8%"/>
						<display:column  title="Status" sortable="true" style="width:10%">
							<s:property value="%{#attr.registeredPetitions.refStatusId.refStatusPublicDomainId.statusName}"/>
							<s:if test="%{#attr.registeredPetitions.refStatusId.isDivisionConcat==true}">
							    <s:iterator value="divisionList" status="divisionStatus">
							    	<s:if test='%{#attr.registeredPetitions.id == divisionList[#divisionStatus.index][0]}'>
                                		<s:property value="divisionList[#divisionStatus.index][1]"/>
                                	</s:if>
                                </s:iterator>
                            </s:if>
                        </display:column>
                        <%-- <s:if test="#session.CERC_USER.refOrganisationId.id==1"> --%>
                        <display:column  title="View" sortable="true" style="width:10%">
				             <s:a href="%{url1}">View</s:a>
				        </display:column><%-- </s:if> --%>
				  </display:table>
				</td>
			</tr>
			<%-- <tr class="subheading">
				<td width="5%">S.No.</td>
				<td width="18%">Petition Number/Year</td>
				<td width="22%">Petitioner Name</td>
				<td width="20%">Filed By</td>
				<td width="13%">Registered On</td>
				<td width="10%">Filed On</td>
				<td width="17%">Status</td>
			</tr>
			<s:iterator value="registeredPetitionsCountList" status="rowstatus">
				<s:url var="url" action="filingGeneralInformation">
					<s:param name="struts.token.name">token</s:param>
					<s:param name="token" value="token" />
					<s:param name="filingBeanId" value="id" />
				</s:url>
				<tr class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>' valign="top">
					<td><s:property value="#rowstatus.count" /></td>
					<td><s:a href="%{url}">
							<s:property value="registrationNumberDisplay" />
						</s:a>
					</td>
					<td><s:property value="cercUserPetitionerId.firstName"/> <s:property value="cercUserPetitionerId.middleName"/> <s:property value="cercUserPetitionerId.lastName"/></td>
					<td><s:property value="cercUserFiledBy.firstName"/> <s:property value="cercUserFiledBy.middleName"/> <s:property value="cercUserFiledBy.lastName"/></td>
					<td><s:date name="registeredOn" format="dd/MM/yyyy"/></td>
					<td><s:date name="filedOn" format="dd/MM/yyyy"/></td>
					<td><s:property value="refStatusId.statusName" /></td>
				</tr>

			</s:iterator> --%>
			<tr>
				<td colspan="7">
					<s:if test="%{#session.CERC_USER.refOrganisationId.id==1}">
						<s:a id="reportWindow" href="/run?__report=ListOfRegisteredPetitions.rptdesign&userType=cerc&userId=%{#session.CERC_USER.id}&__format=xls">
							<input type="button" id="printbutton" name="printbutton" value="Export To Excel" class="formbutton"/>
						</s:a>
					</s:if>
					<s:else>
						<s:a id="reportWindow" href="/run?__report=ListOfRegisteredPetitions.rptdesign&userType=other&userId=%{#session.CERC_USER.id}&__format=xls">
						<input type="button" id="printbutton" name="printbutton" value="Export To Excel" class="formbutton"/>
						</s:a>
					</s:else>
				</td>				
			</tr>
		</s:if>
		<s:else>
			<tr align="center">
				<td colspan="8"><span class="required">No Record Found.</span></td>
			</tr>
		</s:else>
	</table>
</s:form>

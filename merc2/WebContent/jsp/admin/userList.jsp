<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<script type="text/javascript">
function deleteConfirmation(msg) 
{
    var x=confirm('Are you sure you want to '+ msg+'?');
    if (x) 
    {
    	return true;
    } 
    else 
    {
        return false;
    }
    
}
</script>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:if test="(#session.CERC_USER.refOrganisationId.id==1)">
<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Search User</th>
		</tr>
		<tr>
			<td colspan="7">
				<s:form theme="simple" name="searchPetition" action="searchRegisteredUser">
					<table border = "0">
						<tr>
							<td>
								Search By&nbsp;
								&nbsp;&nbsp;User Name&nbsp;:&nbsp;<s:textfield size="50" name="userNameSearch" id="userNameSearch"/>&nbsp;&nbsp;
								<input type="submit" name="searchbutton" id="searchbutton" value="Search" class="formbutton" />	
							</td>	
						</tr>		
					</table>
					<s:token/>
				</s:form>
			</td>
		</tr>
</table>
</s:if>
<s:form theme="simple" name="newUserRegistration">
	<table border="0">
		<tr>
			<th colspan="6" class="mainheading">Registered User List</th>
		</tr>
		<s:if test="userList.size>0">
			<tr>
				<td colspan="6">
					<display:table export="false" id="user" name="userList" pagesize="20" requestURI="" >
						<display:column title="User Type" sortable="true">
							<s:if test="%{#attr.user.userType=='O'}">Organisation</s:if>
							<s:elseif test="%{#attr.user.userType=='E'}">Employee</s:elseif>
							<s:elseif test="%{#attr.user.userType=='A'}">Advocate</s:elseif>
							<s:elseif test="%{#attr.user.userType=='I'}">Individual</s:elseif>
						</display:column>	
						<display:column title="User Name" sortable="true">
							<s:if test="#attr.user.userType=='A'">
								<s:a action="openReportTemplateReport1">
								<s:param name="struts.token.name" value="%{'token'}"/>
								<s:param name="token" value="token"/>
				   				<s:param name="userName" value="%{#attr.user.id}"/>
				   				<s:param name="cercUserId" value="%{#attr.user.id}"/>
								<s:param name="reportName" value="'registrationFormAdvocate.rptdesign'"/>
									<s:property value="%{#attr.user.userName}"/>
								</s:a>
							</s:if>
							
							<s:if test="#attr.user.userType=='E'">
							<s:if test = "#attr.user.refOrganisationId.id == 1">
								<s:a action="openReportTemplateReport1">
								<s:param name="struts.token.name" value="%{'token'}"/>
								<s:param name="token" value="token"/>
				   				<s:param name="userName" value="%{#attr.user.id}"/>
				   				<s:param name="cercUserId" value="%{#attr.user.id}"/>
								<s:param name="reportName" value="'registrationFormMercEmployee.rptdesign'"/>
									<s:property value="%{#attr.user.userName}"/>
								</s:a>
							</s:if>
							
							<s:else>
								<s:a action="openReportTemplateReport1">
								<s:param name="struts.token.name" value="%{'token'}"/>
								<s:param name="token" value="token"/>
				   				<s:param name="userName" value="%{#attr.user.id}"/>
				   				<s:param name="cercUserId" value="%{#attr.user.id}"/>
								<s:param name="reportName" value="'registrationFormEmployee.rptdesign'"/>
									<s:property value="%{#attr.user.userName}"/>
								</s:a>
							</s:else>	
								
							</s:if>
								<s:if test="#attr.user.userType=='I'">
								<s:a action="openReportTemplateReport1">
								<s:param name="struts.token.name" value="%{'token'}"/>
								<s:param name="token" value="token"/>
				   				<s:param name="userName" value="%{#attr.user.id}"/>
				   				<s:param name="cercUserId" value="%{#attr.user.id}"/>
								<s:param name="reportName" value="'registrationFormIndividual.rptdesign'"/>
									<s:property value="%{#attr.user.userName}"/>
								</s:a>
							</s:if>
							<s:if test="#attr.user.userType=='O'">
								<s:if test= "#attr.user.refOrganisationId.id == 1">
								<s:a action="openReportTemplateReport1">
								<s:param name="struts.token.name" value="%{'token'}"/>
								<s:param name="token" value="token"/>
				   				<s:param name="userName" value="%{#attr.user.id}"/>
				   				<s:param name="cercUserId" value="%{#attr.user.id}"/>
								<s:param name="reportName" value="'registrationFormMercOrganisation.rptdesign'"/>
									<s:property value="%{#attr.user.userName}"/>
								</s:a>
								</s:if>
								<s:else>
								<s:a action="openReportTemplateReport1">
								<s:param name="struts.token.name" value="%{'token'}"/>
								<s:param name="token" value="token"/>
				   				<s:param name="userName" value="%{#attr.user.id}"/>
				   				<s:param name="cercUserId" value="%{#attr.user.id}"/>
								<s:param name="reportName" value="'registrationFormOrganisation.rptdesign'"/>
									<s:property value="%{#attr.user.userName}"/>
								</s:a>
								</s:else>
							</s:if>
							
						</display:column>
						<display:column property="refOrganisationId.organisationName" title="Organisation" sortable="true"/>
						<display:column property="email" title="Email" sortable="true"/>
						<display:column property="mobile" title="Mobile" sortable="true"/>
						
						<display:column property="userRegisteredOn" title="Registered On" format="{0,date,dd/MM/yyyy}" sortable="true"/> 
						
						<display:column property="activatedOn" title="Activated On" sortable="true"/>
						<display:column title="Action" sortable="true">
							<s:if test="%{#attr.user.userType=='O'} and %{#attr.user.refStatusId.statusCode=='A'}"></s:if>
							<s:elseif test="%{#attr.user.refStatusId.statusCode=='A'}">
								<s:url var="userDeactivate" action="userDeactivate">
									<s:param name="struts.token.name">token</s:param>
									<s:param name="token" value="token"/>
									<s:param name="cercUserId" value="%{#attr.user.id}"/>
								</s:url>
								<s:a href="%{userDeactivate}" onClick="return deleteConfirmation('deactivate');">Deactivate</s:a>
							</s:elseif>
							<s:elseif test="%{#attr.user.refStatusId.statusCode=='V'}">
								<s:url var="userActivate" action="userActivate">
									<s:param name="struts.token.name">token</s:param>
									<s:param name="token" value="token"/>
									<s:param name="cercUserId" value="%{#attr.user.id}"/>
								</s:url>
								<s:a href="%{userActivate}" onClick="return deleteConfirmation('activate');">Activate</s:a>
							</s:elseif>
							<s:else>
								<s:property value="%{#attr.user.refStatusId.statusName}"/>
							</s:else>
						</display:column>
						<%-- <display:column title="Filed By" sortable="true">
							(<s:property value="%{#attr.registeredPetitions.cercUserFiledBy.userType}"/>)
							<s:property value="%{#attr.registeredPetitions.cercUserFiledBy.firstName}"/>
							<s:property value="%{#attr.registeredPetitions.cercUserFiledBy.middleName}"/>
							<s:property value="%{#attr.registeredPetitions.cercUserFiledBy.lastName}"/> 
						</display:column>
						<display:column property="filedOn" format="{0,date,dd/MM/yyyy}" title="Filed On" sortable="true"/>
						<display:column property="registeredOn" format="{0,date,dd/MM/yyyy}" title="Registered On" sortable="true"/>
						<display:column property="refStatusId.statusName"  title="Status" sortable="true"/>		 --%>
					</display:table>
				</td>
			</tr>
			<%-- <tr class="subheading">
				<td width="8%">Sr. No.</td>
				<td width="10%">User Type</td>
				<td width="30%">User Name</td>
				<td width="12%">Organisation</td>
				<td width="20%">Email</td>
				<td width="10%">Mobile</td>
				<td width="10">Status</td>
			</tr>
			<s:iterator value="userList" status="rowstatus">
				<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
					<td><s:property value="#rowstatus.count" /></td>
					<td>
						<s:if test="userType=='O'">Organisation</s:if>
						<s:elseif test="userType=='E'">Employee</s:elseif>
						<s:elseif test="userType=='A'">Advocate</s:elseif>
						<s:elseif test="userType=='I'">Individual</s:elseif>
					</td>
					<td><s:property value="firstName"/> <s:property value="middleName"/> <s:property value="lastName"/></td>
					<td><s:property value="refOrganisationId.organisationName"/></td>
					<td><s:property value="email"/></td>
					<td><s:property value="mobile"/></td>
					<td>
						<s:if test="userType=='O' and refStatusId.statusCode=='A'"></s:if>
						<s:elseif test="refStatusId.statusCode=='A'">
							<s:url var="userDeactivate" action="userDeactivate">
								<s:param name="struts.token.name">token</s:param>
								<s:param name="token" value="token"/>
								<s:param name="cercUserId" value="id"/>
							</s:url>
							<s:a href="%{userDeactivate}" onClick="return deleteConfirmation('deactivate');">Deactivate</s:a>
						</s:elseif>
						<s:elseif test="refStatusId.statusCode=='V'">
							<s:url var="userActivate" action="userActivate">
								<s:param name="struts.token.name">token</s:param>
								<s:param name="token" value="token"/>
								<s:param name="cercUserId" value="id"/>
							</s:url>
							<s:a href="%{userActivate}" onClick="return deleteConfirmation('activate');">Activate</s:a>
						</s:elseif>
						<s:else>
							<s:property value="refStatusId.statusName"/>
						</s:else>
					
					</td>
				</tr>

			</s:iterator> --%>
		</s:if>
		<s:else>
			<tr align="center">
				<td colspan="6"><span class="required">No Record Found.</span></td>
			</tr>
		</s:else>
	</table>
	<br/>
</s:form>

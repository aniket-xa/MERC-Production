<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.owasp.esapi.*"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>
/*  $(document).ready(function() {
	$(document).bind("contextmenu", function (e) {
    	e.preventDefault();
    	alert("Right Click is Disabled");
	});
}); */ 

	function startTime() {
	    var today=new Date();
	    var h=today.getHours();
	    var m=today.getMinutes();
	    var s=today.getSeconds();
	    m = checkTime(m);
	    s = checkTime(s);
	    document.getElementById("clock").innerHTML = h+":"+m+":"+s;
	    var t = setTimeout(function(){startTime()},500);
	}

	function checkTime(i) {
	    if (i<10) {i = "0" + i};  // add zero in front of numbers < 10
	    return i;
	}
</script>
<s:token/>
<s:if test="#session.CERC_USER==null">
	<li><a href="/merc/">Go to Login Page</a></li>
</s:if>

<s:else>
	<!-- HOME -->
	<s:if test='#session.CERC_USER.userId=="guest"'>
		<li>
			<s:a action="logout">
				<s:param name="struts.token.name" value="%{'token'}"/>
				<s:param name="token" value="token"/>
				Go to Login Page
			</s:a>
		</li>
	</s:if>
	<s:else>
		<s:if test="#session.CERC_USER.lastLogin!=null">	
			<li class='<s:if test="#session.ACTIVE_MENU=='Home'">selected</s:if><s:else></s:else>'>
				<s:a action="welcome">
					<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					Home
				</s:a>
			</li>		
		</s:if>
	<!-- ACTIVE USER -->
	<s:if test="#session.CERC_USER.refStatusId.statusCode=='A'">
		<!-- ADMIN -->
		<li class='<s:if test="#session.ACTIVE_MENU=='Admin'">selected</s:if><s:else></s:else>'>
			<a href="#">Admin</a>
			<ul>
 				<li>
 					<s:a action="changePassword">
 						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						Change Password
					</s:a>
 				</li>
 				<s:if test='((#session.CERC_USER.refOrganisationId.id==1 and #session.CERC_USER.refRoleId.roleCode=="AD") or (#session.CERC_USER.refDivisionId.divisionCode.trim()!=null and (#session.CERC_USER.refDivisionId.divisionCode.trim()=="8" or #session.CERC_USER.refDivisionId.divisionCode.trim()=="12")))'>
 					<li>
 						<s:a action="documentAuthorisationList">
 							<s:param name="struts.token.name" value="%{'token'}"/>
							<s:param name="token" value="token"/>
 							Document Authorisation
 						</s:a>
 					</li>
 					<%-- <li>
 							<s:a action="dataMigration">
	 							<s:param name="struts.token.name" value="%{'token'}"/>
								<s:param name="token" value="token"/>
								Data Migration
							</s:a>
						</li>
					 --%>
 					<%-- 
 					<li>
 						<s:a action="mergeFilesManually">
 							<s:param name="struts.token.name" value="%{'token'}"/>
							<s:param name="token" value="token"/>
							Merge Files Manually
						</s:a>
					</li> 
					--%>
 				</s:if>
 				<s:if test="#session.CERC_USER.userType=='I'">
 				<li>
 				   <a class="has_submenu" href="#">Master</a>
 				   <ul>
 				      <s:if test="#session.CERC_USER.userType=='I'">
 				        <li>
 				           <s:a action="respondentMappingList">
 										<s:param name="struts.token.name" value="%{'token'}"/>
										<s:param name="token" value="token"/>
										Respondent Mapping
									</s:a>
						</li>
						<li>
						   	<s:a action="utrMasterList">
 										 <s:param name="struts.token.name" value="%{'token'}"/>
										<s:param name="token" value="token"/> 
										UTR Master
									</s:a>
						</li>
						<li>
						   	<s:a action="gatwayutrMasterList">
 										 <s:param name="struts.token.name" value="%{'token'}"/>
										<s:param name="token" value="token"/> 
										Payment Gateway Master
									</s:a>
						</li>
					</s:if></ul></li>						
 			 </s:if>
 				<s:if test="#session.CERC_USER.refRoleId.roleCode=='AD' or #session.CERC_USER.refRoleId.roleCode=='SU' or #session.CERC_USER.userType=='E'">
 					<li>
 						<a class="has_submenu" href="#">Master</a>
 						<ul>
 							<s:if test="#session.CERC_USER.userType=='E'">
 								<li>
 									<s:a action="respondentMappingList">
 										<s:param name="struts.token.name" value="%{'token'}"/>
										<s:param name="token" value="token"/>
										Respondent Mapping
									</s:a>
								</li>
								<s:if test='((#session.CERC_USER.refOrganisationId.id==1 and #session.CERC_USER.refRoleId.roleCode=="AD") or (#session.CERC_USER.refDivisionId.divisionCode.trim()!=null and (#session.CERC_USER.refDivisionId.divisionCode.trim()=="8" or #session.CERC_USER.refDivisionId.divisionCode.trim()=="12")))'>
					
								<li>
 									<s:a action="utrMasterList">
 										<%-- <s:param name="struts.token.name" value="%{'token'}"/>
										<s:param name="token" value="token"/> --%>
										UTR Master
									</s:a>
								</li>
								<li>
						   	<s:a action="gatwayutrMasterList">
 										 <s:param name="struts.token.name" value="%{'token'}"/>
										<s:param name="token" value="token"/> 
										Payment Gateway Master
									</s:a>
						</li>
						
								</s:if>
 							</s:if>
 							<s:else>
 								<li>
 									<s:a action="assetMasterList">
 										<s:param name="struts.token.name" value="%{'token'}"/>
										<s:param name="token" value="token"/>
										Asset Master
									</s:a>
								</li>
 								<li>
 									<s:a action="projectStationMasterList">
	 									<s:param name="struts.token.name" value="%{'token'}"/>
										<s:param name="token" value="token"/>
										Project Master
									</s:a>
								</li>
 								<li>
 									<s:a action="respondentMappingList">
 										<s:param name="struts.token.name" value="%{'token'}"/>
										<s:param name="token" value="token"/>
										Respondent Mapping
									</s:a>
								</li>
 								<li>
 									<s:a action="utrMasterList">
 										<%-- <s:param name="struts.token.name" value="%{'token'}"/>
										<s:param name="token" value="token"/> --%>
										UTR Master
									</s:a>
								</li>
								<li>
						   	<s:a action="gatwayutrMasterList">
 										 <s:param name="struts.token.name" value="%{'token'}"/>
										<s:param name="token" value="token"/> 
										Payment Gateway Master
									</s:a>
						</li>
								
 							</s:else>
 						</ul>
 					</li>
 				</s:if>
 				<s:if test="#session.CERC_USER.userType=='O'">
 					<li>
 						<s:a action="userList">
 							<s:param name="struts.token.name" value="%{'token'}"/>
							<s:param name="token" value="token"/>
							Registered User List
						</s:a>
					</li>
					<%-- <li>
 						<s:a action="stakeholderUpload">
 						    <s:param name="struts.token.name" value="%{'token'}"/>
							<s:param name="token" value="token"/>
							Upload Document
						</s:a>
					</li> --%>
 				</s:if>
 				<%-- <s:if test="#session.CERC_USER.userType=='E'">--%>
 				<s:if test="#session.CERC_USER.refOrganisationId.id==1">
 				<li>
 						<s:a action="stakeholderUpload">
 						    <s:param name="struts.token.name" value="%{'token'}"/>
							<s:param name="token" value="token"/>
							Upload Document
						</s:a>
				</li>
 				
 				</s:if>
 				<li>
 					<s:a action="viewAlertCount">
 						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						Alerts
					</s:a>
				</li> 
			</ul>
		</li>
		
		<!-- Petition -->
		<li class='<s:if test="#session.ACTIVE_MENU=='e-File Petition' or #session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-Filed Petition'">selected</s:if><s:else></s:else>'>
			<a href="#">Petitions</a>
			<ul>
 				<li>
 					<s:a action="eFileDisclaimer">
 						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						e-File Petition (New)
					</s:a>
				</li>
 				<li>
 					<s:a action="viewDraftPetitionsCount">
 						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						Draft Petitions
					</s:a>
				</li>
				<li>
					<s:a action="viewFiledPetitionsCount">
 						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						Petitions under Scrutiny
					</s:a>
				</li>
				<s:if test='((#session.CERC_USER.refOrganisationId.id==1 and #session.CERC_USER.refRoleId.roleCode=="AD") or (#session.CERC_USER.refDivisionId.divisionCode.trim()!=null and (#session.CERC_USER.refDivisionId.divisionCode.trim()=="8" or #session.CERC_USER.refDivisionId.divisionCode.trim()=="12")))'>
				<li>
					<s:a action="petitionForRegistrationList">
 						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						Petition Registration
					</s:a>
				</li>
			 <li>
					<s:a action="changePetitionStatusList">
 						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						Change Petition Status
					</s:a>
				</li>
			 
			</s:if>
				<li>
					<s:a action="viewRegisteredPetitionsCount">
 						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						Current Petitions
					</s:a>
				</li>
		        <li>
		        	<s:a action="viewDisposedPetitionsCount">
 						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						Disposed Petitions
					</s:a>
				</li>
		        <li>
            		<s:a action="viewRejectedPetitionsCount">
            			<s:param name="struts.token.name" value="%{'token'}"/>
       					<s:param name="token" value="token"/>
       					Rejected but not Registered
       				</s:a>
				</li>
				<s:if test='((#session.CERC_USER.refOrganisationId.id==1 and #session.CERC_USER.refRoleId.roleCode=="AD" and #session.CERC_USER.userType == "E") or (#session.CERC_USER.refDivisionId.divisionCode.trim()!=null and (#session.CERC_USER.refDivisionId.divisionCode.trim()!="8" or #session.CERC_USER.refDivisionId.divisionCode.trim()!="12")))'>
				
				<li>
            		<s:a action="viewNodalOfficerVerificationPetitions">
            			<s:param name="struts.token.name" value="%{'token'}"/>
       					<s:param name="token" value="token"/>
       					Petitions for approval
       				</s:a>
				</li>
				
				</s:if>
<s:if test='((#session.CERC_USER.refOrganisationId.id==1 and #session.CERC_USER.refRoleId.roleCode=="AD") or (#session.CERC_USER.refDivisionId.divisionCode.trim()!=null and (#session.CERC_USER.refDivisionId.divisionCode.trim()=="8" or #session.CERC_USER.refDivisionId.divisionCode.trim()=="12")))'>
				<%-- <li>
            		<s:a action="viewPetitionsForApprovalAdmin">
            			<s:param name="struts.token.name" value="%{'token'}"/>
       					<s:param name="token" value="token"/>
       					Petitions for approval
       				</s:a>
				</li> --%>
				<li>
	<s:a action="filingOtherAuthoritiesDetailsList">
								<s:param name="struts.token.name" value="%{'token'}" />
								<s:param name="token" value="token" />
		   					File Movement Hierarchy
		   				</s:a></li>
				<li>
				<li>
			<s:a action="viewPetitionsForApprovalAdmin">
								<s:param name="struts.token.name" value="%{'token'}" />
								<s:param name="token" value="token" />
		   					File Movement Tracking
		   				</s:a></li>
				<%-- <li>
            		<s:a action="viewRejectedPetitionsByAuthorities">
            			<s:param name="struts.token.name" value="%{'token'}"/>
       					<s:param name="token" value="token"/>
       					Rejected petitions by authority
       				</s:a>
				</li> --%>
				</s:if> 
			</ul>
		</li>
	
		<!-- Deficiencies -->
		 <li  class='<s:if test="#session.ACTIVE_MENU=='Deficiencies'">selected</s:if><s:else></s:else>'>
			<a href='#' >Deficiencies</a>
				<ul>
					<s:if test='((#session.CERC_USER.refOrganisationId.id==1 and #session.CERC_USER.refRoleId.roleCode=="AD") or (#session.CERC_USER.refDivisionId.divisionCode.trim()!=null and (#session.CERC_USER.refDivisionId.divisionCode.trim()=="8" or #session.CERC_USER.refDivisionId.divisionCode.trim()=="12")))'>
			 			<li>
			 				<s:a action="deficienciesList">
 								<s:param name="struts.token.name" value="%{'token'}"/>
								<s:param name="token" value="token"/>
								Preliminary Scrutiny
							</s:a>
						</li>
			 		</s:if>
			 		<li>
			 			<s:a action="petitionerDeficienciesPetitionList">
 							<s:param name="struts.token.name" value="%{'token'}"/>
							<s:param name="token" value="token"/>
							Deficiency Removal
						</s:a>
					</li>
			 	</ul>
			</li>
	

 <s:if test='((#session.CERC_USER.refOrganisationId.id==1 and #session.CERC_USER.refRoleId.roleCode=="AD") or (#session.CERC_USER.refDivisionId.divisionCode.trim()!=null and (#session.CERC_USER.refDivisionId.divisionCode.trim()=="8" or #session.CERC_USER.refDivisionId.divisionCode.trim()=="12")))'>		
 		<!-- Pleadings -->
 		<li class='<s:if test="#session.ACTIVE_MENU=='Pleadings'">selected</s:if><s:else></s:else>'>
 			<s:a action="pleadingList">
 				<s:param name="struts.token.name" value="%{'token'}"/>
				<s:param name="token" value="token"/>
				Pleadings
			</s:a>
		</li>
 		
		<!--<li>
			<s:a action='<s:url action="filingReplyCommentsList"/>'>Other</s:a>
 		<!-- Misc -->
 		</s:if>
 	
	<s:if test='(#session.CERC_USER.refOrganisationId.id!="1" and #session.CERC_USER.refRoleId.roleCode=="AD")'>		
 		<!-- Pleadings -->
 		<li class='<s:if test="#session.ACTIVE_MENU=='Pleadings'">selected</s:if><s:else></s:else>'>
 			<s:a action="pleadingList">
 				<s:param name="struts.token.name" value="%{'token'}"/>
				<s:param name="token" value="token"/>
				Pleadings
			</s:a>
		</li>
 		
		<!--<li>
			<s:a action='<s:url action="filingReplyCommentsList"/>'>Other</s:a>
 		<!-- Misc -->
 		</s:if>	
 		</else>
    <s:if test="#session.CERC_USER.refOrganisationId.id==1">
 		<li class='<s:if test="#session.ACTIVE_MENU=='Report' or #session.ACTIVE_MENU=='Search'">selected</s:if><s:else></s:else>'>
 			<a href="#">Mis</a>
			<ul>
				<!-- <li class="selected"><s:a action="BirtStruts2">Reports</s:a></li> -->
						<s:if test='((#session.CERC_USER.refOrganisationId.id==1 and #session.CERC_USER.refRoleId.roleCode=="AD") or (#session.CERC_USER.refDivisionId.divisionCode.trim()!=null and (#session.CERC_USER.refDivisionId.divisionCode.trim()=="8" or #session.CERC_USER.refDivisionId.divisionCode.trim()=="12")))'>		
							<li>
								<a class="has_submenu" href="#">Reports</a>
 								<ul>
 									<li>
 										<s:a action="reportTemplateAdminRegistration">
 											<s:param name="struts.token.name" value="%{'token'}"/>
											<s:param name="token" value="token"/>
											Registration Reports
										</s:a>
									</li>
									 <li>
 										<s:a action="reportTemplateAdmin">
 											<s:param name="struts.token.name" value="%{'token'}"/>
											<s:param name="token" value="token"/>
											Master Reports
										</s:a>
									</li>
									<s:if test="#session.CERC_USER.refOrganisationId.id==1">
 									<li>
 										<s:a action="reportTemplatePetition">
 											<s:param name="struts.token.name" value="%{'token'}"/>
											<s:param name="token" value="token"/>
											Petition Reports
										</s:a>
									</li>
									</s:if>
									
									<%-- <s:if test="#session.CERC_USER.refOrganisationId.id==1">
 									<li>
 										<s:a action="reportTemplatePaymentDetails">
 											<s:param name="struts.token.name" value="%{'token'}"/>
											<s:param name="token" value="token"/>
											Payment Related Reports
										</s:a>
									</li>
									</s:if> --%>
									
									<%-- <li>
 										<s:a action="">
 											<s:param name="struts.token.name" value="%{'token'}"/>
											<s:param name="token" value="token"/>
											MIS Reports
										</s:a>
									</li> --%> 						
 								</ul>
 							</li>
 						</s:if>		
					<%-- <li>
						<s:a action="miscSearch">
 							<s:param name="struts.token.name" value="%{'token'}"/>
							<s:param name="token" value="token"/>
							Search
						</s:a>
					</li>
					<li>
					<s:a action="communicationTypeSearch">
 						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						ROP/ORDER  Search
					</s:a>
				</li> --%>
				                <li>                                                <li>
								<a class="has_submenu" href="#">Search</a>
 								<ul>
 									<li>
 										<s:a action="miscSearch">
 											<s:param name="struts.token.name" value="%{'token'}"/>
											<s:param name="token" value="token"/>
											Petition Search
										</s:a>
									</li>
									
									
 									<li>
 										<s:a action="communicationTypeSearch">
 											<s:param name="struts.token.name" value="%{'token'}"/>
											<s:param name="token" value="token"/>
											ORDER Search
										</s:a>
									</li>
									
									<li>
 										<s:a action="assetMasterSearch">
 											<s:param name="struts.token.name" value="%{'token'}"/>
											<s:param name="token" value="token"/>
											Asset Master Search
										</s:a>
									</li>
									
									<li>
 										<s:a action="utrMasterSearch1">
 											<s:param name="struts.token.name" value="%{'token'}"/>
											<s:param name="token" value="token"/>
											UTR Master Search
										</s:a>
									</li>
									
									<li>
 										<s:a action="utrMasterSearch">
 											<s:param name="struts.token.name" value="%{'token'}"/>
											<s:param name="token" value="token"/>
											UTR Transaction Search
										</s:a>
									</li>
									
									
					</ul></li>
 

				
					<li>
						<s:a action="cercSiteMap">
 							<s:param name="struts.token.name" value="%{'token'}"/>
							<s:param name="token" value="token"/>
							Site Map
						</s:a>
					</li>
			</ul>
		</li>
		</s:if>
		
 	</s:if>
 	</s:else>
 	<s:if test='#session.CERC_USER.userId!="guest"'>
		<li>
			<s:a action="logout">
 				<s:param name="struts.token.name" value="%{'token'}"/>
				<s:param name="token" value="token"/>
				Logout
			</s:a>
		</li>
	</s:if>
	
	<table width="100%">
		<tr align="right" >
			<td >
				<s:if test="#session.CERC_USER!=null">
	    			<b>
	    				<font color="#991111">WELCOME</font>&nbsp;!&nbsp;&nbsp;<font color="#003366"><s:property value="#session.CERC_USER.userName"/> (
	    				<s:property value="#session.CERC_USER.userId"/>)
	    				&nbsp;
	    				<%-- <s:if test="#session.CERC_USER.refStatusId.statusType=='R' and #session.CERC_USER.refStatusId.statusCode=='C'"> --%>
	    				<s:a action="viewUserProfile" theme="simple" title="Click to view Profile" cssStyle="display:inline;">view profile
	    				<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
	    				</s:a>
	    				<%-- </s:if> --%>
	    				</font>
	    				&nbsp;
	    				<%
	    					DateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
	    					String formattedDate = df.format(new Date());    					
	    				%>
	    				<font color="#B2904A"><%=ESAPI.encoder().encodeForHTML(formattedDate)%>&nbsp;&nbsp;<span id="clock"></span></font>
	    				
	    			</b>
	    		</s:if>
	    		<s:else>
	    			<%
	    				DateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
	    				String formattedDate = df.format(new Date());    					
	    			%>
	    			<font color="#B2904A"><%=ESAPI.encoder().encodeForHTML(formattedDate)%>&nbsp;&nbsp;<span id="clock"></span></font>
	    		</s:else>
			</td>
		</tr>
	</table>
</s:else>
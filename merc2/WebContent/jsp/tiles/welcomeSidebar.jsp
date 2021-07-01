<%@ taglib uri="/struts-tags" prefix="s"%>
<ul>	
	<li>
<%-- 	<s:if test = "#session.CERC_USER.refOrganisationId.id == 1 or (#session.CERC_USER.refOrganisationId.id == 1 and #session.CERC_USER.userType == 'E')"> --%>
	<%-- <s:if test= "#session.CERC_USER.refOrganisationId.id == 1 and #session.CERC_USER.userType == 'E' and #session.CERC_USER.refDivisionId.divisionCode.trim()!='12' ">
		<h4><span>Other Links</span></h4>
		<ul class="blocklist">
       	
       		<li>
       				<s:a action="viewNodalOfficerVerificationPetitions">
 						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						Petitions for approval<font color="#FFFFFF">(<s:property value="filedPetitions2" default = "0"/>)</font>
					</s:a>
       			</li>           		
  			</ul>
		
		</s:if> 
		<s:else>--%>
    	<h4><span>Other Links</span></h4>
       	<ul class="blocklist">
       		<s:if test="#session.CERC_USER.refStatusId.statusCode=='C'">
       			<li>
       				<s:a action="forClarification">
       					<s:param name="struts.token.name" value="%{'token'}"/>
       					<s:param name="token" value="token"/>
       					User Registration Status <font color="#FFFFFF"><br/>(<s:property value="#session.CERC_USER.refStatusId.statusName" default="0"/> )</font>
       				</s:a>
       			</li>           		
           	</s:if>	
           	<s:if test='#session.CERC_USER.refRoleId.roleCode=="AD" or (#session.CERC_USER.refDivisionId.divisionCode.trim()!=null and (#session.CERC_USER.refDivisionId.divisionCode.trim()=="8" or #session.CERC_USER.refDivisionId.divisionCode.trim()=="12"))'>
				<li>
					<s:a action="viewUserRegistrationCount">
						<s:param name="struts.token.name">token</s:param>
       					<s:param name="token" value="token"/>
       					Users for Verification <font color="#FFFFFF">(<s:property value="pendingUserRegistration" default="0"/> )</font>
       				</s:a>			 	 
			 	</li>
			 	<s:if test='((#session.CERC_USER.refOrganisationId.id==1 and #session.CERC_USER.refRoleId.roleCode=="AD") or (#session.CERC_USER.refDivisionId.divisionCode.trim()!=null and (#session.CERC_USER.refDivisionId.divisionCode.trim()=="8" or #session.CERC_USER.refDivisionId.divisionCode.trim()=="12")))'>
			 	<li>
					<s:a action="viewPendingUTRCount">
						<s:param name="struts.token.name" value="%{'token'}"/>
       					<s:param name="token" value="token"/>
       					UTR for Verification <font color="#FFFFFF">(<s:property value="pendingUTRCount" default="0"/> )</font>
       				</s:a>			 	 
			 	</li>
			 	</s:if>
			 </s:if>
            <li>
            	<s:a action="viewDraftPetitionsCount">
            		<s:param name="struts.token.name" value="%{'token'}"/>
       				<s:param name="token" value="token"/>
                    Draft Petitions<font color="#FFFFFF">(<s:property value="draftPetitions" default="0"/> )</font>
       			</s:a>
       		</li>
            <li>
            	<s:a action="viewFiledPetitionsCount">
            		<s:param name="struts.token.name" value="%{'token'}"/>
       				<s:param name="token" value="token"/>
       				Petitions under Scrutiny(FILLED PETITION) <font color="#FFFFFF">(<s:property value="filedPetitions" default="0"/> )</font>
       			</s:a>
       		</li>
            <li>
            	<s:a action="viewRegisteredPetitionsCount">
            		<s:param name="struts.token.name" value="%{'token'}"/>
       				<s:param name="token" value="token"/>
       				Current Petitions <font color="#FFFFFF">(<s:property value="registeredPetitions" default="0"/>)</font> + I.A. <font color="#FFFFFF">(<s:property value="registeredIAs" default="0"/>)</font>
       			</s:a>
       		</li>
            <li>
            	<s:a action="viewDisposedPetitionsCount">
            		<s:param name="struts.token.name" value="%{'token'}"/>
       				<s:param name="token" value="token"/>
       				Disposed-Off Petitions <font color="#FFFFFF">(<s:property value="disposedPetitions" default="0"/> )</font>
       			</s:a>
       		</li>
       	
            <s:if test="#session.CERC_USER.refOrganisationId.id==1">
            <li>
            	<s:a action="viewRejectedPetitionsCount">
            		<s:param name="struts.token.name" value="%{'token'}"/>
       				<s:param name="token" value="token"/>
       				Rejected but not Registered <font color="#FFFFFF">(<s:property value="rejectedPetitions" default="0"/> )</font>
       			</s:a>
       		</li>
            <li>
            	<s:a action="cercPetitionPleadingList">
            		<%-- <s:param name="struts.token.name" value="%{'token'}"/>
       				<s:param name="token" value="token"/> --%>
       				Pleadings <font color="#FFFFFF">(<s:property value="cercPetitionPleadingList.size()" default="0"/> )</font>
       			</s:a>
       		</li>
            <li>
            	<s:a action="cercBulkCommunicationList">
            		<s:param name="struts.token.name" value="%{'token'}"/>
       				<s:param name="token" value="token"/>
       				Communication to All
       			</s:a>
       		</li>
       		</s:if>
       		 
<%--             <li>
            	<s:url action="viewDashboardPleadingDetails" var="viewPleadingDetails" escapeAmp="false">
					<s:param name="struts.token.name">token</s:param>
					<s:param name="token" value="token"/>
            		<s:param name="pleadingId"><s:property value="cercPetitionPleadingList[#rowstatus.index][0]"/></s:param>
            		<s:param name="filingBeanId" value="cercPetitionPleadingList[#rowstatus.index][1]"/>
            		<s:param name="divisionCode"><s:property value="cercPetitionPleadingList[#rowstatus.index][2]"/></s:param>
        		</s:url>
            	<s:a action="viewDisposedPetitionsCount">
            		<s:param name="struts.token.name" value="%{'token'}"/>
       				<s:param name="token" value="token"/>
       				Pleadings <font color="#FFFFFF">(<s:property value="cercPetitionPleadingList.size()" default="0"/> )</font>
       			</s:a>
       		</li>
 --%>       		<li>
            	<s:a action="viewAlertCount">
            		<s:param name="struts.token.name" value="%{'token'}"/>
       				<s:param name="token" value="token"/>
       				Alerts <font color="#FFFFFF">(<s:property value="alerts" default="0"/> )</font>
       			</s:a>
       		</li>
       		<s:if test="#session.CERC_USER.refOrganisationId.id==1">
       		<li>
            	<s:a action="stakeholderFeedbackList">
            		<s:param name="struts.token.name" value="%{'token'}"/>
       				<s:param name="token" value="token"/>
       				FeedBacks for Verification
       			</s:a>
       		</li>
       	</s:if>
       	<s:if test="#session.CERC_USER.refOrganisationId.id!=null">
       	<li>
            	<s:a action="stakeholderUploadDocumentList">
            		<s:param name="struts.token.name" value="%{'token'}"/>
       				<s:param name="token" value="token"/>
       				Documents for View
       			</s:a>
       		</li>
       </s:if>
            
		</ul>
<%-- 		</s:else> --%>
<%-- 		</s:if>  --%>
	</li>
	
</ul> 


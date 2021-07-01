<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
	
	function reportWindow(event) {
		winddd = window.open(event,"report",'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no');
		winddd.focus();
	}
	function deleteConfirmation() 
	{
	    var x=confirm('Are you sure, there is no deficiency in this petition ?');
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
<s:if test="%{cercPetition.refStatusId.statusCode=='S' and cercPetition.refStatusId.statusType=='F'}">
	<s:include value="/jsp/tiles/tabsPreliminaryScrutiny.jsp"></s:include>
</s:if>
<%-- <s:else><s:include value="/jsp/tiles/tabsPreliminaryScrutiny.jsp"></s:include></s:else> --%>
<s:form theme="simple" name="deficiencyPetitionDetails" action="deficiencyPetitionDetailsSave" method="post" enctype="multipart/form-data">
	<s:hidden name="pleadingBeanId"/>
 	<table border = "0">
		<tr>
	 		<th colspan="7" class="mainheading">Petition to Add Deficiencies</th>
		</tr>

		<s:if test="cercPetition.registrationNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Petition No. : <s:property value="cercPetition.registrationNumberDisplay"/></td>
			</tr>
			<tr>
				<td colspan="3" align="left">Diary No. : <s:property value="cercPetition.diaryNumberDisplay"/></td>
				<td colspan="1" align="center"></td>
				<td colspan="3" align="right">Reference No. : <s:property value="cercPetition.referenceNumberDisplay"/></td>									
			</tr>
		</s:if>
		<s:elseif test="cercPetition.diaryNumber!=null">
			<tr  class="subheading">
				<td colspan="7" align="center">Diary No. : <s:property value="cercPetition.diaryNumberDisplay"/></td>													
			</tr>
			<tr>
				<td colspan="3" align="left"></td>
				<td colspan="1" align="center"></td>
				<td colspan="3" align="right">Reference No. : <s:property value="cercPetition.referenceNumberDisplay"/></td>									
			</tr>
		</s:elseif>
		<s:elseif test="referenceNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Reference No. : <s:property value="cercPetition.referenceNumberDisplay"/></td>									
			</tr>
		</s:elseif>
		<tr class="subheading">
			<td colspan="7">Petition Details</td>
		</tr>
		<tr>
			<td width="20%">Diary Number</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercPetition.diaryNumberDisplay"/></td>
			<td width="2%"></td>
			<td width="20%">Petition Number</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercPetition.registrationNumberDisplay"/></td>					
		</tr>
		<tr>
			<td>Petitioner Name</td>
			<td>:</td>
			<td><s:property value="cercPetition.cercUserPetitionerId.firstName"/> <s:property value="cercPetition.cercUserPetitionerId.middleName"/> <s:property value="cercPetition.cercUserPetitionerId.lastName"/></td>
			<td></td>
			<td>Respondent Name</td>
			<td>:</td>
			<td>
			<s:if test="cercMainRepondentList.size>0">
			<s:property value="cercMainRepondentList[0].cercUserId.firstName"/> 
			<s:property value="cercMainRepondentList[0].cercUserId.middleName"/>
			<s:property value="cercMainRepondentList[0].cercUserId.lastName"/>
			<s:if test="cercMainRepondentList.size>1"> and <s:property value="cercMainRepondentList.size"/> others</s:if>
			</s:if>
			</td>								
		</tr>
		<tr>
			<td>Petition Type</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercPetition.refPetitionTypeId.petitionType"/> (<s:property value="cercPetition.refPetitionTypeId.petitionTypeCode"/>)</td>											
		</tr>
		<tr>
			<td valign="top">Subject</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercPetition.refSubjectId.subject"/><br/><s:property value="cercPetition.subject"/></td>
		</tr>
		<tr>
			<td valign="top" colspan="7">
			<s:a action="openPetitionSummary">
	   			<s:param name="struts.token.name" value="%{'token'}"/>
				<s:param name="token" value="token"/>
				<s:param name="filingBeanId" value="%{cercPetition.id}"/>
				<s:param name="reportName" value="%{'petitionSummary.rptdesign'}"/>
				View Petition Summary
			</s:a>
			</td>											
		</tr>
		<%-- <s:if test="%{cercPetition.refStatusId.statusCode=='S' and cercPetition.refStatusId.statusType=='F'}">
		<tr valign="top">
			<tr>
			<s:url action="deficiencyPetitionDetails" var="deficiencyPetitionDetails">
				<s:param name="struts.token.name">token</s:param>
				<s:param name="token" value="token"/>
				<s:param name="pleadingBeanId" value="%{cercPetition.id}"/>
				<s:param name="noDeficiencies" value="%{false}"/>
			</s:url>
			<s:url action="deficiencyPetitionDetailsSave" var="noDeficiencies">
				<s:param name="struts.token.name">token</s:param>
				<s:param name="token" value="token"/>
				<s:param name="pleadingBeanId" value="%{cercPetition.id}"/>
				<s:param name="noDeficiencies" value="%{true}"/>
			</s:url>
			<s:url action="deficiencyPetitionDetailsSave" var="deficienciesCured">
				<s:param name="struts.token.name">token</s:param>
				<s:param name="token" value="token"/>
				<s:param name="pleadingBeanId" value="%{cercPetition.id}"/>
				<s:param name="noDeficiencies" value="%{true}"/>
			</s:url>
			<td>
			<s:a href="%{deficiencyPetitionDetails}"><input type="button" id="resetbutton" name="resetbutton" value="Add Deficiencies" class="formbutton" /></s:a></td>
			<s:if test="cercPetition.deficienciesNotificationDate==null">
			<td><s:a href="%{noDeficiencies}"><input type="button" id="resetbutton" name="resetbutton" value="No Deficiencies" class="formbutton" /></s:a></td>
			</s:if>
			<s:if test="cercPetition.refilingDate==null">
			<td colspan="5"><s:a href="%{deficienciesCured}"><input type="button" id="resetbutton" name="resetbutton" value="Deficiencies Cured" class="formbutton" /></s:a></td>
			</s:if>
		</tr>
		</s:if> --%>
		<s:if test="notifiedDeficiencyList.size()>0">
			<tr valign="top">
				<tr class="subheading">
				<td colspan="7">Deficiency List</td>
			</tr>
			<tr valign="top">
				<tr>
				<td colspan="7"><font color="red">Click "S. No" to view details</font></td>
			</tr>
			<tr>
				<td colspan="7">
					<table>
						<tr class="subheading" align="center">
							<td width="5%">S. No.</td>
							<td width="25%">Description</td>
							<td width="10%">Total Deficiency</td>
							<td width="15%">Notified by</td>
							<td width="15%">Notification Date</td>
							<td width="15%">Cured By</td>
							<td width="15%">Cured Date</td>
						</tr>
						<s:iterator value="notifiedDeficiencyList" status="rowstatus">
							<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
								<s:url action="viewEditDeficiencies" var="viewDeficiencies">
									<s:param name="struts.token.name">token</s:param>
									<s:param name="token" value="token"/>
									<s:param name="pleadingBeanId" value="%{cercPetition.id}"/>
									<s:param name="deficiencyId" value="id"/>
								</s:url>
								<td><s:a href="%{viewDeficiencies}"><s:property value="#rowstatus.count"/></s:a></td>
								<td><s:property value="description"/></td>
								<td><s:property value="cercPetitionDeficienciesList.size()"/></td>
								<td>
							<s:if test="notifiedBy!=null"> (<s:property value="notifiedBy.userType"/>)</s:if>
							<s:property value="notifiedBy.firstName"/>
							<s:property value="notifiedBy.middleName"/>
							<s:property value="notifiedBy.lastName"/> 
						</td>
								<td><s:date name="notificationDate" format="dd/MM/yyyy kk:mm"/></td>
							<td>	
							<s:if test="curedBy!=null">(<s:property value="curedBy.userType"/>)</s:if>
							<s:property value="curedBy.firstName"/>
							<s:property value="curedBy.middleName"/>
							<s:property value="curedBy.lastName"/> 
						</td>
						
								<td><s:date name="cureDate" format="dd/MM/yyyy kk:mm"/></td>
							</tr>
						</s:iterator>
						<s:if test="notifiedDeficiencyDocumentList.size()>0">
							<tr valign="top" class="subheading">
								<td colspan="7">Attachment Details</td>
							</tr>
							<tr>
								<td colspan="7">
									<table border = "1" cellspacing="0" cellpadding="0">
										<tr>
											<td width="4%">S.No.</td>
											<td width="40%">Document Type</td>
											<td width="40%">Document Name</td>
											<td width="16%">Uploaded On</td>
										</tr>
										<s:iterator value="notifiedDeficiencyDocumentList" status="rowstatus">
											<tr>
												<s:url action="openUploadedFile" var="openPdfFile" escapeAmp="false">
													<s:param name="struts.token.name">token</s:param>
													<s:param name="token" value="token"/>
							            			<s:param name="openUploadedFileName"><s:property value="fileNameDisplay"/></s:param>
							            			<s:param name="openUploadedFileNameDisplay"><s:property value="fileNameDisplay"/></s:param>
            										<s:param name="filingBeanId" value="pleadingBeanId"/>
            										<s:param name="constantName" value="%{'cercPleadingDocuments'}"/>
							        			</s:url>
												<td><s:property value="#rowstatus.count"/></td>
												<td><s:property value="refDocumentId.documentName"/></td>
												<td><s:a href="%{openPdfFile}" title="Click to Open"><s:property value="fileNameDisplay"/></s:a></td>
												<td><s:date name="updatedOn" format="dd/MM/yyyy kk:mm"/>
													<s:if test="refDocumentId.id==8">
														<s:hidden name="vakalatnamaUploaded" value="%{'true'}"/>
													</s:if>
												</td>
											</tr>
										</s:iterator>
									</table>
								</td>
							</tr>
						</s:if>
					</s:if>
				<tr>
					<td colspan="7"></td>
				</tr>
				<tr>
					<td colspan="7" align="right">
						<s:if test="%{cercPetition.refStatusId.statusCode=='S' and cercPetition.refStatusId.statusType=='F'}">
							<s:url action="deficiencyPetitionDetailsSave" var="noDeficienciesLink">
								<s:param name="struts.token.name">token</s:param>
								<s:param name="token" value="token"/>
								<s:param name="pleadingBeanId" value="%{cercPetition.id}"/>
								<s:param name="noDeficiencies" value="%{true}"/>
							</s:url>
							<s:url action="deficiencyPetitionDetailsSave" var="deficienciesCured">
								<s:param name="struts.token.name">token</s:param>
								<s:param name="token" value="token"/>
								<s:param name="pleadingBeanId" value="%{cercPetition.id}"/>
								<s:param name="noDeficiencies" value="%{true}"/>
							</s:url>
							<s:if test = "#session.CERC_USER.refOrganisationId.id==1">
							<s:if test="cercPetition.deficienciesNotificationDate==null">
								<s:a href="%{noDeficienciesLink}"><input type="button" onClick="return deleteConfirmation();" id="nodecifienciesbutton" name="nodecifienciesbutton" value="No Deficiencies" class="formbutton"/></s:a>
							</s:if>
							<s:if test="cercPetition.deficienciesNotificationDate!=null and cercPetition.refilingDate==null">
								<s:a href="%{deficienciesCured}"><input type="button" id="dDecifienciescuredbutton" name="dDecifienciescuredbutton" value="Deficiencies Cured" class="formbutton" /></s:a>
							</s:if>
							</s:if>
						</s:if>
						<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="deficienciesList"/>
					</td>
				</tr>
		</table>
	<s:token/>
</s:form>	
            	
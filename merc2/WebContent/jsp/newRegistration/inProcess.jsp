<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="js/inputFieldValidationFilter.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
	
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$(".advocate").hide();
						$(".individual").hide();
						$(".isEmpanneledOrEmployee").hide();
						$(".employee").hide();
						$(".empanneledAdvocate").hide();
						$(".isEmpanneledAdvocateIsLawFirm").hide();
						$(".advocateOrIndividualOrEmployee").hide();
						$(".employee").hide();
						$('#employeeDepartment').val("");
						$('#employeeCode').val("");
						$('#employeeDesignation').val("");
						$('#LawFirmName').val("");
						$(".delete").hide();

						if ($('#userType').val() == "A") {
							$(".advocate").show();
							$(".advocateOrIndividualOrEmployee").show();
							$(".individual").hide();
							$(".isEmpanneledOrEmployee").hide();
							$(".employee").hide();
							$(".empanneledAdvocate").hide();
							$(".organization").hide();
							$('#employeeDepartment').val("");
							$('#employeeCode').val("");
							$('#employeeDesignation').val("");
						} else if ($('#userType').val() == "I") {
							$(".individual").show();
							$(".advocateOrIndividualOrEmployee").show();
							$(".advocate").hide();
							$(".isEmpanneledOrEmployee").hide();
							$(".employee").hide();
							$(".empanneledAdvocate").hide();
							$(".organization").hide();
							$(".isEmpanneledAdvocateIsLawFirm").hide();
							$('#employeeDepartment').val("");
							$('#employeeCode').val("");
							$('#employeeDesignation').val("");
							$('#LawFirmName').val("");
							$("#isLawFirm").prop("checked", false);
							$("#isEmpanelled").prop("checked", false);
						} else if ($('#userType').val() == "O") {
							$(".organization").show();
							$(".advocate").hide();
							$(".individual").hide();
							$(".isEmpanneledOrEmployee").hide();
							$(".employee").hide();
							$(".empanneledAdvocate").hide();
							$(".advocateOrIndividualOrEmployee").hide();
							$('#employeeDepartment').val("");
							$('#employeeCode').val("");
							$('#employeeDesignation').val("");
							$('#LawFirmName').val("");
							$("#isLawFirm").prop("checked", false);
							$("#isEmpanelled").prop("checked", false);
							//$('#firstName').val("");
							//$('#lastName').val("");	
						} else if ($('#userType').val() == "E") {
							$(".employee").show();
							$(".advocateOrIndividualOrEmployee").show();
							$(".isEmpanneledOrEmployee").show();
							$(".advocate").hide();
							$(".empanneledAdvocate").hide();
							$(".organization").hide();
							$(".isEmpanneledAdvocateIsLawFirm").hide();
							$('#LawFirmName').val("");
							$("#isLawFirm").prop("checked", false);
							$("#isEmpanelled").prop("checked", false);
						}

						$(".adminClarification").hide();
						$(".adminRejection").hide();
						$('input[name="refStatusUpdateId"]').change(function() {
							if ($(this).val() == 1) {
								$(".adminClarification").hide();
								$(".adminRejection").hide();
							} else if ($(this).val() == 2) {
								$(".adminClarification").hide();
								$(".adminRejection").hide();
							} else if ($(this).val() == 3) {
// 								<!-- 			04-03-2020 start AK -->
// 								alert("1");
								$(".adminClarification").show();
								$('#clarificationQuestion').hide();
								if($('#refClarificationQuestionId').val()==""){
// 									alert("2"+$('#refClarificationQuestionId').val());
									 $('#refClarificationQuestionId').change(function(){
										 if($('#refClarificationQuestionId').val()==4){
// 												alert("3"+$('#refClarificationQuestionId').val());
												document.getElementById("clarificationQuestion").value = "";
												$("#clarificationQuestion").show();	
											}
										 else if ($('#refClarificationQuestionId').val()!=4) {
											 $('#clarificationQuestion').hide();
												document.getElementById("clarificationQuestion").value = $('#refClarificationQuestionId').find(":selected").text();
// 												alert("4"+document.getElementById("clarificationQuestion").value);
											}
										  });	
								}	

								$(".adminRejection").hide();
							} else if ($(this).val() == 4) {
// 								alert("1");
								$(".adminRejection").show();
								$('#rejectionReason').hide();
								if($('#refRejectionReasonId').val()==""){
// 									alert("2"+$('#refRejectionReasonId').val());
									 $('#refRejectionReasonId').change(function(){
										 if($('#refRejectionReasonId').val()==4){
// 												alert("3"+$('#refRejectionReasonId').val());
												document.getElementById("rejectionReason").value = "";
												$("#rejectionReason").show();	
											}
										 else if ($('#refRejectionReasonId').val()!=4) {
											 $('#rejectionReason').hide();
												document.getElementById("rejectionReason").value = $('#refRejectionReasonId').find(":selected").text();
// 												alert("4"+document.getElementById("rejectionReason").value);
											}
										  });	
								}	
								
								$(".adminClarification").hide();
							}
//								<!-- 04-03-2020 end AK -->	
						});

						$("input[name='savebutton']").click(function() {
							var fileName = $('#attachedDocument').val().toLowerCase();
							var fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1); 
							
							//alert($('input[name="refStatusUpdateId"]:checked').val());
						
							if ($('input[name="refStatusUpdateId"]:checked').val() == "3" && $('#clarificationQuestion').val() == "") {
								alert("Please specify clarification question.");
								return false;
							}
							else if($('input[name="refStatusUpdateId"]:checked').val() == "3" && filterTextArea.test($('#documentDescription').val())==false && $('#attachedDocument').val()!="")
							{					
								alert("Invalid document description.");
								$('#documentDescription').focus();
								return false;
							}
							else if ($('input[name="refStatusUpdateId"]:checked').val() == "4" && $('#rejectionReason').val() == "") {
								alert("Please specify rejection reason.");
								return false;
							}
							else if($('#documentDescription').val()!="" && $('#attachedDocument').val()=="")
							{
								alert('Please attach document.');
						    	return false;
							}
							 else if($('input[name="refStatusUpdateId"]:checked').val()==3 && $('#attachedDocument').val()!="" && fileExtension!="jpg" && fileExtension!="jpeg" && fileExtension!="pdf")
						    {
								alert('Please attach jpeg / pdf files only.');
						    	return false;
						    } 
							});

					});
	function fidAdd() {
		$('.fidRepeat:first').clone().insertAfter(".fidRepeat:last").find(
				"#attachedDocument").val("");
		var fidLength = $(".fidRepeat").length;

		$((".fidRepeat")).each(function(i) {
			if (i < (fidLength - 1)) {
				$(".delete").show();
				$(".add").hide();
			} else {
				$("span.delete:last").hide();
				$("span.add:last").show();
			}
		});
	}

	function fidDelete(e) {
		$(e).parents(".fidRepeat").remove();
	}
</script>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:form theme="simple" name="inProcess" id="inProcess" action="inProcessSubmit" method="post" enctype="multipart/form-data">
	<s:hidden name="cercUserId" />
	<table border="0">
		<tr>
			<th colspan="7" class="mainheading">New User Registration</th>
		</tr>
		<tr>
			<td colspan="7">User Type: <s:if test="cercUserPending.userType=='O'">Organization</s:if>
			<s:if test="cercUserPending.userType=='I'">Individual</s:if>
			<s:if test="cercUserPending.userType=='E'">Employee</s:if>
			<s:if test="cercUserPending.userType=='A'">Advocate</s:if>
					<s:hidden name="cercUserPending.userType" id="userType" />
			</td>
		</tr>
		<tr class="organization">
			<td width="20%">Organisation Name</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercUserPending.firstName" /></td>
			<td width="2%"></td>
			<td width="20%">Short Name</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercUserPending.lastName" /></td>
		</tr>
		<tr class="advocateOrIndividualOrEmployee">
			<td width="20%">First Name</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercUserPending.firstName" /></td>
			<td width="2%"></td>
			<td width="20%">Last Name</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercUserPending.lastName" /></td>
		</tr>
		<tr class="organization">
			<td>Organization Type</td>
			<td>:</td>
			<td><s:property
					value="cercUserPending.refOrganisationTypeId.organisationType" /></td>
			<td></td>
<!-- 			<td>Region</td> -->
<!-- 			<td>:</td> -->
<%-- 			<td><s:property --%>
<%-- 					value="cercUserPending.refOrganisationId.refRegionId.region" /></td> --%>
		</tr>
<%-- 		<tr class="advocate">
			<td>Empanneled</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercUserPending.isEmpanelled" /></td>
		</tr>
 --%>		<tr class="isEmpanneledOrEmployee">
			<td>Organization</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercUserPending.refOrganisationId.organisationName" /></td>
			<%-- <td><s:property value="cercUserPending.registrationCode" /></td> --%>
		</tr>
		<tr class="employee">
			<td>Department</td>
			<td>:</td>
			<td colspan="5">
			<s:if test='cercUserPending.employeeDepartment==null or cercUserPending.employeeDepartment==""'>
				<s:property value="cercUserPending.refDepartmentId.departmentDescription"/> (<s:property value="cercUserPending.refDivisionId.divisionName"/>)
			</s:if>
			<s:else>
				<s:property value="cercUserPending.employeeDepartment" />
			</s:else>
			</td>
		</tr>
		<tr class="employee">
			<td>Employee Code</td>
			<td>:</td>
			<td><s:property value="cercUserPending.employeeCode" /></td>
			<td></td>
			<td>Designation</td>
			<td>:</td>
			<td><s:property value="cercUserPending.employeeDesignation" /></td>
		</tr>
		<tr class="empanneledAdvocate">
			<td>Law Firm</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercUserPending.isLawFirm" /></td>
		</tr>
		<tr class="isEmpanneledAdvocateIsLawFirm">
			<td>Law Firm Name</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercUserPending.LawFirmName" /></td>
		</tr>
		<tr class="subheading">
			<td colspan="3">Permanent Address</td>
			<td>
				<!-- <a name="copyAddress" id="copyAddress" onclick="copyAddress(this);" href="javascript:void(0);">></a> -->
			</td>
			<td colspan="3">Correspondence Address</td>
		</tr>
		<tr>
			<td>Login ID</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercUserPending.userId" /></td>
		</tr>
<!-- 		<tr class="organization"> -->
<!-- 			<td>Contact Person</td> -->
<!-- 			<td>:</td> -->
<%-- 			<td colspan="5"><s:property --%>
<%-- 					value="cercUserPending.contactPerson" /></td> --%>
<!-- 		</tr> -->
		<tr>
			<td>Address</td>
			<td>:</td>
			<td><s:property value="cercUserPending.address" /></td>
			<td></td>
			<td>Address</td>
			<td>:</td>
			<td><s:property value="cercUserPending.correspondenceAddress" /></td>
		</tr>
		<tr>
			<td>State</td>
			<td>:</td>
			<td><s:property value="cercUserPending.refStateId.stateName" /></td>
			<td></td>
			<td>State</td>
			<td>:</td>
			<td><s:property
					value="cercUserPending.refCorrespondenceStateId.stateName" /></td>
		</tr>
		<tr>
			<td>City</td>
			<td>:</td>
			<td><s:property value="cercUserPending.refCityId.cityName" /></td>
			<td></td>
			<td>City</td>
			<td>:</td>
			<td><s:property
					value="cercUserPending.refCorrespondenceCityId.cityName" /></td>
		</tr>
		<tr>
			<td>Pincode</td>
			<td>:</td>
			<td><s:property value="cercUserPending.pinCode" /><br>
			<span id="pincodeerrmsg"></span></td>
			<td></td>

			<td>Pincode</td>
			<td>:</td>
			<td><s:property value="cercUserPending.correspondencePinCode" /><br>
			<span id="correspondencePincodeerrmsg"></span></td>
		</tr>
		<tr class="subheading">
			<td colspan="7">Communication Details</td>
		</tr>
		<tr align="left">
			<td>Contact Number</td>
			<td>:</td>
			<td><s:property value="cercUserPending.contactNumber" /><br>
			<span id="contactNumbererrmsg"></span></td>
			<td></td>
			<td>Alternate Number</td>
			<td>:</td>
			<td><s:property value="cercUserPending.alternateNumber" /><br>
			<span id="alternateNumbererrmsg"></span></td>
		</tr>
		<tr align="left">
			<td>Mobile</td>
			<td>:</td>
			<td><s:property value="cercUserPending.mobile" /><br>
			<span id="mobileerrmsg"></span></td>
			<td></td>
			<td>Alternate Mobile</td>
			<td>:</td>
			<td><s:property value="cercUserPending.alternateMobile" /><br>
			<span id="alternateMobileerrmsg"></span></td>
		</tr>
		<tr>
			<td>EMail Address</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercUserPending.email" /></td>
		</tr>
		<tr class="subheading">
			<td colspan="7">Other Details</td>
		</tr>
		<tr class="advocateOrIndividualOrEmployee">
<!-- 			<td>Father's Name</td> -->
<!-- 			<td>:</td> -->
<%-- 			<td><s:property value="cercUserPending.fatherName" /></td> --%>
<!-- 			<td></td> -->
			<td>Date of Birth</td>
			<td>:</td>
			<td><div>
					<s:date name="cercUserPending.dob" format="dd/MM/yyyy" />
				</div></td>
		</tr>
		<tr class="advocateOrIndividualOrEmployee">
			<td>Gender</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercUserPending.gender" /></td>
		</tr>
		<tr class="advocateOrIndividualOrEmployee">
			<td>PAN Card Number</td>
			<td>:</td>
			<td><s:property value="cercUserPending.pan" /></td>
			<td></td>
			<td>Aadhaar Card Number</td>
			<td>:</td>
			<td><s:property value="cercUserPending.adhaarNo" /></td>
		</tr>
		<tr class="organization">
			<td>GSTN Number</td>
			<td>:</td>
			<td><s:property value="cercUserPending.tan" /></td>
			<td></td>
			<td>Aadhaar Card Number</td>
			<td>:</td>
			<td><s:property value="cercUserPending.aadhaar" /></td>
		</tr>
		<tr class="advocate">
			<td>Bar Council Number</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercUserPending.barCouncilNo" />
				&nbsp;&nbsp;Year :&nbsp; <s:property
					value="cercUserPending.barCouncilYear" /> &nbsp;&nbsp;State :&nbsp;
				<s:property value="cercUserPending.barCouncilRefStateId.stateName" />
			</td>
		</tr>
		<s:if test="cercUserDocumentsList.size>0">
			<tr class="subheading">
				<td colspan="7">Attachments</td>
			</tr>
			<tr>
				<td colspan="7">
					<table width="100%">
						<tr class="subheading">
							<td>#</td>
							<td>Document Name</td>
							<td>File Name</td>
							<td>Uploaded on</td>
						</tr>
						<s:iterator value="cercUserDocumentsList" status="rowstatus">
							<tr>
								<td><s:property value="#rowstatus.count" /></td>
								<td><s:property value="refDocumentId.documentName" /></td>
								<s:url action="openUserFile" var="openPdfFile" escapeAmp="false">
									<s:param name="struts.token.name">token</s:param>
									<s:param name="token" value="token" />
									<s:param name="openUploadedFileName">
										<s:property value="fileName" />
									</s:param>
								</s:url>
								<td><s:a href="%{openPdfFile}" title="Click to Open">
										<s:property value="fileName" />
									</s:a></td>
								<td><s:date name="updatedOn" format="dd/MM/yyyy" /></td>
							</tr>
						</s:iterator>
					</table> <s:property value="cercUserPending.attachedDocument" />
				</td>
			</tr>
		</s:if>
		<%-- 		<tr class="subheading">
			<td colspan="7">Disclaimer</td>	
		</tr>
		<tr>
			<td colspan="7">
				 <s:property value="cercUserPending.disclaimerText"/>
			</td>
		</tr>
 --%>
		<s:if test="cercClarificationQuestionList.size>0">
			<tr class="subheading">
				<td colspan="7">Clarification Reply</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="0">
						<tr class="subheading">
							<td width="4%">#</td>
							<td width="48%">Clarification Question</td>
							<td width="48%">Reply</td>
						</tr>
						<s:iterator value="cercClarificationQuestionList"
							status="rowstatus">
							<tr>
								<td><s:property value="#rowstatus.count" />.</td>
								<td><s:property value="clarificationQuestion" /></td>
								<td><s:property value="answer" /></td>
							</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
		</s:if>
		<tr class="subheading">
			<td colspan="7">For Administrator</td>
		</tr>
		<tr>
			<td>Status<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:radio list="refStatusList"
					name="refStatusUpdateId" id="refStatusUpdateId" listKey="id"
					listValue="statusName" theme="simple"
					value="cercUserPending.refStatusId.id" /> <%-- <s:select list="refStatusList" name="refStatusId" id="refStatusId" listKey="id" listValue="statusName" theme="simple" value="cercUserPending.refStatusId.id"/> --%>
			</td>
		</tr>
		<tr class="adminClarification">
			<td>Clarification Questions<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
			<!-- 			04-03-2020 start AK -->
			 <s:select list="refClarificationQuestionList"
					name="refClarificationQuestionId" id="refClarificationQuestionId"
					listKey="id" listValue="clarificationName" headerValue="- Select -"
					headerKey="" />
					<s:textarea name="clarificationQuestion" id="clarificationQuestion" cols="150" rows="5">
					</s:textarea></td> 
					<!-- 			04-03-2020 end AK -->
		</tr>
		<tr class="adminClarification" valign="top">
			<td>Upload Document</td>
			<td>:</td>
			<td colspan="5">
				<div class="fidRepeat">
					<s:textfield type="text" size="24" name="documentDescription" id="documentDescription"/>
					&nbsp;<s:file name="fileUpload" id="attachedDocument" label="Select a File to upload" size="40" onclick="resetInputBox(this);" />
					<s:hidden name="fileUploadName" value="%{'16'}" />
					<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>
					<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
				</div>
				<span class="tooltip">(pdf / jpeg files only)</span>
				<br/>
				<br/>
				<span class="tooltip">Note : Consolidated, uploaded documents size should not exceed 100 MB.</span>	
			</td>
		</tr>
		<tr class="adminRejection">
			<td>Rejection Reason<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
			
		<s:select list="refRejectionReasonList"
					name="refRejectionReasonId" id="refRejectionReasonId" listKey="id"
					listValue="rejectionName" headerValue="- Select -" headerKey="" /> 
					<s:textarea name="rejectionReason" id="rejectionReason" cols="150" rows="5"></s:textarea>
					</td>
		</tr>
		<tr>
			<td colspan="7"></td>
		</tr>
		<tr>
			<td colspan="7" align="right"><s:submit id="savebutton" name="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp; <!-- <input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp; -->
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel"
					class="formbutton" action="viewUserRegistrationCount" /></td>
		</tr>
	</table>
	<s:token />
</s:form>
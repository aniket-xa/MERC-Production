<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
</script>
<script type="text/javascript">

	$(document).ready(function() {
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
	    //$('#firstName').val("");
	    //$('#lastName').val("");
	   
	    $("#pincode").keypress(function (e) {
	        //if the letter is not digit then display error and don't type anything
	        if (e.which != 8 && e.which != 0 && e.which != 127 && (e.which < 48 || e.which > 57)) {
	           //display error message
	           $("#pincodeerrmsg").html("Digits Only").show();
	                  return false;
	       }
	        else
	        {
	        	   $("#pincodeerrmsg").html("Digits Only").hide();
	                  return true;
	        }
	      });
	    $("#correspondencePincode").keypress(function (e) {
	        //if the letter is not digit then display error and don't type anything
	        if (e.which != 8 && e.which != 0 && e.which != 127 && (e.which < 48 || e.which > 57)) {
	           //display error message
	           $("#correspondencePincodeerrmsg").html("Digits Only").show();
	                  return false;
	       }
	        else
	        {
	        	   $("#correspondencePincodeerrmsg").html("Digits Only").hide();
	                  return true;
	        }
	      });
	    $("#contactNumber").keypress(function (e) {
	        //if the letter is not digit then display error and don't type anything
	        if (e.which != 8 && e.which != 0 && e.which != 127 && (e.which < 48 || e.which > 57)) {
	           //display error message
	           $("#contactNumbererrmsg").html("Digits Only").show();
	                  return false;
	       }
	        else
	        {
	        	   $("#contactNumbererrmsg").html("Digits Only").hide();
	                  return true;
	        }
	      });
	
	    $("#alternateNumber").keypress(function (e) {
	        //if the letter is not digit then display error and don't type anything
	        if (e.which != 8 && e.which != 0 && e.which != 127 && (e.which < 48 || e.which > 57)) {
	           //display error message
	           $("#alternateNumbererrmsg").html("Digits Only").show();
	                  return false;
	       }
	        else
	        {
	        	   $("#alternateNumbererrmsg").html("Digits Only").hide();
	                  return true;
	        }
	      });
	    $("#mobile").keypress(function (e) {
	        //if the letter is not digit then display error and don't type anything
	        if (e.which != 8 && e.which != 0 && e.which != 127 && (e.which < 48 || e.which > 57)) {
	           //display error message
	           $("#mobileerrmsg").html("Digits Only").show();
	                  return false;
	       }
	        else
	        {
	        	   $("#mobileerrmsg").html("Digits Only").hide();
	                  return true;
	        }
	      });	
	    $("#alternateMobile").keypress(function (e) {
	        if (e.which != 8 && e.which != 0 && e.which != 127 && (e.which < 48 || e.which > 57)) {
	           
	           	$("#alternateMobileerrmsg").html("Digits Only").show();
	                  return false;
	       }
	        else
	        {
	        	$("#alternateMobileerrmsg").html("Digits Only").hide();
	                  return true;
	        }
	      });
		
	    
		//$('input[name="cercUser.userType"]').change(function () {
			if ($('input[name="cercUser.userType"]').val() == "A") {
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
	        }
	        else if ($('input[name="cercUser.userType"]').val() == "I") {
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
	        	$("#isLawFirm").prop( "checked", false );
	    		$("#isEmpanelled").prop( "checked", false );
	 		}
	        else if ($('input[name="cercUser.userType"]').val() == "O") {
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
	    		$("#isLawFirm").prop( "checked", false );
	    		$("#isEmpanelled").prop( "checked", false );
	    		//$('#firstName').val("");
	    		//$('#lastName').val("");	
	    	} 
	        else if ($('input[name="cercUser.userType"]').val() == "E") {
	        	$(".employee").show();
	        	$(".advocateOrIndividualOrEmployee").show();
	        	$(".isEmpanneledOrEmployee").show();
	        	$(".advocate").hide();
	        	$(".empanneledAdvocate").hide();     			 
	 			$(".organization").hide();
	 			$(".isEmpanneledAdvocateIsLawFirm").hide();
	 			$('#LawFirmName').val("");
	    		$("#isLawFirm").prop( "checked", false );
	    		$("#isEmpanelled").prop( "checked", false );	    		
	    	} 
		//});
        
        
        $('input[name="isEmpanelled"]').on('click',function () {
        	if ($(this).is(':checked')) {
	    		$(".isEmpanneledOrEmployee").show(); 
	        	$(".empanneledAdvocate").show();
	    	} else {
	    		$(".isEmpanneledOrEmployee").hide(); 
	        	$(".empanneledAdvocate").hide();
	        	$(".isEmpanneledAdvocateIsLawFirm").hide();
	        	$("#isLawFirm").prop( "checked", false );            	
	    	}
		});
    	
		$('input[name="isLawFirm"]').on('click',function () {
			if ($(this).is(':checked')) {
	    		$(".isEmpanneledAdvocateIsLawFirm").show();
	    	} else {
	    		$(".isEmpanneledAdvocateIsLawFirm").hide();
	    		$('#LawFirmName').val("");	    	        	
	    	}
		});
	});   
	</script>
<s:form theme="simple" name="alertList" action="editUserProfile">
<s:push value="cercUser"> 
 <s:hidden name="cercUserId" value="%{id}"/>
	<table border = "0">
		<tr><th colspan="7" class="mainheading">View User Profile</th></tr>
		 <s:if test='cercUser.refOrganisationId!=null and cercUser.refOrganisationId==1 and cercUser.userType=="E"'></s:if>
		 <s:else>
		 <tr>
			<td width="10%">User Type</td>
			 <td width="1%">:</td>
			 <td colspan="5" width="*">
			<s:if test="cercUser.userType=='O'">Organization</s:if>
			<s:if test="cercUser.userType=='I'">Individual</s:if>
			<s:if test="cercUser.userType=='E'">Employee</s:if>
			<s:if test="cercUser.userType=='A'">Advocate</s:if>
			<s:hidden name="cercUser.userType" id="userType" />
			</td>
		</tr>
		</s:else>
		<tr class="organization">
			<td width="20%">Organisation Name</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercUser.firstName" /></td>
			<td width="2%"></td>
			<td width="20%">Short Name</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercUser.lastName" /></td>
		</tr>
		<tr class="advocateOrIndividualOrEmployee">
		<td colspan="7"><table><tr>
			<td width="10%">First Name</td>
			<td width="1%">:</td>
			<td width="20%"><s:property value="cercUser.firstName" /></td>
			<td width="12%">Middle Name</td>
			<td width="1%">:</td>
			<td width="20%"><s:property value="cercUser.middleName" /></td>
			<td width="10%">Last Name</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercUser.lastName" /></td>
			</tr></table>
		</td>
		</tr>
		<s:if test="cercUser.isEmpanelled"></s:if> 
		<tr class="organization">
			<td>Organization Type</td>
			<td>:</td>
			<td><s:property	value="cercUser.refOrganisationTypeId.organisationType" /></td>
<!-- 			<td></td> -->
<!-- 			<td>Region</td> -->
<!-- 			<td>:</td> -->
<!-- 			<td> -->
<%-- 			<s:property value="cercUser.refOrganisationId.refRegionId.region" /> --%>
<!-- 			</td> -->
		</tr>
		<tr class="advocate">
			<td>Empanneled</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercUser.isEmpanelled" /></td>
		</tr>
		<tr class="isEmpanneledOrEmployee">
			<td>Organization</td>
			<td>:</td>
			<td><s:property value="cercUser.refOrganisationId.organisationName" /></td>
<!-- 			<td></td> -->
<!-- 			<td>Security Code</td> -->
<!-- 			<td>:</td> -->
<%-- 			<td><s:property value="cercUser.registrationCode" /></td> --%>
		</tr>
		<tr class="employee">
			<td>Department</td>
			<td>:</td>
			<td colspan="5">
			<s:if test="cercUser.employeeDepartment==null or cercUser.employeeDepartment==''">
				<s:property value="cercUser.refDepartmentId.departmentDescription" />
			</s:if>
			<s:else>
				<s:property value="cercUser.employeeDepartment" />
			</s:else>
			
		
			<s:if test="cercUser.refDivisionId!=null">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Division&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="cercUser.refDivisionId.divisionName" />
			</s:if>
			</td>
		</tr>
		<tr class="employee">
			<td>Employee Code</td>
			<td>:</td>
			<td><s:property value="cercUser.employeeCode" /></td>
			<td></td>
			<td>Designation</td>
			<td>:</td>
			<td><s:property value="cercUser.employeeDesignation" /></td>
		</tr>
		<tr class="empanneledAdvocate">
			<td>Law Firm</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercUser.isLawFirm" /></td>
		</tr>
		<tr class="isEmpanneledAdvocateIsLawFirm">
			<td>Law Firm Name</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercUser.LawFirmName" /></td>
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
			<td colspan="5"><s:property value="cercUser.userId" /></td>
		</tr>
<!-- 		<tr class="organization"> -->
<!-- 			<td>Contact Person</td> -->
<!-- 			<td>:</td> -->
<%-- 			<td colspan="5"><s:property --%>
<%-- 					value="cercUser.contactPerson" /></td> --%>
<!-- 		</tr> -->
		<tr>
			<td>Address</td>
			<td>:</td>
			<td><s:property value="cercUser.address" /></td>
			<td></td>
			<td>Address</td>
			<td>:</td>
			<td><s:property value="cercUser.correspondenceAddress" /></td>
		</tr>
		<tr>
			<td>State</td>
			<td>:</td>
			<td><s:property value="cercUser.refStateId.stateName" /></td>
			<td></td>
			<td>State</td>
			<td>:</td>
			<td><s:property
					value="cercUser.refCorrespondenceStateId.stateName" /></td>
		</tr>
		<tr>
			<td>City</td>
			<td>:</td>
			<td><s:property value="cercUser.refCityId.cityName" /></td>
			<td></td>
			<td>City</td>
			<td>:</td>
			<td><s:property
					value="cercUser.refCorrespondenceCityId.cityName" /></td>
		</tr>
		<tr>
			<td>Pincode</td>
			<td>:</td>
			<td><s:property value="cercUser.pinCode" /><br>
			<span id="pincodeerrmsg"></span></td>
			<td></td>

			<td>Pincode</td>
			<td>:</td>
			<td><s:property value="cercUser.correspondencePinCode" /><br>
			<span id="correspondencePincodeerrmsg"></span></td>
		</tr>
		<tr class="subheading">
			<td colspan="7">Communication Details</td>
		</tr>
		<tr align="left">
			<td>Landline Number</td>
			<td>:</td>
			<td><s:property value="cercUser.contactNumber" /><br>
			<span id="contactNumbererrmsg"></span></td>
			<td></td>
			<td>Alternate Number</td>
			<td>:</td>
			<td><s:property value="cercUser.alternateNumber" /><br>
			<span id="alternateNumbererrmsg"></span></td>
		</tr>
		<tr align="left">
			<td>Mobile</td>
			<td>:</td>
			<td><s:property value="cercUser.mobile" /><br>
			<span id="mobileerrmsg"></span></td>
			<td></td>
			<td>Alternate Mobile</td>
			<td>:</td>
			<td><s:property value="cercUser.alternateMobile" /><br>
			<span id="alternateMobileerrmsg"></span></td>
		</tr>
		<tr>
			<td>EMail Address</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercUser.email" /></td>
		</tr>
		<tr class="subheading">
			<td colspan="7">Other Details</td>
		</tr>
		<tr class="advocateOrIndividualOrEmployee">
<!-- 			<td>Father's Name</td> -->
<!-- 			<td>:</td> -->
<%-- 			<td><s:property value="cercUser.fatherName" /></td> --%>
<!-- 			<td></td> -->
			<td>Date of Birth</td>
			<td>:</td>
			<td><div>
					<s:date name="cercUser.dob" format="dd/MM/yyyy" />
				</div></td>
		</tr>
		<tr class="advocateOrIndividualOrEmployee">
			<td>Gender</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercUser.gender" /></td>
		</tr>
		<tr class="advocateOrIndividualOrEmployee">
			<td>PAN Card Number</td>
			<td>:</td>
			<td><s:property value="cercUser.pan" /></td>
			<td></td>
			<td>Aadhaar Card Number</td>
			<td>:</td>
			<td><s:property value="cercUser.adhaarNo" /></td>
		</tr>
		<tr class="organization">
			<td>GSTN Number</td>
			<td>:</td>
			<td><s:property value="cercUser.tan" /></td>
			<td></td>
			<td>Aadhaar Card Number</td>
			<td>:</td>
			<td><s:property value="cercUser.aadhaar" /></td>
		</tr>
		<tr class="advocate">
			<td>Bar Council Number</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercUser.barCouncilNo" />
				&nbsp;&nbsp;Year :&nbsp; <s:property
					value="cercUser.barCouncilYear" /> &nbsp;&nbsp;State :&nbsp;
				<s:property value="cercUser.barCouncilRefStateId.stateName" />
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
						<td><s:property value="#rowstatus.count"/> </td>
						<td><s:property value="refDocumentId.documentName"/></td>
						<s:url action="openUserFile" var="openPdfFile" escapeAmp="false">
						<s:param name="struts.token.name">token</s:param>
						<s:param name="token" value="token"/>
            			<s:param name="openUploadedFileName"><s:property value="fileName"/></s:param>
        				</s:url>
						<td><s:a href="%{openPdfFile}" title="Click to Open"><s:property value="fileName"/></s:a></td>
						<td><s:date name="updatedOn" format="dd/MM/yyyy"/></td> 
					</tr>
					</s:iterator>
				</table>
			</td>				
		</tr>
		</s:if>
 		<%-- <tr class="subheading">
			<td colspan="7">Clarification Reply</td>	
		</tr>
		
		<tr>
			<td colspan="7">
				<table border = "0">
					<tr class="subheading">
						<td width="4%">#</td>
						<td width="48%">Clarification Question</td>
						<td width="48%">Reply</td>						
					</tr>
					<s:iterator value="cercClarificationQuestionList" status="rowstatus">
					<tr valign="top">
						<td><s:property value="#rowstatus.count"/>.</td>
						<td><s:property value="clarificationQuestion"/></td>
						<s:if test="answer!=null">
						<td><s:textarea name="cercClarificationQuestionList[%{#rowstatus.index}].answer" id="" cols="50" rows="4" value="%{answer}" disabled="true"/> </td>
						<s:hidden name="cercClarificationQuestionList[%{#rowstatus.index}].answer"/>
						</s:if>
						<s:else>
						<td><s:textarea name="cercClarificationQuestionList[%{#rowstatus.index}].answer" id="answer" cols="50" rows="4" value="%{answer}"/> </td>
						</s:else>
						<s:hidden name="cercClarificationQuestionList[%{#rowstatus.index}].id"/>
						<s:hidden name="cercClarificationQuestionList[%{#rowstatus.index}].clarificationQuestion"/>
						<s:hidden name="cercClarificationQuestionList[%{#rowstatus.index}].cercUserId.id"/>
						<s:hidden name="cercClarificationQuestionList[%{#rowstatus.index}].updatedBy.id"/>
						<s:hidden name="cercClarificationQuestionList[%{#rowstatus.index}].updatedOn"/>
						<s:hidden name="cercClarificationQuestionList[%{#rowstatus.index}].isDeleted"/>
					</tr>
					</s:iterator>
				</table>
			</td>
		</tr>
		<tr class="subheading">
			<td colspan="7">Attachments</td>	
		</tr>
		<tr valign="top">
			<td>Document Type</td>
			<td>:</td>
			<td colspan="5">
				<div class="fidRepeat">
					<s:select list="refDocumentList" name="fileUploadName" listKey="id" listValue="documentName" id="refDocumentId" theme="simple" headerValue="- Select -" headerKey=""/>
					&nbsp;
					<s:textfield type="text" size="24" name="documentDescription" id="documentDescription"/>
					&nbsp;<s:file name="fileUpload" id="attachedDocument" label="Select a File to upload" size="40" onclick="resetInputBox(this);"/>
					<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>								        	
					<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
				</div>
				<span class="tooltip">(pdf / jpeg files only)</span>
				<br/>
				<br/>
				<span class="tooltip">Note : Consolidated, uploaded documents size should not exceed 100 MB.</span>		
			</td>				
		</tr> --%>
		<tr><td colspan="7"></td></tr>
		<tr><td colspan="7" align="right">
		<%-- <s:if test="cercUser.refStatusId.statusType=='R' and cercUser.refStatusId.statusCode=='C' and cercUser.id!=1"> --%>
		<input type="submit" id="savebutton" name="savebutton" value="Edit" class="formbutton" />&nbsp;&nbsp;
		<%-- </s:if> --%>
		<!-- <input type="submit" id="searchbutton" value="Reset" class="formbutton" />&nbsp;&nbsp; -->
		<s:submit type="submit" id="searchbutton" value="Cancel" class="formbutton" action="welcome"/></td></tr>
	</table>
	<s:token/>
	 </s:push>
</s:form>	

            	
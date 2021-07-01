<%@ page import="com.nic.cerc.pojo.registration.RefCity" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script src="js/inputFieldValidationFilter.js"></script>
<script src="js/registration1.js"></script>
<script src="js/session.js"></script>
<script src="js/jquery.js"></script>
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
</script>
<style>
#tan {
    text-transform: uppercase;
}
#pan {
    text-transform: uppercase;
}
</style>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:form theme="simple" name="newUserRegistration" id="newUserRegistration" method="post" enctype="multipart/form-data" >
<s:hidden id="userList" name="userList"/>
	<table border = "0">
		<tr><th colspan="7" class="mainheading">New User Registration</th></tr>
		<tr>
			<td colspan="7">
			<s:radio list="#{'O':'Organization','I':'Any Person/Individual','E':'Employee (of already Registered Organization)'}"  name="userType" id="userType" theme="simple"/>
			</td>
		</tr>
		<tr>
		<td class="advocateOrIndividual" width="20%"><s:radio list="#{'A':'Advocate'}" name="userType" id="adin"  theme="simple"/></td>
		</tr>
		<tr>
		
<%-- 		<% session.setAttribute("organisationName","document.getElementById("organisationName"));  %> --%>
			<td class="organization" id="organisationName"width="20%">Organisation Name<span class="required">*</span></td>
			<td class="advocateOrIndividualOrEmployee" id ="adinfirstname"  width="20%">First Name<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"><s:textfield type="text" size="24" name="firstName" id="firstName" maxlength="160"/></td>
			<td width="2%"></td>
			<td class="advocateOrIndividualOrEmployee" width="20%">Middle Name</td>
			<td class="advocateOrIndividualOrEmployee" width="1%">:</td>
			<td class="advocateOrIndividualOrEmployee" id="adinmidname" width="28%"><s:textfield type="text" size="24" name="middleName" id="middleName" maxlength="40"/></td>
		</tr>
		<tr>
			<td class="organization">Short Name<span class="required">*</span></td>
			<td class="advocateOrIndividualOrEmployee">Last Name<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:textfield type="text" size="24" name="lastName" id="lastName" maxlength="40"/></td>
		</tr>
		
		<tr class="organization">
			<td>Organization Type<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
			<s:select list="refOrgnisationTypeList" listKey="id" listValue="organisationType" name="refOrganisationTypeId.id" id="refOrganisationTypeId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:142pt"/>
			</td>
			<td></td>
			<%-- <td>Region (Assets dealing with)<span class="required">*</span></td>
			<td>:</td>
			<td>
			<s:select list="refRegionList" name="refRegionFor" id="refRegionId" listKey="id" listValue="regionCode+'  '+region" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/>
			</td>--%>
		</tr>
		<tr class="isEmpanneledOrEmployee">
			<td>Organization<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
			<s:select list="refOrgnisationList" name="refOrganisationId.id" listKey="id" listValue="organisationName" id="refOrganisationId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:485pt"/>
			</td>
			
				
		</tr>
		<tr class="isEmpanneledOrEmployee">
			
			<td>Organization Security Code<span class="required">*</span></td>
			<td>:</td>
			<td colspan="3"><s:textfield size="24" name="registrationCode" id="registrationCode"/>&nbsp;<span class="tooltip">As provided by your organisation administrator. </span></td>
			
		</tr>
		<%-- <tr class="organization">
			<td>Administrator Name<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:textfield type="text" size="24" name="contactPerson" id="contactPerson" maxlength="80"/></td>	
		</tr>--%>
		<tr class="employeeOther">
			<td>Department<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:textfield type="text" size="24" name="employeeDepartment" id="employeeDepartment" maxlength="80"/></td>	
		</tr> 
		
		<tr class="employeeCerc">
			<td>Department<span class="required">*</span></td>
			<td>:</td>
			<td><s:select list="refDepartmentList" listKey="id" listValue="departmentDescription" name="refDepartmentId.id" id="refDepartmentId" headerKey="" headerValue="- Select -"/></td>
			<td></td>
			<td>Division<span class="required">*</span></td>
			<td>:</td>
			<td><s:select list="refDivisionList" listKey="id" listValue="divisionName" name="refDivisionId.id" id="refDivisionId" headerKey="" headerValue="- Select -"/></td>	
		</tr> 
		<tr class="employee">
			<td>Employee Code<span class="required">*</span></td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="employeeCode" id="employeeCode" maxlength="8"/></td>
			</tr>
		<tr class="isEmpanneledOrEmployee">
			<td>Designation<span class="required">*</span></td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="employeeDesignation" id="employeeDesignation" maxlength="80"/></td>
		</tr>
		<tr class="empanneledAdvocate">
			<td>Law Firm</td>
			<td>:</td>
			<td colspan="5"><s:checkbox type="checkbox" name="isLawFirm" id="isLawFirm"/></td>	
		</tr>
		<tr class="isEmpanneledAdvocateIsLawFirm">
			<td>Law Firm Name<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:textfield type="text" size="24" name="LawFirmName" id="LawFirmName" maxlength="80"/></td>	
		</tr>
		<tr class="subheading">
			<td colspan="3">Permanent Address</td>
			<td><a name="copyAddress" id="copyAddress" onclick="copyAddress(this);" href="javascript:void(0);">></a></td>
			<td colspan="3">Correspondence Address</td>
		</tr>
		<tr>
			<td >Login ID<span class="required">*</span></td>
			<td>:</td>
			<!-- 			04-03-2020 start AK -->
			<td colspan="5"><s:textfield type="text" size="24" name="userId" id="userId" maxlength="32" minlength="32"  />&nbsp;<span class="tooltip">Login Id should be 5 to 32 characters and should be alphanumeric.</span></td>	
		<!-- 			04-03-2020 end AK -->
		</tr>
		
		<tr>
			<td>Address<span class="required">*</span></td>
			<td>:</td>
			<td><s:textarea cols="21" name="address" id="address"></s:textarea></td>
			<td></td>
			<td>Address<span class="required">*</span></td>
			<td>:</td>
			<td><s:textarea cols="21" name="correspondenceAddress" id="correspondenceAddress"></s:textarea></td>
		</tr>
		<tr>
			<td>State<span class="required">*</span></td>
			<td>:</td><s:url id="remoteurl" action="loadCities"/>
			<td><s:select list="refStateList" name="refStateId.id" listKey="id" listValue="stateName" theme="simple" id="refStateId" cssStyle="width:142pt" headerValue="- Select -" headerKey=""/></td>
			<td></td>
			<td>State<span class="required">*</span></td>
			<td>:</td>
			<td><s:select list="refStateList" name="refCorrespondenceStateId.id" listKey="id" listValue="stateName" theme="simple" id="refCorrespondenceStateId" cssStyle="width:142pt" headerValue="- Select -" headerKey=""/></td>			
		</tr>
		<tr>
			<td>City<span class="required">*</span></td>
			<td>:</td>
			<td><s:select list="refCityList" name="refCityId.id" listKey="id" listValue="cityName" theme="simple" id="refCityId" cssStyle="width:142pt" headerValue="- Select -" headerKey=""/></td>
			<td></td>
			<td>City<span class="required">*</span></td>
			<td>:</td>
			<td><s:select list="refCityList" name="refCorrespondenceCityId.id" listKey="id" listValue="cityName" theme="simple" id="refCorrespondenceCityId" cssStyle="width:142pt" headerValue="- Select -" headerKey=""/></td>			
		</tr>
		<tr>
			<td>Pincode<span class="required">*</span></td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="pinCode" id="pincode" maxlength="6" minlength="6"/><br><span id="pincodeerrmsg"></span></td>
			<td></td>
			
			<td>Pincode<span class="required">*</span></td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="correspondencePinCode" id="correspondencePincode" maxlength="6"/><br><span id="correspondencePincodeerrmsg"></span></td>
		</tr>
		<tr>
			<td colspan = "5"><s:checkbox name="sameAddr" id="sameAddr" fieldValue="true" /> Click here if Permanent address and Correspondence address are same</td>
		</tr>
		<tr class="subheading">
			<td colspan="7">Communication Details</td>	
		</tr>
		<tr valign="top" align="left">
			<td>Landline Number<span class = "required" id = "landlineRequired">*</span></td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="contactNumber" id="contactNumber" maxlength="11"/><br><span id="contactNumbererrmsg" class="tooltip"></span></td>
			<td></td>
			<td>Alternate Number</td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="alternateNumber" id="alternateNumber" maxlength="11"/><br><span id="alternateNumbererrmsg" class="tooltip"></span></td>
		</tr>
		<tr align="left">
			<td>Mobile<span class="required">*</span></td>
			<td>:</td>
			<!-- 			04-03-2020 start AK -->
			
		
			<td><s:textfield type="text" size="24" name="mobile" id="mobile" maxlength="10"/><br><span id="mobileerrmsg" class="tooltip"></span></td>			
			
			<!-- 			04-03-2020 end AK -->
			
			<td></td>
			<td>Alternate Mobile</td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="alternateMobile" id="alternateMobile" maxlength="11"/><br><span id="alternateMobileerrmsg" class="tooltip"></span></td>
		</tr>
		<tr>
			<td>EMail Address<span class="required">*</span></td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="email" id="email" maxlength="64"/></td>	
			<td></td>
			<td class="organization">Website</td>
			<td class="organization">:</td>
			<td class="organization"><s:textfield type="text" size="24" name="website" id="website" maxlength="64"/></td>	
		</tr>
		<tr class="subheading">
			<td colspan="7">Other Details</td>	
		</tr>
		<tr class="advocateOrIndividualOrEmployee">
			<%-- <td>Father's Name</td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="fatherName" id="fatherName" maxlength="80"/></td>
			<td></td>--%>
			<td>Date of Birth<span class="required">*</span></td>
			<td>:</td>
			<td><div><s:textfield type="text" name="dob"  id="dob" class="tcal" value="" size="21"/><br/><span class="tooltip">(dd/mm/yyyy)</span></div></td>
		</tr>
		<tr class="advocateOrIndividualOrEmployee">
			<td>Gender<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
			<s:radio list="#{'M':'Male','F':'Female'}" name="gender" id="gender" theme="simple" value="'M'"/>
			</td>	
		</tr>
		<tr>
			<td class="organization">GSTN Number<span class="required">*</span></td>
			<td class="advocateOrIndividualOrEmployee">PAN<span class="required">*</span></td>
			<td>:</td>
			<td class="organization"><s:textfield type="text" size="24" name="tan" id="tan" maxlength="15"/><br><span class="tooltip">Please enter Organisation's GSTN.</span></td>
			
			<td class="advocateOrIndividualOrEmployee"><s:textfield type="text" size="24" name="pan" id="pan" maxlength="10"/></td>	
			<td></td>
			<td class="aadhar">Aadhaar Card Number</td>
			<td class="aadhar">:</td>
			<td class="aadhar"><s:textfield type="text" size="24" name="adhaarNo" id="adhaarNo" maxlength="12"/></td>	
		</tr>
		<tr class="advocate">
			<td>Bar Council Number<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<s:textfield type="text" size="24" name="barCouncilNo" id="barCouncilNo" maxlength="40"/>
				&nbsp;&nbsp;Year<span class="required">*</span> :&nbsp;
				<s:select  name="barCouncilYear" id="barCouncilYear" list="yearList" headerValue="- Select -" headerKey=""/>
				
				&nbsp;&nbsp;State<span class="required">*</span> :&nbsp;
				<s:select list="refStateList" name="barCouncilRefStateId.id" listKey="id" listValue="stateName" id="barCouncilRefStateId" headerValue="- Select -" headerKey=""/>
			</td>	
		</tr>
		<tr class="subheading">
			<td colspan="7">Attachments</td>	
		</tr>
		
		<tr valign="top">
			<td>Document Type<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<div class="fidRepeat">
					<s:select onchange="checkDuplicate()" list="refDocumentList" name="fileUploadName" listKey="id" listValue="documentName" id="refDocumentId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:142pt"/>
					&nbsp;<s:textfield type="text" size="24" name="documentDescription" id="documentDescription"/>
					&nbsp;<s:file name="fileUpload" id="attachedDocument" label="Select a File to upload" size="40"/>
					<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
					<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>								        	
					
				</div>
				
				<span class="tooltip">(pdf / jpeg files only)</span>
				<br/>
				<br/>
				<span class="tooltip">Note : Each uploaded document's size should not exceed 300 MB.</span>		
			</td>				
		</tr>
		
		
		
		<tr class="subheading">
			<td colspan="7">Undertaking</td>	
		</tr>
		<tr>
			<td colspan="7">
				<div style="text-align: justify;text-justify: inter-word;"><s:checkbox type="checkbox" name="disclaimer" id="disclaimer"/>
				 <s:property value="disclaimerText"/></div>
			</td>
		</tr>
 		<tr>
			<td colspan="7">
				<img src="Captcha.jpg" border="0"/>
			</td>
  		</tr>
  		<tr>
			<td colspan="7">
				<s:textfield label="Code" name="captchaResponse" id="captchaResponse" size="24" maxlength="10"/>				
  			</td>
  		</tr>
 		<tr><td colspan="7"></td></tr>
		<tr><td colspan="7" align="right">
		<input type="submit" id="savebutton"  name="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp;
		<input type="reset" id="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
		<input type="button" id="cancelbutton" value="Cancel" class="formbutton" onclick="location.href='/'"/>
		</td></tr>
	</table>
	<s:token/>
</s:form>
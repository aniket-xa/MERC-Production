////
////sessionStorage.setItem("mobile", document.getElementById("mobile").val()); 
////			document.getElementById("mobile").innerHTML = sessionStorage.getItem("mobile")
//
//
//gender
//userType
//adin
//------------------------------pending
//document.getElementById("organisationName").value = sessionStorage.getItem("organisationName");
//document.getElementById("adinfirstname").value= sessionStorage.getItem("adinfirstname");
//document.getElementById("firstName").value= sessionStorage.getItem("firstName");
//document.getElementById("middleName").value= sessionStorage.getItem("middleName");
//document.getElementById("lastName").value= sessionStorage.getItem("lastName");
//document.getElementById("refOrganisationTypeId").value= sessionStorage.getItem("refOrganisationTypeId");
//document.getElementById("refOrganisationId").value= sessionStorage.getItem("refOrganisationId");
//document.getElementById("registrationCode").value= sessionStorage.getItem("registrationCode");
//document.getElementById("employeeDepartment").value= sessionStorage.getItem("employeeDepartment");
//document.getElementById("refDepartmentId").value= sessionStorage.getItem("refDepartmentId");
//document.getElementById("refDivisionId").value= sessionStorage.getItem("refDivisionId");
//document.getElementById("employeeCode").value= sessionStorage.getItem("employeeCode");
//document.getElementById("employeeDesignation").value= sessionStorage.getItem("employeeDesignation");
//document.getElementById("isLawFirm").value= sessionStorage.getItem("isLawFirm");
//document.getElementById("LawFirmName").value= sessionStorage.getItem("LawFirmName");
//document.getElementById("userId").value= sessionStorage.getItem("userId");
//document.getElementById("address").value= sessionStorage.getItem("address");
//document.getElementById("correspondenceAddress").value= sessionStorage.getItem("correspondenceAddress");
//document.getElementById("refStateId").value= sessionStorage.getItem("refStateId");
//document.getElementById("refCorrespondenceStateId").value= sessionStorage.getItem("refCorrespondenceStateId");
//document.getElementById("refCityId").value= sessionStorage.getItem("refCityId");
//document.getElementById("refCorrespondenceCityId").value= sessionStorage.getItem("refCorrespondenceCityId");
//document.getElementById("pincode").value= sessionStorage.getItem("pincode");
//document.getElementById("correspondencePincode").value= sessionStorage.getItem("correspondencePincode");
//document.getElementById("contactNumber").value= sessionStorage.getItem("contactNumber");
//document.getElementById("alternateNumber").value= sessionStorage.getItem("alternateNumber");
//document.getElementById("mobile").value= sessionStorage.getItem("mobile");
//document.getElementById("alternateMobile").value= sessionStorage.getItem("alternateMobile");
//document.getElementById("email").value= sessionStorage.getItem("email");
//document.getElementById("website").value= sessionStorage.getItem("website");
//document.getElementById("dob").value= sessionStorage.getItem("dob");
//document.getElementById("tan").value= sessionStorage.getItem("tan");
//document.getElementById("pan").value= sessionStorage.getItem("pan");
//document.getElementById("adhaarNo").value= sessionStorage.getItem("adhaarNo");
//document.getElementById("barCouncilNo").value= sessionStorage.getItem("barCouncilNo");
//document.getElementById("barCouncilRefStateId").value= sessionStorage.getItem("barCouncilRefStateId");
//document.getElementById("refDocumentId").value= sessionStorage.getItem("refDocumentId");
//document.getElementById("documentDescription").value= sessionStorage.getItem("documentDescription");
//document.getElementById("disclaimer").value= sessionStorage.getItem("disclaimer");
//
///--///-/-/-/-/-/-/-/-/-/-///-//--//-/-//-/-/-/-/-/-/-/-/-/-/-/-
//sessionStorage.setItem("organisationName", document.getElementById("organisationName").value); 
//sessionStorage.setItem("adinfirstname", document.getElementById("adinfirstname").value); 
//sessionStorage.setItem("firstName", document.getElementById("firstName").value);
//sessionStorage.setItem("middleName", document.getElementById("middleName").value);
//sessionStorage.setItem("lastName", document.getElementById("lastName").value);
//sessionStorage.setItem("refOrganisationTypeId", document.getElementById("refOrganisationTypeId").value);
//sessionStorage.setItem("refOrganisationId", document.getElementById("refOrganisationId").value);
//sessionStorage.setItem("registrationCode", document.getElementById("registrationCode").value);
//sessionStorage.setItem("employeeDepartment", document.getElementById("employeeDepartment").value);
//sessionStorage.setItem("refDepartmentId", document.getElementById("refDepartmentId").value);
//sessionStorage.setItem("refDivisionId", document.getElementById("refDivisionId").value);
//sessionStorage.setItem("employeeCode", document.getElementById("employeeCode").value);
//sessionStorage.setItem("employeeDesignation", document.getElementById("employeeDesignation").value);
//sessionStorage.setItem("isLawFirm", document.getElementById("isLawFirm").value);
//sessionStorage.setItem("LawFirmName", document.getElementById("LawFirmName").value);
//sessionStorage.setItem("userId", document.getElementById("userId").value);
//sessionStorage.setItem("address", document.getElementById("address").value);
//sessionStorage.setItem("correspondenceAddress", document.getElementById("correspondenceAddress").value);
//sessionStorage.setItem("refStateId", document.getElementById("refStateId").value);
//sessionStorage.setItem("refCorrespondenceStateId", document.getElementById("refCorrespondenceStateId").value);
//sessionStorage.setItem("refCityId", document.getElementById("refCityId").value);
//sessionStorage.setItem("refCorrespondenceCityId", document.getElementById("refCorrespondenceCityId").value);
//sessionStorage.setItem("pincode", document.getElementById("pincode").value);
//sessionStorage.setItem("correspondencePincode", document.getElementById("correspondencePincode").value);
//sessionStorage.setItem("contactNumber", document.getElementById("contactNumber").value);
//sessionStorage.setItem("alternateNumber", document.getElementById("alternateNumber").value);
//sessionStorage.setItem("mobile", document.getElementById("mobile").value);
//sessionStorage.setItem("alternateMobile", document.getElementById("alternateMobile").value);
//sessionStorage.setItem("email", document.getElementById("email").value);
//sessionStorage.setItem("website", document.getElementById("website").value);
//sessionStorage.setItem("dob", document.getElementById("dob").value);
//sessionStorage.setItem("tan", document.getElementById("tan").value);
//sessionStorage.setItem("pan", document.getElementById("pan").value);
//sessionStorage.setItem("adhaarNo", document.getElementById("adhaarNo").value);
//sessionStorage.setItem("barCouncilNo", document.getElementById("barCouncilNo").value);
//sessionStorage.setItem("barCouncilRefStateId", document.getElementById("barCouncilRefStateId").value);
//sessionStorage.setItem("refDocumentId", document.getElementById("refDocumentId").value);
//sessionStorage.setItem("documentDescription", document.getElementById("documentDescription").value);
//sessionStorage.setItem("disclaimer", document.getElementById("disclaimer").value);
///--/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/
function seso(){
//	alert("first method");

	sessionStorage.setItem("userType", $('input:radio[name=userType]:checked').val());
	sessionStorage.setItem("adin", $('input:radio[name=adin]:checked').val());
	 sessionStorage.setItem("gender", $('input:radio[name=gender]:checked').val());
	 sessionStorage.setItem("organisationName", document.getElementById("organisationName").value); 
	 sessionStorage.setItem("adinfirstname", document.getElementById("adinfirstname").value); 
	 sessionStorage.setItem("firstName", document.getElementById("firstName").value);
	 sessionStorage.setItem("middleName", document.getElementById("middleName").value);
	 sessionStorage.setItem("lastName", document.getElementById("lastName").value);
	 sessionStorage.setItem("refOrganisationTypeId", document.getElementById("refOrganisationTypeId").value);
	 sessionStorage.setItem("refOrganisationId", document.getElementById("refOrganisationId").value);
	 sessionStorage.setItem("registrationCode", document.getElementById("registrationCode").value);
	 sessionStorage.setItem("employeeDepartment", document.getElementById("employeeDepartment").value);
	 sessionStorage.setItem("refDepartmentId", document.getElementById("refDepartmentId").value);
	 sessionStorage.setItem("refDivisionId", document.getElementById("refDivisionId").value);
	 sessionStorage.setItem("employeeCode", document.getElementById("employeeCode").value);
	 sessionStorage.setItem("employeeDesignation", document.getElementById("employeeDesignation").value);
	 sessionStorage.setItem("isLawFirm", document.getElementById("isLawFirm").value);
	 sessionStorage.setItem("LawFirmName", document.getElementById("LawFirmName").value);
	 sessionStorage.setItem("userId", document.getElementById("userId").value);
	 sessionStorage.setItem("address", document.getElementById("address").value);
	 sessionStorage.setItem("correspondenceAddress", document.getElementById("correspondenceAddress").value);
	 sessionStorage.setItem("refStateId", document.getElementById("refStateId").value);
	 sessionStorage.setItem("refCorrespondenceStateId", document.getElementById("refCorrespondenceStateId").value);
	 sessionStorage.setItem("refCityId", document.getElementById("refCityId").value);
	 sessionStorage.setItem("refCorrespondenceCityId", document.getElementById("refCorrespondenceCityId").value);
	 sessionStorage.setItem("pincode", document.getElementById("pincode").value);
	 sessionStorage.setItem("correspondencePincode", document.getElementById("correspondencePincode").value);
	 sessionStorage.setItem("contactNumber", document.getElementById("contactNumber").value);
	 sessionStorage.setItem("alternateNumber", document.getElementById("alternateNumber").value);
	 sessionStorage.setItem("mobile", document.getElementById("mobile").value);
	 sessionStorage.setItem("alternateMobile", document.getElementById("alternateMobile").value);
	 sessionStorage.setItem("email", document.getElementById("email").value);
	 sessionStorage.setItem("website", document.getElementById("website").value);
	 sessionStorage.setItem("dob", document.getElementById("dob").value);
	 sessionStorage.setItem("tan", document.getElementById("tan").value);
	 sessionStorage.setItem("pan", document.getElementById("pan").value);
	 sessionStorage.setItem("adhaarNo", document.getElementById("adhaarNo").value);
	 sessionStorage.setItem("barCouncilNo", document.getElementById("barCouncilNo").value);
	 sessionStorage.setItem("barCouncilRefStateId", document.getElementById("barCouncilRefStateId").value);
//	 sessionStorage.setItem("refDocumentId", document.getElementById("refDocumentId").value);
	 sessionStorage.setItem("documentDescription", document.getElementById("documentDescription").value);
	 sessionStorage.setItem("disclaimer", document.getElementById("disclaimer").value);
//	 sessionStorage.setItem("attachedDocument", document.getElementById("attachedDocument").value);
}
function sesoget(){
//	alert("second method");
	  document.getElementById("organisationName").value = sessionStorage.getItem("organisationName");
	  document.getElementById("adinfirstname").value= sessionStorage.getItem("adinfirstname");
	  document.getElementById("firstName").value= sessionStorage.getItem("firstName");
	  document.getElementById("middleName").value= sessionStorage.getItem("middleName");
	  document.getElementById("lastName").value= sessionStorage.getItem("lastName");
	  document.getElementById("refOrganisationTypeId").value= sessionStorage.getItem("refOrganisationTypeId");
	  document.getElementById("refOrganisationId").value= sessionStorage.getItem("refOrganisationId");
	  document.getElementById("registrationCode").value= sessionStorage.getItem("registrationCode");
	  document.getElementById("employeeDepartment").value= sessionStorage.getItem("employeeDepartment");
	  document.getElementById("refDepartmentId").value= sessionStorage.getItem("refDepartmentId");
	  document.getElementById("refDivisionId").value= sessionStorage.getItem("refDivisionId");
	  document.getElementById("employeeCode").value= sessionStorage.getItem("employeeCode");
	  document.getElementById("employeeDesignation").value= sessionStorage.getItem("employeeDesignation");
	  document.getElementById("isLawFirm").value= sessionStorage.getItem("isLawFirm");
	  document.getElementById("LawFirmName").value= sessionStorage.getItem("LawFirmName");
	  document.getElementById("userId").value= sessionStorage.getItem("userId");
	  document.getElementById("address").value= sessionStorage.getItem("address");
	  document.getElementById("correspondenceAddress").value= sessionStorage.getItem("correspondenceAddress");
	  document.getElementById("refStateId").value= sessionStorage.getItem("refStateId");
	  document.getElementById("refCorrespondenceStateId").value= sessionStorage.getItem("refCorrespondenceStateId");
	  document.getElementById("refCityId").value= sessionStorage.getItem("refCityId");
	  document.getElementById("refCorrespondenceCityId").value= sessionStorage.getItem("refCorrespondenceCityId");
	  document.getElementById("pincode").value= sessionStorage.getItem("pincode");
	  document.getElementById("correspondencePincode").value= sessionStorage.getItem("correspondencePincode");
	  document.getElementById("contactNumber").value= sessionStorage.getItem("contactNumber");
	  document.getElementById("alternateNumber").value= sessionStorage.getItem("alternateNumber");
	  document.getElementById("mobile").value= sessionStorage.getItem("mobile");
	  document.getElementById("alternateMobile").value= sessionStorage.getItem("alternateMobile");
	  document.getElementById("email").value= sessionStorage.getItem("email");
	  document.getElementById("website").value= sessionStorage.getItem("website");
	  document.getElementById("dob").value= sessionStorage.getItem("dob");
	  document.getElementById("tan").value= sessionStorage.getItem("tan");
	  document.getElementById("pan").value= sessionStorage.getItem("pan");
	  document.getElementById("adhaarNo").value= sessionStorage.getItem("adhaarNo");
	  document.getElementById("barCouncilNo").value= sessionStorage.getItem("barCouncilNo");
	  document.getElementById("barCouncilRefStateId").value= sessionStorage.getItem("barCouncilRefStateId");
//	  document.getElementById("refDocumentId").value= sessionStorage.getItem("refDocumentId");
	  document.getElementById("documentDescription").value= sessionStorage.getItem("documentDescription");
	  document.getElementById("disclaimer").value= sessionStorage.getItem("disclaimer");
	  $("input:radio[name=userType]").val([sessionStorage.getItem("userType")]);
	  $("input:radio[name=adin]").val([sessionStorage.getItem("adin")]);
	  $("input:radio[name=gender]").val([sessionStorage.getItem("gender")]);
	  
//	  document.getElementById("attachedDocument").value= sessionStorage.getItem("attachedDocument");

}

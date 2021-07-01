<%@ page import="com.nic.cerc.pojo.registration.RefCity" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script src="js/inputFieldValidationFilter.js"></script>
<script src="js/registration.js"></script>
<script src="js/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

	var date = new Date();
	var cd = date.getDate();
	var cm = date.getMonth() + 1;
	var cy = date.getFullYear();	

	var refStateId = $('#refStateId').val();
	$("#refCityId").get(0).options.length = 0;
	$("#refCorrespondenceCityId").get(0).options.length = 0;
		$.ajax({
    	    url: "loadCities",
            data : {
            	refStateId:refStateId,
            	refCityList:"",
            },
            dataType: "json",
            type: 'POST',
            success: function(refCityList) {
            	 $.each(refCityList, function (id, refCity) {
            		 $.each(refCity, function(id,cityName){
	            		 $("#refCityId").get(0).options[$("#refCityId").get(0).options.length] = new Option(cityName.cityName,cityName.id);
            		 });
                }); 
            },
             error: function() {
            	 alert("Failed to load cities");
            }
        });
		
		refStateId = $('#refCorrespondenceStateId').val();
		  $.ajax({
	    	    url: "loadCities",
	            data : {
	            	refStateId:refStateId,
	            	refCityList:"",
	            },
	            dataType: "json",
	            type: 'POST',
	            success: function(refCityList) {
	            	 $.each(refCityList, function (id, refCity) {
	            		 $.each(refCity, function(id,cityName){
		            		 $("#refCorrespondenceCityId").get(0).options[$("#refCorrespondenceCityId").get(0).options.length] = new Option(cityName.cityName,cityName.id);
	            		 });
	                }); 
	            },
	             error: function() {
	            	 alert("Failed to load cities");
	            }
	        });
		
	if ($('input:radio[name=userType]:checked').val() == "I") {
		$("#landlineRequired").hide();
	}
	
	else if ($('input:radio[name=userType]:checked').val() == "E") {
		$("#landlineRequired").hide();
		$("#desg").show();
		$("#desg2").show();
		$("#desg3").show();
	}
	
	else if ($('input:radio[name=userType]:checked').val() == "O") {
		$("#landlineRequired").show();
		$("#desg").hide();
		$("#desg2").hide();
		$("#desg3").hide();
	}
	
	$('#savebutton').click(function(){
		
		var dob = $('#dob').val();
		var dobSplit = dob.split("/");
		var dd = dobSplit[0];
		var mm = dobSplit[1];
		var yyyy = dobSplit[2];
		
		var sEmail = $('#email').val();	
		var vPan=$('#pan').val();
		var vTan=$('#tan').val();
		
		$('input:submit').attr("disabled", true);
		if($('input[name="userType"]:checked').val()=="I")
		{
			if($('#firstName').val()=="")
			{
				alert("Please enter first name");
				$('#firstName').focus();
				$('input:submit').attr("disabled", false);
				return false;    					
			}
			
			else if($('#lastName').val()=="")
			{
				alert("Please enter last name");
				$('#lastName').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
			
			else if ($('#address').val()=="")
			{
				alert("Please enter address");
				$('#address').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		else if ($('#refStateId').val()=="")
			{
				alert("please select state");
				$('#refStateId').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		else if ($('#refCityId').val()=="")
			{
				alert("Please select city");
				$('#refCityId').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    			
    		else if ($('#pincode').val()=="" || $('#pincode').val().length<6)
			{
    			alert("Please enter 6 digit pin");
				$('#pincode').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}

    		else if ($('#correspondenceAddress').val()=="")
			{
				alert("Please enter correspondence address");
				$('#correspondenceAddress').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		
    		else if ($('#refCorrespondenceStateId').val()=="")
			{
				alert("Please enter correspondence State");
				$('#refCorrespondenceStateId').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		
    		else if ($('#refCorrespondenceCityId').val()=="")
			{
				alert("Please enter correspondence city");
				$('#refCorrespondenceCityId').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		
    		else if ($('#correspondencePincode').val()=="" || $('#correspondencePincode').val().length<6)
			{
    			alert("Please enter 6 digit correspondence pin");
				$('#correspondencePincode').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
		
			else if($('#dob').val()=="")
			{
				alert("Please enter DOB");
				$('#dob').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
			
			else if ($('#alternateNumber').val()!="" && $('#alternateNumber').val().length<11)
			{
				alert("Alternate number should be of 11 digits with STD Code.");
				$('#alternateNumber').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
			
    		else if ($('#mobile').val()=="" || $('#mobile').val().length<10)
			{
				alert("Please enter valid 10 digit mobile number ");
				$('#mobile').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		
    		else if ($.trim(sEmail).length==0)
    		{
    			alert('Please enter valid email address');
    			$('#email').focus();
    			$('input:submit').attr("disabled", false);
    			return false;
    		}
    		
    		else if(!validateEmail(sEmail))
    		{
    			alert('Entered Email Address is Invalid ');
    			$('input:submit').attr("disabled", false);
    			return false;
    		}

			else if((yyyy > cy) || (yyyy == cy && mm > cm) || (yyyy == cy && mm == cm && dd > cd))
			{
				alert("DOB cannot be future date.")
				$('#dob').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
			
			else if(!validatePan(vPan)) 
		    {
		    	alert("Invalid PAN");
		    	$('#pan').focus();
		    	$('input:submit').attr("disabled", false);
		    	return false;
		    }
				
			else
        	{
       			document.editUserProfile.action="editUserProfileSave";
     			document.editUserProfile.submit();
        	}
			
		}
		
		if($('input[name="userType"]:checked').val()=="E")
		{
			if($('#firstName').val()=="")
			{
				alert("Please enter first name");
				$('#firstName').focus();
				$('input:submit').attr("disabled", false);
					return false;    					
			}
			
			else if($('#lastName').val()=="")
			{
				alert("Please enter last name");
				$('#lastName').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
			
			else if ($('#registrationCode').val()=="")
			{
				alert("Please enter security code.");
				$('#registrationCode').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
				
    		else if ($('#address').val()=="")
			{
				alert("Please enter address");
				$('#address').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		else if ($('#refStateId').val()=="")
			{
				alert("please select state");
				$('#refStateId').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		else if ($('#refCityId').val()=="")
			{
				alert("Please select city");
				$('#refCityId').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    			
    		else if ($('#pincode').val()=="" || $('#pincode').val().length<6)
			{
    			alert("Please enter 6 digit pin");
				$('#pincode').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		else if ($('#correspondenceAddress').val()=="")
			{
				alert("Please enter correspondence address");
				$('#correspondenceAddress').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		else if ($('#refCorrespondenceStateId').val()=="")
			{
				alert("Please enter correspondence State");
				$('#refCorrespondenceStateId').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		else if ($('#refCorrespondenceCityId').val()=="")
			{
				alert("Please enter correspondence city");
				$('#refCorrespondenceCityId').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		else if ($('#correspondencePincode').val()=="" || $('#correspondencePincode').val().length<6)
			{
    			alert("Please enter 6 digit correspondence pin");
				$('#correspondencePincode').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		
    		else if ($('#alternateNumber').val()!="" && $('#alternateNumber').val().length<11)
			{
				alert("Alternate number should be of 11 digits with STD Code.");
				$('#alternateNumber').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
			
    		else if ($('#mobile').val()=="" || $('#mobile').val().length<10)
			{
				alert("Please enter valid 10 digit mobile number ");
				$('#mobile').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		else if ($.trim(sEmail).length==0)
    		{  			
    			alert('Please enter valid email address');
    			$('#email').focus();
    			$('input:submit').attr("disabled", false);
    			return false;
    		}
    		else if(!validateEmail(sEmail))
    		{
    			alert('Entered Email Address is Invalid ');
    			$('input:submit').attr("disabled", false);
       			return false;
       		}
			
			else if ($('#refOrganisationId').val()=="")
			{
				alert("Please select organisation.");
				$('#refOrganisationId').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}	
			else if ($('#registrationCode').val()=="")
			{
				alert("Please enter security code.");
				$('#registrationCode').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
			else if($('#employeeDepartment').val()=="" && $('#refDepartmentId').val()=="")
			{
				alert("Please enter department.");
				$('#employeeDepartment').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
			else if($('#employeeDepartment').val()=="" && ($('#refDepartmentId').val()==""|| $('#refDivisionId').val()==""))
			{
				alert("Please enter Division.");
				$('#refDivisionId').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
			else if($('#employeeCode').val()=="")
			{
				alert("Please enter employee code.");
				$('#employeeCode').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
			else if($('#employeeDesignation').val()=="")
			{
				alert("Please enter designation.");
				$('#employeeDesignation').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
			else if(!validatePan(vPan)) 
		    {
		    	alert("Invalid PAN");	
		    	$('#pan').focus();
		    	$('input:submit').attr("disabled", false);
		    	return false;
		    }

			if($('#dob').val()=="")
			{
				alert("Please enter DOB");
				$('#dob').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
			
			else
        	{
       			document.editUserProfile.action="editUserProfileSave";
    			document.editUserProfile.submit();
        	}
			
		}
				
		if($('input[name="userType"]:checked').val()=="O")
		{
			if($('#firstName').val()=="")
			{
				alert("Plese enter organisation name");
				$('#firstName').focus();
				$('input:submit').attr("disabled", false);
				return false;  
			}
		
			else if($('#lastName').val()=="")
			{
				alert("Plese enter short name");
				$('#lastName').focus();
				$('input:submit').attr("disabled", false);
					return false;
			}
			
			else if ($('#address').val()=="")
			{
				alert("Please enter address");
				$('#address').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		
			else if ($('#refStateId').val()=="")
			{
				alert("please select state");
				$('#refStateId').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		
			else if ($('#refCityId').val()=="")
			{
				alert("Please select city");
				$('#refCityId').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    			
    		else if ($('#pincode').val()=="" || $('#pincode').val().length<6)
			{
    			alert("Please enter 6 digit pin");	
				$('#pincode').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		else if ($('#correspondenceAddress').val()=="")
			{
				alert("Please enter correspondence address");
				$('#correspondenceAddress').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		else if ($('#refCorrespondenceStateId').val()=="")
			{
				alert("Please enter correspondence State");
				$('#refCorrespondenceStateId').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		else if ($('#refCorrespondenceCityId').val()=="")
			{
				alert("Please enter correspondence city");
				$('#refCorrespondenceCityId').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		else if ($('#correspondencePincode').val()=="" || $('#correspondencePincode').val().length<6)
			{
    			alert("Please enter 6 digit correspondence pin");
				$('#correspondencePincode').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		
    		else if ($('#alternateNumber').val()!="" && $('#alternateNumber').val().length<11)
			{
				alert("Alternate number should be of 11 digits with STD Code.");
				$('#alternateNumber').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
			
    		else if ($('#mobile').val()=="" || $('#mobile').val().length<10)
			{
				alert("Please enter valid 10 digit mobile number ");
				$('#mobile').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
    		
    		else if ($.trim(sEmail).length==0)
    		{ 			
    			alert('Please enter valid email address');
    			$('#email').focus();
    			$('input:submit').attr("disabled", false);
    			return false;
    		}
    		else if(!validateEmail(sEmail))
    		{
    			alert('Entered Email Address is Invalid ');
    			$('input:submit').attr("disabled", false);
       			return false;
       		}
			
			else if(!validateTan(vTan)) 
	    	{
	    		alert("Invalid GSTN");	
	    		$('#tan').focus();
	    		$('input:submit').attr("disabled", false);
	    		return false;			    	
	    	}	
			else if($('#employeeCode').val()=="")
			{
				alert("Please enter employee code.");
				$('#employeeCode').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
		
			else if ($('#refOrganisationTypeId').val()=="")
			{
				alert("Please select organisation type.");
				$('#refOrganisationTypeId').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
	
			else if ($('#contactNumber').val()=="" || $('#contactNumber').val().length<11)
			{
				alert("Enter number with STD code. \nLandline number is either blank or not valid");
				$('#contactNumber').focus();
				$('input:submit').attr("disabled", false);
				return false;
			}
			
			else
        	{
       			document.editUserProfile.action="editUserProfileSave";
    			document.editUserProfile.submit();
        	}
			
			
		}
	});
	
	$('select[name="refStateId.id"]').change(function () {
		$("#refCityId").get(0).options.length = 0;
        $("#refCityId").get(0).options[0] = new Option("- Select -", "");
	     var refStateId = $(this).val();
	     $.ajax({
	    	    url: "loadCities",
	            data : {
	            	refStateId:refStateId,
	            	refCityList:"",
	            },
	            dataType: "json",
	            type: 'POST',
	            success: function(refCityList) {
	            	 $.each(refCityList, function (id, refCity) {
	            		 $.each(refCity, function(id,cityName){
		            		 $("#refCityId").get(0).options[$("#refCityId").get(0).options.length] = new Option(cityName.cityName,cityName.id);
	            		 });
	                }); 
	            },
	             error: function() {
	            	 alert("Failed to load cities");
	            }
	        });
	});
	
	
	$('select[name="refCorrespondenceStateId.id"]').change(function () {
		$("#refCorrespondenceCityId").get(0).options.length = 0;
        $("#refCorrespondenceCityId").get(0).options[0] = new Option("- Select -", "");
	     var refStateId = $(this).val();
	     $.ajax({
	    	    url: "loadCities",
	            data : {
	            	refStateId:refStateId,
	            	refCityList:"",
	            },
	            dataType: "json",
	            type: 'POST',
	            success: function(refCityList) {
	            	 $.each(refCityList, function (id, refCity) {
	            		 $.each(refCity, function(id,cityName){
		            		 $("#refCorrespondenceCityId").get(0).options[$("#refCorrespondenceCityId").get(0).options.length] = new Option(cityName.cityName,cityName.id);
	            		 });
	                }); 
	            },
	             error: function() {
	            	 alert("Failed to load cities");
	            }
	        });
	});

	
	
	
});

function validateEmail(sEmail)
{
	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if (filter.test(sEmail)) {
		return true;
	}
	else {
		return false;
	}
}
	
function validatePan(vPan)
{
	var filter = /([A-Za-z]){5}\d{4}([A-Za-z]){1}$/;
	if (filter.test(vPan)) 
	{
		return true;
	}
	else {
		return false;
	}
}

/* function validateTan(vTan)
{
	var filter = /[0-3][1-5]([A-Za-z]){5}([0-9]){4}[A-Za-z][1-9][zZ][a-zA-Z0-9]$/;

	if (filter.test(vTan)) 
	{
		return true;
	}
	else {
		return false;
	} */
}
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
<s:form theme="simple" name="editUserProfile" id="editUserProfile" action="editUserProfileSave" method="post">
<s:hidden id="userList" name="userList"/>
<s:hidden name="cercUserId" value="%{id}"/>
<%-- <s:hidden name="refOrganisationId.id" value="%{refOrganisationId.id}"/> --%>
<s:hidden name="userId"/>
	<table border = "0">
		<tr><th colspan="7" class="mainheading">Edit User Profile</th></tr>
		<s:if test='refOrganisationId!=null and refOrganisationId==1 and userType=="E"'></s:if>
		<s:else>
		 <tr>
			<td colspan="7">
<%-- 			<s:radio list="#{'O':'Organization','A':'Advocate','I':'Individual','E':'Employee (of already Registered Organization)'}" name="userType" id="userType" theme="simple"/> --%>
			<s:radio list="#{'O':'Organization','I':'Any Person/Individual','E':'Employee (of already Registered Organization)'}" name="userType" id="userType" theme="simple" disabled="true"/>
			</td>
		</tr>
		</s:else>
		<tr>
			<td class="organization" width="20%">Organisation Name<span class="required">*</span></td>
			<td class="advocateOrIndividualOrEmployee" width="20%">First Name<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"><s:textfield type="text" size="24" name="firstName" id="firstName" maxlength="160"/></td>
			<td width="2%"></td>
			<td class="advocateOrIndividualOrEmployee" width="20%">Middle Name</td>
			<td class="advocateOrIndividualOrEmployee" width="1%">:</td>
			<td class="advocateOrIndividualOrEmployee" width="28%"><s:textfield type="text" size="24" name="middleName" id="middleName" maxlength="40"/></td>
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
			<td>
			<s:select list="refOrgnisationTypeList" listKey="id" listValue="organisationType" name="refOrganisationTypeId.id" id="refOrganisationTypeId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:142pt"/>
			</td>
<!-- 			<td></td> -->
<%-- 			<td>Region<span class="required">*</span></td> --%>
<!-- 			<td>:</td> -->
<!-- 			<td> -->
			<%-- <s:select list="refRegionList" name="refOrganisationId.refRegionId.id" id="refRegionId" listKey="id" listValue="regionCode+'  '+region" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/> --%>
<%-- 			<s:property value="refOrganisationId.refRegionId.region"/> --%>
<!-- 			</td> -->
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
			<td colspan="3"><s:password type="password" size="24" name="registrationCode" id="registrationCode"/>&nbsp;<span class="tooltip">As provided by your organisation administrator. </span></td>
			
		</tr>
<!-- 		<tr class="organization"> -->
<%-- 			<td>Administrator Name<span class="required">*</span></td> --%>
<!-- 			<td>:</td> -->
<%-- 			<td colspan="5"><s:textfield type="text" size="24" name="contactPerson" id="contactPerson" maxlength="80"/></td>	 --%>
<!-- 		</tr> -->
		<tr class="employeeOther">
			<td>Department<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:textfield type="text" size="24" name="employeeDepartment" id="employeeDepartment" maxlength="80"/></td>	
		</tr> 
		
		<tr class="employeeCerc">
			<td>Department<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:select list="refDepartmentList" listKey="id" listValue="departmentDescription" name="refDepartmentId.id" id="refDepartmentId" headerKey="" headerValue="- Select -"/>	
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Division<span class="required">*</span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			:&nbsp;&nbsp;
			<s:select list="refDivisionList" listKey="id" listValue="divisionName" name="refDivisionId.id" id="refDivisionId" headerKey="" headerValue="- Select -"/>
			</td>
		</tr> 
		<tr class="employee">
			<td>Employee Code<span class="required">*</span></td>
			<td>:</td>
				<td><s:textfield type="text" size="24" name="employeeCode" id="employeeCode" maxlength="8"/></td>
			<td></td>
			<td id = "desg">Designation<span class="required">*</span></td>
			<td id = "desg2">:</td>
			<td id = "desg3"><s:textfield type="text" size="24" name="employeeDesignation" id="employeeDesignation" maxlength="80"/></td>
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
			<td>Login ID<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:property value="userId"/></td>	
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
		<tr class="subheading">
			<td colspan="7">Communication Details</td>	
		</tr>
		<tr valign="top" align="left">
			<td>Landline Number<span class="required" id ="landlineRequired">*</span></td>
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
			<td><s:textfield type="text" size="24" name="mobile" id="mobile" maxlength="10"/><br><span id="mobileerrmsg" class="tooltip"></span></td>
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
			<td class="organization"></td>
			<td class="organization"></td>
			<td class="organization"></td>	
		</tr>
		<tr class="subheading">
			<td colspan="7">Other Details</td>	
		</tr>
		<tr class="advocateOrIndividualOrEmployee">
<!-- 			<td>Father's Name</td> -->
<!-- 			<td>:</td> -->
<%-- 			<td><s:textfield type="text" size="24" name="fatherName" id="fatherName" maxlength="80"/></td> --%>
<!-- 			<td></td> -->
			<td>Date of Birth<span class="required">*</span></td>
			<td>:</td>
			<td>
				<div>
					<s:date name="dob" format="dd/MM/yyyy" var="dob"/>
					<s:textfield type="text" name="dob"  id="dob" class="tcal" value="%{#dob}" size="21"/><br/><span class="tooltip">(dd/mm/yyyy)</span>
				</div>
			</td>
		</tr>
		<tr class="advocateOrIndividualOrEmployee">
			<td>Gender<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
			<s:radio list="#{'M':'Male','F':'Female'}" name="gender" theme="simple" value="'M'"/>
			</td>	
		</tr>
		<tr>
			<td class="organization">GSTN Number<span class="required">*</span></td>
			<td class="advocateOrIndividualOrEmployee">PAN<span class="required">*</span></td>
			<td>:</td>
			<td class="organization"><s:textfield type="text" size="24" name="tan" id="tan" maxlength="15"/></td>
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
 		<tr><td colspan="7"></td></tr>
		<tr><td colspan="7" align="right">
		<input type="submit" id="savebutton" name="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp;
		<s:submit type="submit" id="searchbutton" value="Cancel" class="formbutton" action="viewUserProfile"/>
		</td></tr>
	</table>
	<s:token/>
</s:form>
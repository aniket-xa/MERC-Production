function cancelAction(){
	document.newUserRegistration.action="home";
	document.newUserRegistration.submit();
}
function checkDuplicate()
{
	var fUploadName=document.getElementsByName("fileUploadName");
	var ut = $('input:radio[name=userType]:checked').val();
//	if(fUploadName[0].value!="1" && ut=="O"){
//		alert("First Document must be Board/Company Authorizing Letter");
//		document.getElementById("refDocumentId").value="";
//		//return false;
//	}
	var results=[];
	var names=[];
	for(i=0;i<fUploadName.length;i++)
		{
				names.push(fUploadName[i].value);
		}
	
	var sorted_fUploadName=names.sort();
	
	for(var i=0;i<fUploadName.length;i++)
	{
		
		if(sorted_fUploadName[i+1]==sorted_fUploadName[i])
			{
			results.push(sorted_fUploadName[i]);
			if(results.length>0)
			{
				alert ("Duplicate document type found in attachements.");
			
			return false;
			}
			}
	}
	
}
	$(document).ready(function() {
		
		var crDt=currentDate();
		
		
     	if ($('input:radio[name=userType]:checked').val() == "A") {
	    		userTypeSelected="A";
				$(".advocate").show();
		        $(".advocateOrIndividualOrEmployee").show();
		        $(".individual").hide();
		 		$(".isEmpanneledOrEmployee").hide();
		 		$(".employee").hide();
		 		$(".employeeOther").hide();
		 		$(".employeeCerc").hide();
		 		$(".empanneledAdvocate").show();     			 
		 		$(".organization").hide();  
		 		$('#employeeDepartment').val("");
	        	$('#employeeCode').val("");
	        	$('#employeeDesignation').val("");
	        	$(".aadhar").show();
	        }
	        else if ($('input:radio[name=userType]:checked').val() == "I") {
	        	userTypeSelected="I";
	        	$(".individual").show();
	        	$(".father").hide();
	        	//$(".desg").hide();
	        	$(".advocateOrIndividualOrEmployee").show();
	        	$(".advocate").hide();                
	 			$(".isEmpanneledOrEmployee").hide();
	 			$(".employee").hide();
	 			$(".employeeOther").hide();
		 		$(".employeeCerc").hide();
		 		$(".empanneledAdvocate").hide();     			 
	 			$(".organization").hide();
	 			$(".isEmpanneledAdvocateIsLawFirm").hide();
	 			$('#employeeDepartment').val("");
	        	$('#employeeCode').val("");
	        	$('#employeeDesignation').val("");
	        	$('#LawFirmName').val("");
	        	$("#isLawFirm").prop( "checked", false );
	    		$("#isEmpanelled").prop( "checked", false );
	    		$(".aadhar").show();
	 		}
	        else if ($('input:radio[name=userType]:checked').val() == "O") {
	        	userTypeSelected="O";
	        	$(".desg").hide();
	        	$(".reg").hide();
	        	$(".organization").show();
	            $(".advocate").hide();
	            $(".individual").hide();
	 			$(".isEmpanneledOrEmployee").hide();
	 			$(".employee").show();
	 			$(".employeeOther").hide();
		 		$(".employeeCerc").hide();
		 		$(".empanneledAdvocate").hide();
		 		$(".father").hide();
	 			$(".advocateOrIndividualOrEmployee").hide();
	 			$(".isEmpanneledAdvocateIsLawFirm").hide();
	 			
	 			$('#employeeDepartment').val("");
//	        	$('#employeeCode').val("");
	        	$('#employeeDesignation').val("");
	        	$('#LawFirmName').val("");
	    		$("#isLawFirm").prop( "checked", false );
	    		$("#isEmpanelled").prop( "checked", false );
	    		//$('#firstName').val("");
	    		//$('#lastName').val("");	
	    	} 
	        else if ($('input:radio[name=userType]:checked').val() == "E") {
	        	userTypeSelected="E";
	        	$(".employee").show();
	        	$(".desg").show();
	        	if($('#refOrganisationId').val()==1)
	        	{
	        		$(".employeeOther").hide();
		 			$(".employeeCerc").show();
	        	}
	        	else
	        	{
	        		$(".employeeOther").show();
			 		$(".employeeCerc").hide();	
	        	}
	        	$(".father").show();
	        	
		 		$(".advocateOrIndividualOrEmployee").show();
	        	$(".isEmpanneledOrEmployee").show();
	        	$(".advocate").hide();
	        	$(".empanneledAdvocate").hide();     			 
	 			$(".organization").hide();
	 			$(".isEmpanneledAdvocateIsLawFirm").hide();
	 			$('#LawFirmName').val("");
	    		$("#isLawFirm").prop( "checked", false );
	    		$("#isEmpanelled").prop( "checked", false );	
	    		$(".aadhar").show();
	    	}
	        else{
	        	userTypeSelected = "O";
	        	$('input:radio[name=userType][value="O"]').click();
	        	$(".desg").hide();
	        	$(".reg").hide();
	        	$(".advocate").hide();
	    		$(".individual").hide();
	    		$(".isEmpanneledOrEmployee").hide();
	    		$(".employee").show();
	    		$(".employeeOther").hide();
		 		$(".employeeCerc").hide();
		 		$(".empanneledAdvocate").hide();
	    		$(".isEmpanneledAdvocateIsLawFirm").hide();
	    		$(".father").hide();
	    		$(".advocateOrIndividualOrEmployee").hide();
	    		$('#employeeDepartment').val("");
//	    	    $('#employeeCode').val("");
	    	    $('#employeeDesignation').val("");
	    	    $('#LawFirmName').val("");
	    	    $(".delete").hide();
	    	    $(".aadhar").hide();
	        }
	    
     	$('select[name="refOrganisationId.id"]').change(function () {
     		if($(this).val()==1){
     		$(".employeeOther").hide();
	 		$(".employeeCerc").show();
     		}
     		else{
     			$(".employeeOther").show();
    	 		$(".employeeCerc").hide();
     		}
     	});
 		
	    
	    $("#refDocumentId").get(0).options.length = 0;
    	$("#refDocumentId").get(0).options[0] = new Option("- Select -", "");
     
    	$.ajax({
    	    url: "loadRefDocument",
            data : {
            	userType:userTypeSelected,
            	refDocumentList:"",
            },
            dataType: "json",
            type: 'POST',
            success: function(refDocumentList) {
            	 $.each(refDocumentList, function (id, refDocument) {
            		 $.each(refDocument, function(id,documentName){
            			 $("#refDocumentId").get(0).options[$("#refDocumentId").get(0).options.length] = new Option(documentName.documentName,documentName.id);
            		 });
                }); 
            },
             error: function() {
            	 alert("Failed to load Documents");
            }
        });
     

	    
	    
	    $("#userId").on('keypress', function (e){
	    	if (e.which == 32) 
	        {
	    		e.preventDefault(); 
        	}
	    });

	    $("#userId").on('blur', function (){
	    	var uList = $('input[name="userList"]').val().replace("[","").replace("]","").split(",");
	    	$.each(uList, function (id, loginId) {
	    		 if(loginId.trim()==$('#userId').val() && $('#userId').val()!=""){
			    	alert(" Login ID "+$('#userId').val()+" already exists in database");
			    	$('#userId').val("");
			    	return false;
			    } 
	    	});
	    });
	    
	    $("#pincode").on('keypress', function (e){
	    //alert("1 :"+e.keyCode);
	    	if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57)) 
	        {
	    		//alert(e.which);
	        
	        	$("#pincodeerrmsg").html("Digits Only").hide();
                return true;
    		}
	    	/* else if (e.which >= 48 && e.which <= 57)
	        {
	        	$("#pincodeerrmsg").html("Digits Only").hide();
	            return true;	
	        } */
    		else 
    		{
    			//alert(e.which);
    			$("#pincodeerrmsg").html("Digits Only").show();
    			//$('#pincode').val("");
    			//return false; 
    			e.preventDefault(); 
    		}
	    });
	    $("#correspondencePincode").on('keypress',function (e) 
	    {
	    	if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57))
	    	{
	    		$("#correspondencePincodeerrmsg").html("Digits Only").hide();
	    	    return true;
	    	}
	    	        
	    	        else
	    	        {
	    	        	$("#correspondencePincodeerrmsg").html("Digits Only").show();
	    	        	e.preventDefault();
	    	        }
	    });
	    $("#contactNumber").on('keypress',function (e) 
	    	    {
	    	        //if the letter is not digit then display error and don't type anything
	    	        if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57))
	    	        {
	    	           //display error message
	    	        	$("#contactNumbererrmsg").html("Digits Only").hide();
	    	            return true;
	    	       	}
	    	        else
	    	        {
	    	        	$("#contactNumbererrmsg").html("Digits Only").show();
	    	        	e.preventDefault();
	    	            
	    	        }
	  });
	    	
	    	    $("#alternateNumber").on('keypress',function (e) 
	    	    {
	    	    	if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57))
	    	        {
	    	           	$("#alternateNumbererrmsg").html("Digits Only").hide();
	    	            return true;
	    	       	}
	    	        else
	    	        {
	    	        	$("#alternateNumbererrmsg").html("Digits Only").show();
	    	        	e.preventDefault();
	    	            
	    	        }
	    	      });
	    	    $("#mobile").on('keypress',function (e) 
	    	    {
	    	        //if the letter is not digit then display error and don't type anything
	    	    	if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57))
	    	       	{
	    	           	$("#mobileerrmsg").html("Digits Only").hide();
	    	            return true;
	    	       	}
	    	       	else
	    	        {
	    	        	$("#mobileerrmsg").html("Digits Only").show();
	    	        	e.preventDefault();
	    	            
	    	        }
	    	      });
	    	    $("#alternateMobile").on('keypress',function (e) {
	    	    	if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57))
	    	        {
	    	           //display error message
	    	        	$("#alternateMobileerrmsg").html("Digits Only").hide();
	    	            return true;
	    	       	}
	    	        else
	    	        {
	    	        	$("#alternateMobileerrmsg").html("Digits Only").show();
	    	        	e.preventDefault();
	    	            
	    	        }
	    	      });
		
	    
		$('input[name="userType"]').change(function () {
			if ($(this).val() == "A") {
				$(".advocate").show();
				
		        $(".advocateOrIndividualOrEmployee").show();
		        $(".individual").hide();
		 		$(".isEmpanneledOrEmployee").hide();
		 		$(".employee").hide();
		 		$(".employeeOther").hide();
		 		$(".employeeCerc").hide();
		 		$(".empanneledAdvocate").show();     			 
		 		$(".organization").hide();  
		 		$('#employeeDepartment').val("");
	        	$('#employeeCode').val("");
	        	$('#employeeDesignation').val("");
	        	$(".isEmpanneledAdvocateIsLawFirm").hide();
	        	$(".aadhar").show();
	        }
	        else if ($(this).val() == "I") {
	        	$(".individual").show();
	        	$(".father").hide();
	        	$(".desg").hide();
	        	$(".advocateOrIndividualOrEmployee").show();
	        	$(".advocate").hide();                
	 			$(".isEmpanneledOrEmployee").hide();
	 			$(".employee").hide();
	 			$(".employeeOther").hide();
		 		$(".employeeCerc").hide();
		 		$(".empanneledAdvocate").hide();     		
		 		$("#landlineRequired").hide();
	 			$(".organization").hide();
	 			$(".isEmpanneledAdvocateIsLawFirm").hide();
	 			$('#employeeDepartment').val("");
	        	$('#employeeCode').val("");
	        	$('#employeeDesignation').val("");
	        	$('#LawFirmName').val("");
	        	$("#isLawFirm").prop( "checked", false );
	    		$("#isEmpanelled").prop( "checked", false );
	    		$(".aadhar").show();
	 		}
	        else if ($(this).val() == "O") {
	            $(".organization").show();
	            $(".desg").hide();
	            $(".reg").hide();
	            $(".advocate").hide();
	            $(".individual").hide();
	 			$(".isEmpanneledOrEmployee").hide();
	 			$(".employee").show();
	 			$(".employeeOther").hide();
	 			$("#landlineRequired").show();
		 		$(".employeeCerc").hide();
		 		$(".empanneledAdvocate").hide();
		 		$(".father").hide();
	 			$(".advocateOrIndividualOrEmployee").hide();
	 			$('#employeeDepartment').val("");
//	        	$('#employeeCode').val("");
	        	$('#employeeDesignation').val("");
	        	$('#LawFirmName').val("");
	    		$("#isLawFirm").prop( "checked", false );
	    		$("#isEmpanelled").prop( "checked", false );
	    		//$('#firstName').val("");
	    		//$('#lastName').val("");	
	    		$(".aadhar").hide();
	    	} 
	        else if ($(this).val() == "E") {
	        	$(".employee").show();
	        	$(".desg").show();
	        	$(".employeeOther").show();
		 		$(".employeeCerc").hide();
		 		$(".father").show();
		 		$(".advocateOrIndividualOrEmployee").show();
		 		$("#landlineRequired").show();
	        	$(".isEmpanneledOrEmployee").show();
	        	$(".advocate").hide();
	        	$(".empanneledAdvocate").hide();     			 
	 			$(".organization").hide();
	 			$(".isEmpanneledAdvocateIsLawFirm").hide();
	 			$('#refOrganisationId').val("");
	 			$('#LawFirmName').val("");
	    		$("#isLawFirm").prop( "checked", false );
	    		$("#isEmpanelled").prop( "checked", false );	
	    		$(".aadhar").show();
	    	} 
			
			$("#refDocumentId").get(0).options.length = 0;
	        $("#refDocumentId").get(0).options[0] = new Option("- Select -", "");
		     var userTypeChecked = $(this).val();
		     $.ajax({
		    	    url: "loadRefDocument",
		            data : {
		            	userType:userTypeChecked,
		            	refDocumentList:"",
		            },
		            dataType: "json",
		            type: 'POST',
		            success: function(refDocumentList) {
		            	 $.each(refDocumentList, function (id, refDocument) {
		            		 $.each(refDocument, function(id,documentName){
			            		 $("#refDocumentId").get(0).options[$("#refDocumentId").get(0).options.length] = new Option(documentName.documentName,documentName.id);
		            		 });
		                }); 
		            },
		             error: function() {
		            	 alert("Failed to load Documents");
		            }
		        });
			
		});
        
        
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
		
		
		$("a[name='copyAddress']").click(function(){
        	$('#correspondenceAddress').val($('#address').val());
        	$('#refCorrespondenceStateId').val($('#refStateId').val());
        	$('#refCorrespondenceCityId').val($('#refCityId').val());
        	$('#correspondencePincode').val($('#pincode').val());
    	});
		
		$('input:submit').click(function(){
			$('input:submit').attr("disabled", true);
   			var sEmail = $('#email').val();	
			var vPan=$('#pan').val();
			var vTan=$('#tan').val();
			var fileName = $('#attachedDocument').val().toLowerCase();
			var fUpload=document.getElementsByName("fileUpload");
			var fUploadName=document.getElementsByName("fileUploadName"); 
			var filterLoginId = /^([0-9a-zA-Z]+)$/;
		
			 if($('input[name="userType"]:checked').val()=="A")
			{
				if($('#isEmpanelled').prop('checked')==true)
		   		{
					//alert("empane");
					if ($('#refOrganisationId').val()=="")
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
					
           		}
				if($('#isLawFirm').prop('checked')==true)
           		{
					if ($('#LawFirmName').val()=="")
					{
						alert("Please enter law firm.");
						$('#isLawFirm').focus();
						$('input:submit').attr("disabled", false);
						return false;
					}
				}	
				if($('#dob').val()=="")
				{
					alert("Please enter DOB");
					$('#dob').focus();
					$('input:submit').attr("disabled", false);
					return false;
				}
				else if(Date.parse($('#dob').val())>Date.parse(crDt))
				{
					alert("DOB should not be future date.")
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
				else if($('#barCouncilNo').val()=="")
			    {
			    	alert("Invalid BAR Council No.");
			    	$('#barCouncilNo').focus();
			    	$('input:submit').attr("disabled", false);
			    	return false;
			    }
				else if($('#barCouncilYear').val()=="")
				{
					alert("Please select Bar Council Year");
					$('#barCouncilYear').focus();
					$('input:submit').attr("disabled", false);
					return false;
				}
				else if($('#barCouncilRefStateId').val()=="")
			    {
			    	alert("Invalid BAR Council State");
			    	$('#barCouncilRefStateId').focus();
			    	$('input:submit').attr("disabled", false);
			    	return false;
			    }
				}
			if($('input[name="userType"]:checked').val()=="I")
				{
					if($('#dob').val()=="")
					{
						alert("Please enter DOB");
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
				}
			if($('input[name="userType"]:checked').val()=="E")
				{
					if ($('#refOrganisationId').val()=="")
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
					else if ($('#contactNumber').val()=="" || $('#contactNumber').val().length<11)
	    			{
	    				alert("Enter number with STD code. \nLandline number is either blank or not valid");
	    				$('#contactNumber').focus();
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
				}
			if($('input[name="userType"]:checked').val()=="O")
			{
				
//				if ($('#website').val()=="")
//    			{
//    				alert("Please enter website.");
//    				$('#website').focus();
//    				$('input:submit').attr("disabled", false);
//    				return false;
//    			}
				if(!validateTan(vTan)) 
			    {
			    	alert("Invalid GSTN Number");	
			    	$('#tan').focus();
			    	$('input:submit').attr("disabled", false);
			    	return false;			    	
			    }	
				
				else if($(".fidRepeat").length<2){
					alert("Upload atleast 2 documents");
			    	$('input:submit').attr("disabled", false);
			    	return false;
				}
				
//				else if($('#employeeDepartment').val()=="")
//				{
//					alert("Please enter department.");
//					$('#employeeDepartment').focus();
//					$('input:submit').attr("disabled", false);
//					return false;
//				}
				else if($('#employeeCode').val()=="")
				{
					alert("Please enter employee code.");
					$('#employeeCode').focus();
					$('input:submit').attr("disabled", false);
					return false;
				}
//				else if($('#employeeDesignation').val()=="")
//				{
//					alert("Please enter designation.");
//					$('#employeeDesignation').focus();
//					$('input:submit').attr("disabled", false);
//					return false;
//				}
				
				else if ($('#refOrganisationTypeId').val()=="")
    			{
    				alert("Please select organisation type.");
    				$('#refOrganisationTypeId').focus();
    				$('input:submit').attr("disabled", false);
    				return false;
    			}
    			else if ($('#refRegionId').val()=="")
    			{
    				alert("Please select region.");
    				$('#refRegionId').focus();
    				$('input:submit').attr("disabled", false);
    				return false;
    			}
//				else if ($('#contactPerson').val()=="") 
//    			{
//    				alert("Please enter contact person name.");
//    				$('#contactPerson').focus();
//    				$('input:submit').attr("disabled", false);
//    				return false;
//    			}
				else if ($('#contactNumber').val()=="" || $('#contactNumber').val().length<11)
    			{
    				alert("Enter number with STD code. \nLandline number is either blank or not valid");
    				$('#contactNumber').focus();
    				$('input:submit').attr("disabled", false);
    				return false;
    			}
			}
			if($('input[name="userType"]:checked').val()=="O")
				{
//					if(fUpload.length<2)
//					{
//						alert("'Board/MD authorising letter' and 'Copy of ROC' or 'TAN card' is mendatory.");
//						$('input:submit').attr("disabled", false);
//						return false;
//					}
			for (var i = 0; i < fUpload.length; i++)
			{
				var fileExtension = (fUpload[i].value).substring((fUpload[i].value).lastIndexOf('.') + 1).toLowerCase();
				 if ((fileExtension!="jpeg" && fileExtension!="jpg" && fileExtension!="pdf") || (fUpload[i].value=="" || fUploadName[i].value==""))
				{
					alert("Please select /upload pdf&jpeg document only.")
					$('input:submit').attr("disabled", false);
					return false
				}
				
				//else if 
			}
		}
			else if($('input[name="userType"]:checked').val()=="A" || $('input[name="userType"]:checked').val()=="I" || $('input[name="userType"]:checked').val()=="E")
			{
				for (var i = 0; i < fUpload.length; i++)
				{
					var fileExtension = (fUpload[i].value).substring((fUpload[i].value).lastIndexOf('.') + 1).toLowerCase();
					 if ((fileExtension!="jpeg" && fileExtension!="jpg" && fileExtension!="pdf") || (fUpload[i].value=="" || fUploadName[i].value==""))
					{
						alert("Please select /upload pdf&jpeg document only.")
						$('input:submit').attr("disabled", false);
						return false
					}
					
					//else if 
				}
			}
			if($('input[name="userType"]:checked').val()=="O" || $('input[name="userType"]:checked').val()=="A" || $('input[name="userType"]:checked').val()=="I" || $('input[name="userType"]:checked').val()=="E")
			{
				
				if($('#firstName').val()=="")
    			{
    				//alert($('#firstName').val());
    				//alert($('input[name="userType"]:checked').val());
					if($('input[name="userType"]:checked').val()=="O")
    				{
						alert("Plese enter organisation name");
						$('#firstName').focus();
    				}
    				else
    				{
    					alert("Please enter first name");
    					$('#firstName').focus();
    				}
					$('input:submit').attr("disabled", false);
    					return false;    					
    			}
				else if($('#lastName').val()=="")
    			{
    				if($('input[name="userType"]:checked').val()=="O")
    				{
						alert("Plese enter short name");
						$('#lastName').focus();
    				}
    				else
    				{
    					alert("Please enter last name");
    					$('#lastName').focus();
    				}
    				$('input:submit').attr("disabled", false);
    					return false;
    			}
				else if($('#userId').val().length<5 || $('#userId').val().length>32)
    			{
    				alert("Login Id should be 5 to 32 characters.");
    				$('#userId').focus();
    				$('input:submit').attr("disabled", false);
    				return false;
    			}
				else if(filterLoginId.test($('#userId').val())==false)
				{					
					alert("Login Id should be alphanumeric.");
					$('#userId').focus();
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
    				alert("Please enter pin");
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
    				alert("Please enter correspondence pin");
    				$('#correspondencePincode').focus();
    				$('input:submit').attr("disabled", false);
    				return false;
    			}
        			
//        		else if ($('#contactNumber').val()=="" || $('#contactNumber').val().length<11)
//    			{
//    				alert("Enter number with STD code. \nLandline number is either blank or not valid");
//    				$('#contactNumber').focus();
//    				$('input:submit').attr("disabled", false);
//    				return false;
//    			}
        		else if ($('#alternateNumber').val()!="" && $('#alternateNumber').val().length<11)
    			{
    				alert("Alternate number should be of 11 digits with STD Code.");
    				$('#alternateNumber').focus();
    				$('input:submit').attr("disabled", false);
    				return false;
    			}
				
        		else if ($('#mobile').val()=="" || $('#mobile').val().length<10)
    			{
    				alert("Please enter mobile");
    				$('#mobile').focus();
    				$('input:submit').attr("disabled", false);
    				return false;
    			}
        		else if ($('#refDocumentId').val()=="")
    			{
    				alert("Please select document type");
    				$('#refDocumentId').focus();
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
        			alert('Invalid Email Address');
           			//e.preventDefault();
        			$('input:submit').attr("disabled", false);
           			return false;
           		}
							
        		else if($('#disclaimer').prop('checked')==false)
           		{
           			alert('Please check disclaimer');
           			$('#disclaimer').focus();
           			$('input:submit').attr("disabled", false);
           			return false;
           		}
           		else if($("#captchaResponse").val()=="")
           		{
           			alert("Captcha missing");
           			$("#captchaResponse").focus();
           			$('input:submit').attr("disabled", false);
           			return false;
           		}
           		else if(checkDuplicate()==false)
           		{
           			
           			$('input:submit').attr("disabled", false);
           			return false;
           		}
           		else
            	{
           			document.newUserRegistration.action="submitRegistration";
        			document.newUserRegistration.submit();
        			//return true;
            	}
				
			}
			
          
      	   
			
    	});
		
		$('select[name="refDepartmentId.id"]').change(function () {
		$("#refDivisionId").get(0).options.length = 0;
        $("#refDivisionId").get(0).options[0] = new Option("- Select -", "");
	     var deptId = $(this).val();
	     $.ajax({
	    	    url: "loadRefDivision",
	            data : {
	            	deptId:deptId,
	            	refDivisionList:"",
	            },
	            dataType: "json",
	            type: 'POST',
	            success: function(refDivisionList) {
	            	 $.each(refDivisionList, function (id, refDivision) {
	            		 $.each(refDivision, function(id,divisionName){
		            		 $("#refDivisionId").get(0).options[$("#refDivisionId").get(0).options.length] = new Option(divisionName.divisionName,divisionName.id);
	            		 });
	                }); 
	            },
	             error: function() {
	            	 alert("Failed to load Documents");
	            }
	        });
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
			//alert("Invalid PAN");
			return true;
		}
		else {
			return false;
		}
	}
	
	function validateTan(vTan)
	{
		var filter = /([A-Za-z]){4}\d{5}([A-Za-z]){1}$/;
		if (filter.test(vTan)) 
		{
			//alert("Invalid PAN");
			return true;
		}
		else {
			return false;
		}
	}
		
	function fidAdd() {
		$('.fidRepeat:first').clone().insertAfter(".fidRepeat:last").find("#attachedDocument").val("");
		var fidLength = $(".fidRepeat").length;
		
		$( (".fidRepeat") ).each(function(i) {
			
			if(i == 0){
				$(".delete").hide();
				$(".add").hide();
			}
			
			else {
		   		$("span.delete:not(:first)").show();
		   		$("span.add:first").show();
		   	}
		});
	}
	
	function fidDelete(e) {
		$(e).parents(".fidRepeat").remove();		
	}
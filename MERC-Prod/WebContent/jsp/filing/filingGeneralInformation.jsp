<%@ taglib uri="/struts-tags" prefix="s"%>

<!-- 			04-01-2020 start AK -->
<script src="js/inputFieldValidationFilter.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css">


<script type="text/javascript">
$("#organizationPetitioner").chosen();
$(".organizationPetitioner1").chosen();

var unsaved = false;
	$(document).ready(function() {
		
		$(".organizationPetitioner1").chosen();
		
		$(":input").change(function(){ 
	    	unsaved = true;
		});
		
		$('.notInPerson').hide();
		$('.subheading notInPerson').hide();
				
// 		<!-- 			04-01-2020 end AK -->
		var actname = '<s:property value = "actName"/>';
		var actval = '<s:property value = "filingBean.refRules.id"/>';
		var norespondent = '<s:property value = "filingBean.noRespondents"/>';
		var additionalPetName = '<s:property value = "filingBean.additionalPetitioner"/>';
		var refNatureOfPetition  ='<s:property value = "filingBean.refNatureOfPetition.id"/>';
		var refKeyword  ='<s:property value = "filingBean.refKeyword"/>';
		
		
// 		28-04-2020 start SH

		var unsaved = false;

		$(":input").change(function(){ //triggers change in all input fields including text type
		    unsaved = true;
		});

		function unloadPage(){ 
		    if(unsaved){
		    	alert("change!!!");
// 		        return "You have unsaved changes on this page. Do you want to leave this page and discard your changes or stay on this page?";
		    }
		}

// 		28-04-2020 end SH
		
		
     	$(".individualPetitioner").hide();
		$(".individualRespondent").hide();
		$(".organizationPetitionerOther").hide();
		$(".organizationRespondentOther").hide();
		$(".individualPetitionerNodalPerson").hide();
		$(".otherRefNatureOfPetitionname").hide();
		$("#otherrefKeywordid").hide();
		
		
		$(".region").hide();
		$("#RefSectionId").hide();
			
		if($('#searchBy').val() == "1")
		{
			$('#refRelatedCaseTypeId').attr('disabled', true);	
			
		}
		else
		{
			$('#refRelatedCaseTypeId').attr('disabled', false);	
			
		}
		
		if($('#additionalPetitionerName').val() != "" && $('#additionalPetitionerName').val() != null){
			$('#addPetitioner').attr("checked", true);
			$(".additionalPetitioner").show();			
		}
		else{
			$('#addPetitioner').attr("checked", false);
			$(".additionalPetitioner").hide();
		}
		
		
		
		if(refNatureOfPetition =='6'){
			$(".otherRefNatureOfPetitionname").show();
		}
		else{
			$(".otherRefNatureOfPetitionname").hide();
		}
		
		 // Get value in alert  
			if($('#refKeywordId').val()=='6'){
				console.log("Enter"+refKeyword);
				$("#otherrefKeywordid").show();
				}
			else{
				$("#otherrefKeywordid").hide();
			} 
           
		
		
		$('#refNatureOfPetitionId').change(function(){
			console.log("enter");
		if($('#refNatureOfPetitionId').val()=='6'){
			$(".otherRefNatureOfPetitionname").show();
		}
		else{
			$(".otherRefNatureOfPetitionname").hide();
		}
		});
		
		
		$('#refKeywordId').change(function(){
			
			console.log("refKeyword"+'<s:property value = "filingBean.refKeyword"/>');
			if($('#refKeywordId').val()=='6'){
			$("#otherrefKeywordid").show();
		}
		else{
			$("#otherrefKeywordid").hide();
		}
		});
		
		
		
		
		if(actname==='Electricity Act, 2003'){
			var refActsId = $('#refActsId').val();
			$.ajax({
				url:"loadRefRules",
				data:{
					refActsId:refActsId,
					refRulesList:"",
				},
				dataType:"json",
				type:'POST',
				success : function(refRulesList){
					$.each(refRulesList,function(id, rulesList){
						if(refRulesList!=""){
							$.each(rulesList, function(id,rules){
								$("#refRulesId").get(0).options[$("#refRulesId").get(0).options.length] = new Option(rules.description,rules.id);
							});
							if($("#refRulesId").get(0).options.length>1){
								$('#refRulesId').show();
								$('#hideRules').show();
								$('.hideRules').show();	
								$("#refRulesId").get(0).selectedIndex = actval;
								
							}
						
							else{
								$('#refRulesId').hide();
								$('#hideRules').hide();
								$('.hideRules').hide();
							}
						}
						});
						
					},
					
					error : function(){
						alert("Failed to load rules");
					}
				
			});
		}
		
		else{
			$('#refRulesId').hide();
			$('#hideRules').hide();
			$('.hideRules').hide();
		}
		
		$('input[name="addPetitioner"]').click(function ()
		{
				if($('#addPetitioner').prop('checked')==true)
				{
					$(".additionalPetitioner").show();
				}
				else
				{
					$(".additionalPetitioner").hide();
					$("#additionalPetitionerName").val("");
				}
		});
		
		$('input[name="noresp"]').click(function ()
		{
			if($('#noresp').prop('checked')==true)
			{
				$('[name=mainRespondentId]').val("0");
				$('.showHideResps').show();
				$('#totalNumberOfRespondents').val("0");
				$('#totalNumberOfRespondents').attr("readonly", true);
				$(".organizationPetitioner1").prop('disabled', true).trigger("chosen:updated");
			}
			else
			{
				$('#totalNumberOfRespondents').val("");
				$('.showHideResps').show();
				$('#totalNumberOfRespondents').attr("readonly", false);
				$(".organizationPetitioner1").prop('disabled', false).trigger("chosen:updated");
			}
			
		});

		if(norespondent==="true")
		{
			$('[name=mainRespondentId]').val("0");
			$('#totalNumberOfRespondents').val("0");
			$('#totalNumberOfRespondents').attr("readonly", true);
			$('#noresp').attr("checked", true);
			$(".organizationPetitioner1").prop('disabled', true).trigger("chosen:updated");
		}
		else
		{
			$('#totalNumberOfRespondents').attr("readonly", false);
			$(".organizationPetitioner1").prop('disabled', false).trigger("chosen:updated");
		}
		
		$('[name=mainRespondentId]').change(function(){
			if($('#totalNumberOfRespondents').val() == 0){
				$('#totalNumberOfRespondents').val("");
			}
			$('#noresp').prop("checked",false);
			$('#totalNumberOfRespondents').attr("readonly", false);
		});
		
		$('#refActsId').change(function(){
			$("#refRulesId").get(0).options.length = 0;
			$("#refRulesId").get(0).options[0] = new Option("- Select -", "");
			var refActsId = $(this).val();
		 	$('refRulesId').hide();
			$.ajax({
				url:"loadRefRules",
				data:{
					refActsId:refActsId,
					refRulesList:"",
				},
				dataType:"json",
				type:'POST',
				success : function(refRulesList){
					$.each(refRulesList,function(id, rulesList){
						if(refRulesList!=""){
							$.each(rulesList, function(id,rules){
								$("#refRulesId").get(0).options[$("#refRulesId").get(0).options.length] = new Option(rules.description,rules.id);
							});
							if($("#refRulesId").get(0).options.length>1){
								$('#refRulesId').show();
								$('#hideRules').show();
								$('.hideRules').show();	
							}
						
							else{
								$('#refRulesId').hide();
								$('#hideRules').hide();
								$('.hideRules').hide();
							}
						}
						});
						
					},
					
					error : function(){
						alert("Failed to load rules");
					}
				
			});
		});
		
		
		
		var fidLength = $(".fidRepeat").length;
		$( (".fidRepeat") ).each(function(i) {
			if (i < (fidLength-1)) {
				$(".delete").show();
				$(".add").hide();
		   	}
		   	else {
		   		$("span.delete:last").hide();
		   		$("span.add:last").show();
		   	}
		});
		
		$("#relatedCaseNumberId").on('keypress', function (e){
		    //alert("1 :"+e.keyCode);
		    	if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57)) 
		        {
		    		//alert(e.which);
		        
		        	$("#relatedcaseerrmsg").html("Digits Only").hide();
	                return true;
	    		}
		    	
       	
        else
        {
        	$("#relatedcaseerrmsg").html("Digits Only").show();
        	e.preventDefault();
            
        }
		});
		if ($('select[name="refPetitionType.id"]').val() == "16" ||$('select[name="refPetitionSubType.id"]').val() == "9" ||$('select[name="refPetitionSubType.id"]').val() == "10"||$('select[name="refPetitionSubType.id"]').val() == "11" ||$('select[name="refPetitionSubType.id"]').val() == "13" || $('select[name="refPetitionType.id"]').val() == "14"||$('select[name="refPetitionType.id"]').val() == "5") 
		{
			
			$(".related").show();		
			
		}
		else
		{
			$(".related").hide();
			
		}
		
		if ($('select[name="refPetitionType.id"]').val() == "1" || $('select[name="refPetitionType.id"]').val() == "4" || $('select[name="refPetitionType.id"]').val() == "6") 
		{
			$(".tradingLicencePetition").show();		
		}
		else
		{
			$(".tradingLicencePetition").hide();
			
		}
		
		$('input[name="petitionerType"]').change(function () {
	
			
			if ($(this).val() == "I") {
	        	$(".individualPetitioner").show();
	        	$(".organizationPetitioner").hide();	        			 			
	 		}
	        else if ($(this).val() == "O") {
	            $(".organizationPetitioner").show();
	            $(".individualPetitioner").hide();	         
	 		}
		
					
		});  
		
		$('input[name="respondentType"]').change(function () {
			if ($(this).val() == "I") {
	        	$(".individualRespondent").show();
	        	$(".organizationRespondent").hide();	 			
	 		}
	        else if ($(this).val() == "O") {
	            $(".organizationRespondent").show();
	            $(".individualRespondent").hide();
	 		}
		});
		
		$('select[name="refPetitionerOrganisationId"]').change(function () {
			if ($(this).val() == "0") {
		    	$(".organizationPetitionerOther").show();
		    }
		    else {
	        	$(".organizationPetitionerOther").hide();
	 		}	        
		});
		
		$('select[name="refRespondentOrganisationId"]').change(function () {
			if ($(this).val() == "0") {
		    	$(".organizationRespondentOther").show();
		    }
		    else {
	        	$(".organizationRespondentOther").hide();	        	
	 		}	        
		});
		
		$('input[name="isInPerson"]').change(function () {
			if ($(this).val() == "N") {
				$(".notInPerson").show();		        
	        }
	        else {
	        	$(".notInPerson").hide();	 			
	 		}	        
		});
		
		$('select[name="petitionerNodalPersonId"]').change(function () {
			if ($(this).val() == "0") {
		    	$(".individualPetitionerNodalPerson").show();
		    }
		    else {
	        	$(".individualPetitionerNodalPerson").hide();
	 		}	        
		});	 
		
		$('#searchBy').change(function(){
			if($(this).val() == "1")
			{
				$('#refRelatedCaseTypeId').attr('disabled', true);	
				
			}
			else
			{
				$('#refRelatedCaseTypeId').attr('disabled', false);	
				
			}
		});
		$('select[name="refPetitionType.id"]').change(function() 
		{
			$('#searchBy').val("");
			$('#refRelatedCaseTypeId').val("");
			$('#relatedCaseNumberId').val("");
			$('#relatedCaseYearId').val("");
			if ($(this).val() == "5" || $(this).val() == "8") 
			{
		    	$(".related").show();		    	
		    	$(".tradingLicencePetition").hide();
		    	$('#refGenerationTransmissionId').val("");  
				$('#tariffPeriodId').val("");
		 	}
			else if ($(this).val() == "1" || $(this).val() == "4"  || $(this).val() == "6") 
			{
		    	$(".tradingLicencePetition").show();		    			        
		 	}
		 	else
		 	{
		 		$(".tradingLicencePetition").hide();
		 		$(".related").hide();
		 		$('#refRelatedCaseTypeId').val("");
				$('#relatedCaseNumberId').val("");
				$('#relatedCaseYearId').val("");
				$('#refGenerationTransmissionId').val("");  
				$('#tariffPeriodId').val("");
		 	} 
			if($("#referenceNumber").val()!=null && $("#referenceNumber").val()!="")
			{
				alert("You need to re-calculate the fee after changing petition type.");
			}
		});	
		$('select[name="refPetitionSubType.id"]').change(function() 
		{
			$('#searchBy').val("");
			$('#refRelatedCaseTypeId').val("");
			$('#relatedCaseNumberId').val("");
			$('#relatedCaseYearId').val("");
// 			if ($(this).val() == "2" ||$(this).val() == "6" ) 
// 			{
// 		    	$(".related").show();		    			        
// 		 	}
// 		 	else
// 		 	{
		 		$(".related").hide();
		 		$('#refRelatedCaseTypeId').val("");
				$('#relatedCaseNumberId').val("");
				$('#relatedCaseYearId').val("");
// 		 	}  
			if($("#referenceNumber").val()!=null && $("#referenceNumber").val()!="")
			{
				alert("You need to re-calculate the fee after changing sub petition type.");
			}
		});
		$('select[name="refPetitionSubSubType.id"]').change(function() 
				{
// 			alert("ek");
					$('#searchBy').val("");
					$('#refRelatedCaseTypeId').val("");
					$('#relatedCaseNumberId').val("");
					$('#relatedCaseYearId').val("");
		 			if ($(this).val() == "14") 
		 			{
		 		    	$(".related").show();		    			        
		 		 	}
		 		 	else
		 		 	{
				 		$(".related").hide();
				 		$('#refRelatedCaseTypeId').val("");
						$('#relatedCaseNumberId').val("");
						$('#relatedCaseYearId').val("");
		 	}  
					if($("#referenceNumber").val()!=null && $("#referenceNumber").val()!="")
					{
						alert("You need to re-calculate the fee after changing sub sub petition type.");
					}
				});
		
		function formValidationMulti(e)
		{
			var noOfSelectedRegulations = $("#refRegulationId :selected").length;
			
			var noOfSelectedKeywords = $("#refKeywordId :selected").length;
			var vAddPet = $('#additionalPetitionerName').val();
			if($('#refPetitionerOrganisationId').val()=="")
			{
				alert('Please select petitioner name.');
				$('#refPetitionerOrganisationId').focus();
				return false;
			}
			else if($('#refPetitionerRespondentId').val()=="0" && $('#noresp').prop('checked')==false)
			{
				alert('Please select respondent name.');
				$('#mainRespondentId').focus();
				return false;
			}
			else if($('#totalNumberOfRespondents').val()=="" && $('#noresp').prop('checked')==false|| $('#totalNumberOfRespondents').val()=="0" && $('#noresp').prop('checked')==false)
			{
				alert('Please enter total number of respondents.');
				$('#totalNumberOfRespondents').focus();
				return false; 
			}
			
	 		else if($('#refPetitionTypeId').val()=="")
			{
				alert('Please select petition type.');
				$('#refPetitionTypeId').focus();
				return false; 
			}
	 		else if($('#refPetitionSubTypeId').val()=="" && $('#refPetitionSubTypeId').children('option').length>1)
				{
					alert('Please select sub petition type.');
					$('#refPetitionSubTypeId').focus();
					return false; 
				}
			else if($('#refPetitionSubSubTypeId').val()=="" && $('#refPetitionSubSubTypeId').children('option').length>1) //refPetitionSubSubTypeId
			{
				alert('Please select sub sub petition type.');
				$('#refPetitionSubSubTypeId').focus();
				return false; 
			}
// 			else if (($('select[name="refPetitionType.id"]').val() == "5" ||$('select[name="refPetitionType.id"]').val()== "8"||$('select[name="refPetitionSubType.id"]').val() == "2" ||$('select[name="refPetitionSubType.id"]').val() == "6") && $('#refRelatedCaseTypeId').val()=="" && $('#searchBy').val()==2)
	
	else if (($('select[name="refPetitionType.id"]').val() == "16" ||$('select[name="refPetitionSubType.id"]').val() == "20" ||$('select[name="refPetitionSubType.id"]').val() == "9" ||$('select[name="refPetitionSubType.id"]').val() == "10"||$('select[name="refPetitionSubType.id"]').val() == "11"||$('select[name="refPetitionSubType.id"]').val() == "13"||$('select[name="refPetitionSubSubType.id"]').val() == "14"|| $('select[name="refPetitionType.id"]').val() == "5") && $('#refRelatedCaseTypeId').val()=="" && $('#searchBy').val()=="")
			{
				alert('Please select related petition searchBy.');
				$('#searchBy').focus();
				return false;
			}
	else if (($('select[name="refPetitionType.id"]').val() == "16" ||$('select[name="refPetitionSubType.id"]').val() == "20" ||$('select[name="refPetitionSubType.id"]').val() == "9" ||$('select[name="refPetitionSubType.id"]').val() == "10"||$('select[name="refPetitionSubType.id"]').val() == "11"||$('select[name="refPetitionSubType.id"]').val() == "13"||$('select[name="refPetitionSubSubType.id"]').val() == "14"|| $('select[name="refPetitionType.id"]').val() == "5") && $('#refRelatedCaseTypeId').val()=="" && $('#searchBy').val()==2)
			{
				alert('Please select related petition type.');
				$('#refRelatedCaseTypeId').focus();
				return false;
			}
// 			else if (($('select[name="refPetitionType.id"]').val() == "5" ||$('select[name="refPetitionType.id"]').val()== "8"||$('select[name="refPetitionSubType.id"]').val() == "2" ||$('select[name="refPetitionSubType.id"]').val() == "6") && $('#relatedCaseNumberId').val()=="")
			else if (($('select[name="refPetitionType.id"]').val() == "16" ||$('select[name="refPetitionSubType.id"]').val() == "20" ||$('select[name="refPetitionSubType.id"]').val() == "9" ||$('select[name="refPetitionSubType.id"]').val() == "10"||$('select[name="refPetitionSubType.id"]').val() == "11"||$('select[name="refPetitionSubType.id"]').val() == "13"||$('select[name="refPetitionSubSubType.id"]').val() == "14"|| $('select[name="refPetitionType.id"]').val() == "5") && $('#relatedCaseNumberId').val()=="")
			{
				alert('Please enter related case number.');
				$('#relatedCaseNumberId').focus();
				return false;
			}
// 			else if (($('select[name="refPetitionType.id"]').val() == "5" ||$('select[name="refPetitionType.id"]').val()== "8"||$('select[name="refPetitionSubType.id"]').val() == "2" ||$('select[name="refPetitionSubType.id"]').val() == "6") && $('#relatedCaseYearId').val()=="")
			else if (($('select[name="refPetitionType.id"]').val() == "16" ||$('select[name="refPetitionSubType.id"]').val() == "20" ||$('select[name="refPetitionSubType.id"]').val() == "9" ||$('select[name="refPetitionSubType.id"]').val() == "10"||$('select[name="refPetitionSubType.id"]').val() == "11"||$('select[name="refPetitionSubType.id"]').val() == "13"||$('select[name="refPetitionSubSubType.id"]').val() == "14"|| $('select[name="refPetitionType.id"]').val() == "5") && $('#relatedCaseYearId').val()=="")
			{
				alert('Please select related case year.');
				$('#relatedCaseYearId').focus();
				return false;
			}
			
			else if($('#refRegionId').val()=="")
			{
				alert('Please select region.');
				$('#refRegionId').focus();
				return false; 
			}
			else if ($('select[name="refPetitionType.id"]').val() == "1" && $('#refGenerationTransmissionId').val()=="")
			{
					alert("Please select licensing category");
					$('#refGenerationTransmissionId').focus();
					return false;
			}
			else if($('select[name="refPetitionType.id"]').val() == "1" && $('#tariffPeriodId').val()=="")
				{
					alert("Please select tariff periodId");
					$('#tariffPeriodId').focus();
					return false;
				}
			/* else if($('#refSubjectId').val()=="")
			{
				alert('Please select subject keyword.');
				$('#refSubjectId').focus();
				return false; 
			} */
			else if($('#subjectDescription').val()=="")
			{
				alert('Please enter subject.');
				$('#subjectDescription').focus();
				return false; 
			}
			
			/* else if(filterTextArea.test($('#subjectDescription').val())==false)
			{					
				alert("Invalid subject.");
				$('#subjectDescription').focus();
				return false;
			} */
		
			
			else if($('#refNatureOfPetitionId').val()=="")
			{
				alert('Please select nature of business.');
				$('#refNatureOfPetitionId').focus();
				return false; 
			}
			
			
// 			else if($('#refActsId').val()=="")
// 			{
// 				alert('Please select acts.');
// 				$('#refActsId').focus();
// 				return false; 
// 			}
// 		 	else if($('#refActsId').val()=="")
// 			{
// 				alert('Please enter Act Involved.');
// 				$('#refActsId').focus();
// 				return false; 
				
// 			} 
		 	
			
		 	else if($('[name=additionalPetitionerName]').val() == "" && $('[name=addPetitioner]').prop("checked") == true){
		 		alert("Please enter other petitioner name");
		 		$('#additionalPetitionerName').focus();
		 		return false;
			}
			
			else if($('#refActsId').val()=="0" && noOfSelectedRegulations < 1) 
			{
				alert('Plese select atleast an act or a regulation.');
				return false;
			}
			else if($('#sectionTextbox').val()=="")
			{
				alert('Please enter section.');
				$('#sectionTextbox').focus();
				return false; 
				
			}
			else if(noOfSelectedKeywords < 1)
			{
				alert('Plese select keyword.');
				return false; 
			}
			else  
			{
// 				var section=document.getElementsByName("refSectionArray");
// 				for (var i = 0; i < section.length; i++) 
// 				{
// 					if (section.length>1 && section[i].value=="")
// 					{
// 						alert("Please select section.")
// 						return false
// 					}
// 				}
				if($(this).val()=="Save")
				{
					e.preventDefault();
			        e.stopPropagation();
					filingGeneralInformationSave();
				}
				else
				{
					filingGeneralInformationSaveAndNext();
				}
			}
		}
		
		
		$("input[name='nextbutton']").click(function(){
			if(unsaved){
				var confo = confirm("Are you sure you want to leave this page? There is unsaved data on this page");
				if(confo != true){
					$("#nextbutton").blur();
					return false;
				}
				else{
					filingGeneralInformationSaveAndNext();
				}
			
			}
			
			else{
				filingGeneralInformationSaveAndNext();
			}
			
		});
		$("input[name='savebutton']").click(formValidationMulti);
		
		$("input[name='submitbutton']").click(callback);
		
		
		$('select[name="relatedCaseYear"]').change(function () {
			var refRelatedPetitionTypeId = $("#refRelatedCaseTypeId").val(); 
		     var relatedCaseNumber = $("#relatedCaseNumberId").val();
		     var relatedCaseYear = $(this).val();
		     var searchBy = $("#searchBy").val();
		     $.ajax({
		    	    url: "searchCaseAjax",
		            data : {
		            	searchBy:searchBy,
		            	refRelatedPetitionTypeId:refRelatedPetitionTypeId,
		            	relatedCaseNumber:relatedCaseNumber,
		            	relatedCaseYear:relatedCaseYear
		            },
		            dataType: "html",
		            type: 'POST',
		            success: function(response) {
		            	 if(response=='false'){
		            		 alert("Related petition not found.");
			            	 $("#refRelatedCaseTypeId").val(""); 
			    		     $("#relatedCaseNumberId").val("");
			    		     //$("#relatedCaseYearId").val("");
			    		     $('select[name="relatedCaseYear"]').val("");
		            	 }
		            },
		             error: function() {
		            	 alert("Related petition not found.");
		            	 $("#refRelatedCaseTypeId").val(""); 
		    		     $("#relatedCaseNumberId").val("");
		    		     $('select[name="relatedCaseYear"]').val("");
		            }
		        });
		});
		
		
		$('select[name="refPetitionType.id"]').change(function () {
			$(".noPetitionSubType").show();
			$(".noPetitionSubSubType").show();
			$("#refPetitionSubTypeId").get(0).options.length = 0;
			$("#refPetitionSubTypeId").get(0).options[0] = new Option("- Select -", "");
			$("#refPetitionSubSubTypeId").get(0).options.length = 0;
			$("#refPetitionSubSubTypeId").get(0).options[0] = new Option("- Select -", "");
	        var refPetitionTypeId = $(this).val();
// 	        alert("refPetitionTypeId"+refPetitionTypeId)
		    $.ajax({
		    	url: "loadSubPetitions",
		        data : {
		        	refPetitionTypeId:refPetitionTypeId,
		            refSubPetitionTypeList:"",
				},
		        dataType: "json",
		        type: 'POST',
		        success: function(refSubPetitionTypeList) {
		        	$.each(refSubPetitionTypeList, function (id, petitionSubTypeList) {
		        		if(petitionSubTypeList!=""){
			            	$.each(petitionSubTypeList, function(id,petitionSubType){
			            		$("#refPetitionSubTypeId").get(0).options[$("#refPetitionSubTypeId").get(0).options.length] = new Option(petitionSubType.petitionSubType,petitionSubType.id);
							});
		        		}
		        		else
		        		{
		        			$(".noPetitionSubType").hide();
		        			$(".noPetitionSubSubType").hide();
		        		}
					});
				},
		        	error: function() {
		            	alert("Failed to load Petition SubType");
					}
				});
		  
// 		    if ($('select[name="refPetitionType.id"]').val() == "5" ||$('select[name="refPetitionType.id"]').val()== "8"||$('select[name="refPetitionSubType.id"]').val() == "2" ||$('select[name="refPetitionSubType.id"]').val() == "6" ) 
		    	if ($('select[name="refPetitionType.id"]').val() == "16" || $('select[name="refPetitionType.id"]').val() == "5")
		    {
				
				$(".related").show();		
			}
			else
			{
				$(".related").hide();
				
			}
			});
		
		
		$('select[name="refPetitionSubType.id"]').change(function () {
			
			$(".noPetitionSubSubType").show();
			$("#refPetitionSubSubTypeId").get(0).options.length = 0;
			$("#refPetitionSubSubTypeId").get(0).options[0] = new Option("- Select -", "");
	        var refPetitionSubTypeId = $(this).val();
		    $.ajax({
		    	url: "loadSubSubPetitions",
		        data : {
		        	refPetitionSubTypeId:refPetitionSubTypeId,
		            refSubSubPetitionTypeList:"",
				},
		        dataType: "json",
		        type: 'POST',
		        success: function(refSubSubPetitionTypeList) {
		        	$.each(refSubSubPetitionTypeList, function (id, petitionSubSubTypeList) {
		        		if(petitionSubSubTypeList!=""){
			            	$.each(petitionSubSubTypeList, function(id,petitionSubSubType){
				            	$("#refPetitionSubSubTypeId").get(0).options[$("#refPetitionSubSubTypeId").get(0).options.length] = new Option(petitionSubSubType.petitionSubSubType,petitionSubSubType.id);
							});
		        		}
		        		else
		        		{
		        			$(".noPetitionSubSubType").hide();
		        		}
					});
				},
		        	error: function() {
		            	alert("Failed to load Petition SubSubType");
					}
				});
// 		    if ($('select[name="refPetitionType.id"]').val() == "5" ||$('select[name="refPetitionType.id"]').val()== "8"||$('select[name="refPetitionSubType.id"]').val() == "2" ||$('select[name="refPetitionSubType.id"]').val() == "6" )
		    if ($('select[name="refPetitionType.id"]').val() == "16" ||$('select[name="refPetitionSubType.id"]').val() == "9" ||$('select[name="refPetitionSubType.id"]').val() == "10"||$('select[name="refPetitionSubType.id"]').val() == "11"||$('select[name="refPetitionSubType.id"]').val() == "13" ||$('select[name="refPetitionSubType.id"]').val() == "20" ||$('select[name="refPetitionSubSubType.id"]').val() == "14")	
			{
				
				$(".related").show();		
			}
			else
			{
				$(".related").hide();
				
			}
			});
		
		// ON LOAD
		
		var refPetitionSubSubTypeId="";
		var refPetitionSubTypeId="";
		
		if($('select[name="refPetitionType.id"]').val()!=""){
			refPetitionSubTypeId = $("#refPetitionSubTypeId").val();
			refPetitionSubSubTypeId = $("#refPetitionSubSubTypeId").val();
			$("#refPetitionSubTypeId").get(0).options.length = 0;
			$("#refPetitionSubTypeId").get(0).options[0] = new Option("- Select -", "");
			$("#refPetitionSubSubTypeId").get(0).options.length = 0;
			$("#refPetitionSubSubTypeId").get(0).options[0] = new Option("- Select -", "");
			
			if(refPetitionSubTypeId!=""){
				
		    
				var refPetitionTypeId = $('select[name="refPetitionType.id"]').val();
			
				$.ajax({
				url: "loadSubPetitions",
			    data : {
			    	refPetitionTypeId:refPetitionTypeId,
			        refSubPetitionTypeList:"",
				},
			    dataType: "json",
			    type: 'POST',
			    success: function(refSubPetitionTypeList) {
			    	$.each(refSubPetitionTypeList, function (id, petitionSubTypeList) {
			        	$.each(petitionSubTypeList, function(id,petitionSubType){
			        		$("#refPetitionSubTypeId").get(0).options[$("#refPetitionSubTypeId").get(0).options.length] = new Option(petitionSubType.petitionSubType,petitionSubType.id);
						});
					});
			    	$("#refPetitionSubTypeId").val(refPetitionSubTypeId);
				},
			    error: function() {
					alert("Failed to load Petition SubType");
				}
			});
			}
			else{
				$(".noPetitionSubType").hide();
				$(".noPetitionSubSubType").hide();
			}
			
		}
		
		// Onload Sub Sub Petition
		 if(refPetitionSubTypeId!="" && refPetitionSubSubTypeId!=""){
			$(".noPetitionSubSubType").show();
			$.ajax({
				url: "loadSubSubPetitions",
			    data : {
			    	refPetitionSubTypeId:refPetitionSubTypeId,
			        refSubSubPetitionTypeList:"",
				},
			    dataType: "json",
			    type: 'POST',
			    success: function(refSubSubPetitionTypeList) {
			    	$.each(refSubSubPetitionTypeList, function (id, petitionSubSubTypeList) {
			        	$.each(petitionSubSubTypeList, function(id,petitionSubSubType){
				        	$("#refPetitionSubSubTypeId").get(0).options[$("#refPetitionSubSubTypeId").get(0).options.length] = new Option(petitionSubSubType.petitionSubSubType,petitionSubSubType.id);
						});
					});
			    	$("#refPetitionSubSubTypeId").val(refPetitionSubSubTypeId);
				},
			    error: function() {
			    	alert("Failed to load Petition SubSubType On LOAD");
				}
			});	
		} 
		else{
			 $(".noPetitionSubSubType").hide(); 
		}	
		
	});  
	
	function callback() 
	{
	    var x=confirm('Do you want submit ?');
	    if (x) 
	    {
	    	return filingSummary();
	    } 
	    else 
	    {
	        return false;
	    }
	    
	}
	
	function filingGeneralInformationSave(){
		if($('#refPetitionerOrganisationId').val() == $('#refPetitionerRespondentId').val())
		{
			alert('Petitioner and Respondent should be different.');
			
			return false;
		}
		
		else{
		document.filingGeneralInformation.action="filingGeneralInformationSave";
		document.filingGeneralInformation.submit();
		}
		
        // Validation for petitioner and respondent should be different 
	} 

	function filingGeneralInformationSaveAndNext(){
		document.filingGeneralInformation.action="filingGeneralInformationSaveAndNext";
		document.filingGeneralInformation.submit();
	} 
	
	function filingSummary(){
		document.filingGeneralInformation.action="filingSummary?struts.token.name=token&token=JHA7K9F01HS27HHK7WEYNSWZ8EZU62M4&filingBeanId=";
		document.filingGeneralInformation.submit();
	}
	
	function fidAdd() {
		
		$('.fidRepeat:first').clone().insertAfter(".fidRepeat:last").find("#sectionTextbox,#sectionRemarks").val("");
		var fidLength = $(".fidRepeat").length;
		$( (".fidRepeat") ).each(function(i) {
			if (i < (fidLength-1)) {
				$(".delete").show();
				$(".add").hide();
		   	}
		   	else {
		   		$("span.delete:last").hide();
		   		$("span.add:last").show();
		   	}
		});
	}
	
	function fidDelete(e) {
		$(e).parents(".fidRepeat").remove();		
	}
	
</script>
	<s:include value="/jsp/tiles/tabs.jsp"></s:include>
	<s:form theme="simple" name="filingGeneralInformation" validate="true">
	<table border = "0">
	
		<tr>
			<th colspan="7" class="mainheading">Filing - General Information</th>
		</tr>
		
		<s:if test="registrationNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Petition No. : <s:property value="registrationNumberDisplay"/></td>
			</tr>
			<tr>
				<td colspan="3" align="left">Diary No. : <s:property value="diaryNumberDisplay"/></td>
				<td colspan="1" align="center"></td>
				<td colspan="3" align="right">Reference No. : <s:property value="referenceNumberDisplay"/></td>									
			</tr>
		</s:if>
		<s:elseif test="diaryNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Diary No. : <s:property value="diaryNumberDisplay"/></td>													
			</tr>
			<tr>
				<td colspan="3" align="left"></td>
				<td colspan="1" align="center"></td>
				<td colspan="3" align="right">Reference No. : <s:property value="referenceNumberDisplay"/></td>									
			</tr>
		</s:elseif>
		<s:elseif test="referenceNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Reference No. : <s:property value="referenceNumberDisplay"/></td>									
			</tr>
		</s:elseif>
		
		
		
		<s:hidden name="referenceNumber" id="referenceNumber"/>
		<s:hidden name="referenceYear"/>
		<s:hidden name="referenceNumberDisplay"/>
		<s:hidden name="diaryNumber"/>
		<s:hidden name="diaryYear"/>
		<s:hidden name="diaryNumberDisplay"/>
		<s:hidden name="registrationNumber"/>
		<s:hidden name="registrationYear"/>
		<s:hidden name="registrationNumberDisplay"/>
		<s:hidden name="refSubject.id" value="%{24}"/>
		
		<tr valign="top">
			<td>Petitioner/Applicant Name<span class="required">*</span></td>
			<td>:</td>
			<td class="organizationPetitioner">
			<s:if test="#session.CERC_USER.userType == 'E' and #session.CERC_USER.refOrganisationId.id != 1 and filingBeanId == null">
				<s:select name="petitioner.id" list="petitionerList" listKey="id" listValue="refOrganisationId != null ? refOrganisationId.id != 1 ? employeeCode+' - '+refOrganisationId.organisationName+' (' +refOrganisationId.shortName+')':refemployeeCode+' - '+refOrganisationId.organisationName+' (MERC)' : firstName+' '+lastName" headerKey="" headerValue="- Select -" id="refPetitionerOrganisationId" cssStyle="width:142pt" value="#session.CERC_USER.refOrganisationId.updatedBy.id"/>
			</s:if>
			<s:elseif test="filingBeanId==null">
				<s:select name="petitioner.id" list="petitionerList" listKey="id" listValue="refOrganisationId != null ? refOrganisationId.id != 1 ? employeeCode+' - '+refOrganisationId.organisationName+' (' +refOrganisationId.shortName+')' : refemployeeCode+' - '+refOrganisationId.organisationName+' (MERC)': firstName+' '+lastName" headerKey="" headerValue="- Select -" id="refPetitionerOrganisationId" cssStyle="width:142pt" value="#session.CERC_USER.id"/>
			</s:elseif>
			<s:else>
				<s:select name="petitioner.id" list="petitionerList" listKey="id" listValue="refOrganisationId != null ? refOrganisationId.id != 1 ? employeeCode+' - '+refOrganisationId.organisationName+' (' +refOrganisationId.shortName+')':refemployeeCode+' - '+refOrganisationId.organisationName+' (MERC)': firstName+' '+lastName" headerKey="" headerValue="- Select -" id="refPetitionerOrganisationId" cssStyle="width:284pt"/>
				<s:hidden name="filingBeanId"/>
			</s:else>
				<p style="padding-top: 10pt;" class="organizationPetitionerOther"><input type="text" size="22" name="petitionerName" id="petitionerName"/></p>
				<s:a cssClass="organizationPetitionerOther" action="filingPartyDetails">Details</s:a>
			</td>
			<td class="individualPetitioner">
				<input type="text" size="22" name="petitionerName" id="petitionerName"/>
				<s:a action="filingPartyDetails">Details</s:a>
			</td>			
		</tr>
		
		<tr valign="top">
			<td colspan = "5">&nbsp;&nbsp;&nbsp;&nbsp;<s:checkbox name="addPetitioner" id="addPetitioner" fieldValue="true"/>Add Petitioner</td>
		</tr>
		
		<tr valign="top" class = "additionalPetitioner">
			<td>Other Petitioner Name</td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="additionalPetitionerName" id = "additionalPetitionerName" maxlength="160"/></td>
			<td><s:textfield type="text" size="24" name="ad" id = "ad" maxlength="160"/></td>
		</tr>
		<tr valign="top">
			<td>Respondent Name (Main)</span></td>
			<td>:</td>
			<!--04-03-2020 start AK -->
			<td class="organizationPetitioner">
				<s:select class="organizationPetitioner1"  name="mainRespondentId"  list="respondentList" listKey="id" listValue="refOrganisationId != null ? employeeCode+' - '+refOrganisationId.organisationName+' (' +refOrganisationId.shortName+')' : firstName+' '+lastName" headerKey="0" headerValue="- Select -" id="refPetitionerRespondentId" cssStyle="width:284pt"/>		
	            <br/><span class="tooltip">Please Map Respondent under Admin tab->Respondent Mapping if not present in the list</span>		
			</td>
			<!--04-03-2020 end AK -->
		</tr>		
		<tr valign="top">
			<td>Total Number of Respondents<span class="required">*</span></td>
			<td>:</td>
			<td>
				<s:textfield maxlength="2" name="totalNumberOfRespondents" id="totalNumberOfRespondents"/>
			</td>
			
		</tr>
		<tr valign = "top" >
			<td colspan = "5">&nbsp;&nbsp;&nbsp;&nbsp;<s:checkbox name="noresp" id="noresp" fieldValue="true" />&nbsp;&nbsp;No Respondents</td>
		</tr>
		<tr class="subheading">
			<td colspan="7">Petition Details</td>									
		</tr>
		<tr>
			<td width="20%">Petition Type<span class="required">*</span></td>
			<td width="1%">:</td>
			<td colspan="5">
				<s:select list="refPetitionTypeList" name="refPetitionType.id" id="refPetitionTypeId" listKey="id" listValue="petitionType+'  ('+petitionTypeCode+')'" headerKey="" headerValue="- Select -" cssStyle="width:284pt"/>
			</td>
		</tr>
		<tr class="noPetitionSubType">
			<td width="20%">Sub Petition Type<span class="required">*</span></td>
			<td width="1%">:</td>
<!-- 			<td width= "28%"> -->
			<td>
			<s:select list="refPetitionSubTypeList" name="refPetitionSubType.id" id="refPetitionSubTypeId" listKey="id" listValue="petitionSubType" headerKey="" headerValue="- Select -" cssStyle="width:900pt"/>
			</td>
<!-- 			<td width="2%"></td> -->
<%-- 			<td width="20%"><div class="noPetitionSubSubType">Sub Sub Petition Type<span class="required">*</span></div></td> --%>
<!-- 			<td width="1%"><div class="noPetitionSubSubType">:</div></td> -->
<!-- 			<td width="28%"><div class="noPetitionSubSubType"> -->
<%-- 			<s:select list="refPetitionSubSubTypeList" name="refPetitionSubSubType.id" id="refPetitionSubSubTypeId" listKey="id" listValue="petitionSubSubType" headerKey="" headerValue="- Select -" cssStyle="width:142pt"/> --%>
<!-- 			</div> -->
<!-- 			</td> -->
		</tr>
		
		<tr class="noPetitionSubSubType">
			<td width="20%">Sub Sub Petition Type<span class="required">*</span></td>
			<td width="1%">:</td>
			<td>
				<s:select list="refPetitionSubSubTypeList" name="refPetitionSubSubType.id" id="refPetitionSubSubTypeId" listKey="id" listValue="petitionSubSubType" headerKey="" headerValue="- Select -" cssStyle="width:900pt"/>
			</td>	
		</tr>
		
		<tr class="related">
			<td>Related to Petition Type<span class = "required">*</span></td>
			<td>:</td>
			<td colspan="5">
			<s:select list="#{2:'Petition Number',1:'Diary Number'}" name="searchBy" id="searchBy" headerKey="" headerValue="- Select -" theme="simple" cssStyle="width:115pt"/>&nbsp;&nbsp;
			<s:select list="refPetitionTypeList1" name="refRelatedPetitionTypeId" id="refRelatedCaseTypeId" listKey="id" listValue="petitionType+'  ('+petitionTypeCode+')'" headerKey="" headerValue="- Select -" cssStyle="width:142pt"/>
				&nbsp;&nbsp;Number :&nbsp;
				<s:textfield type="text" size="10" name="relatedCaseNumber" id="relatedCaseNumberId"/><span id="relatedcaseerrmsg" class="tooltip"></span>
				&nbsp;&nbsp;Year :&nbsp;
				<s:select  name="relatedCaseYear" id="relatedCaseYearId" list="yearList" headerValue="- Select -" headerKey=""/>
			</td>						
		</tr>
		<tr class = "region">
			<td>Region<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
			<s:select list="refRegionList" name="refRegion.id" id="refRegionId" listKey="id" listValue="A All" cssStyle="width:284pt"/>
			</td>						
		</tr>
		<tr class="tradingLicencePetition">	
			<td>Licensing Category<span class="required">*</span></td>
			<td>:</td>
			<td>
				<s:select list="refLicensingCategoryList" name="refGenTrans" id="refGenerationTransmissionId" listKey="id" listValue="licensingCategoryDescription" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Tariff Period<span class="required">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<s:select list="refTariffPeriodList" name="tariffPeriod" id="tariffPeriodId" listKey="id" listValue="periodDisplay" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/>
			
			</td>
<!-- 			<td></td> -->
<%-- 			<td>Tariff Period<span class="required">*</span></td> --%>
<!-- 			<td>:</td> -->
<!-- 			<td> -->
<%-- 				<s:select list="refTariffPeriodList" name="tariffPeriod" id="tariffPeriodId" listKey="id" listValue="periodDisplay" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/> --%>
<!-- 			</td>				 -->
		</tr>
<%-- 		<tr>
			<td>Subject Keyword<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
			<s:select list="refSubjectList" name="refSubject.id" id="refSubjectId" listKey="id" listValue="subject" headerKey="" headerValue="- Select -"/>
			</td>						
		</tr> --%>
		<tr valign="top">
			<td>Subject<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><textarea cols="1000" name="subjectDescription" id="subjectDescription" style="width:500pt" ><s:property value="subjectDescription"/></textarea></td>						
		</tr>
		<tr valign = "top">
			<td>Brief of Petition</td>
			<td>:</td>
				<!-- 			04-03-2020 start AK -->
			<td colspan="5"><textarea cols="1000" name="briefOfPetition" id = "briefOfPetition" style="width:500pt"  maxlength="500" ><s:property value="briefOfPetition"/></textarea>
			<span class = "tooltip">maximum 500 characters</span>
			</td>
			<!-- 			04-03-2020 end AK -->
			
		</tr>
		<tr>
			<td>Nature of Business<span class="required">*</span> (Relevant to Petition)</td>
			<td>:</td>
			<td>
			<s:select list="refNatureOfPetitionList" name="refNatureOfPetition.id" id="refNatureOfPetitionId" listKey="id" listValue="description" headerKey="" headerValue="- Select -" cssStyle="width:284pt"/>
			&nbsp;&nbsp;&nbsp;&nbsp;
			 <span class = "otherRefNatureOfPetitionname">Other Nature of Business</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class = "otherRefNatureOfPetitionname">:</span>&nbsp;&nbsp;&nbsp;&nbsp;	
			<s:textfield type="text" size="24" class="otherRefNatureOfPetitionname" name="otherRefNatureOfPetition" id = "otherRefNatureOfPetition" maxlength="160"/> 
			</td>					
		</tr>
		
		<tr>
		<td></td>
			<td colspan = "10"><span class = "tooltip">User may select an act or a regulation or both but selecting atleast 1 is mandatory</span></td>
		</tr>
		<tr>
			<td>Act Involved<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
			<s:select list="refActsList" name="refActs.id" id="refActsId" listKey="id" listValue="actDescription" headerKey="0" headerValue="- Select -" cssStyle="width:284pt"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class = "hideRules">Electricity Rules</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class = "hideRules">:</span>&nbsp;&nbsp;&nbsp;&nbsp;
			<s:select list="refRulesList" name = "refRules.id" id="refRulesId" listKey="id" listValue="description" headerKey="" headerValue="- Select -" cssStyle="width:150pt"/>
			</td>
		</tr>
		
		<tr id="RefSectionId">
		<td><s:select list="refSectionList" name="refSectionArray2"  listKey="id" listValue="Section 9" cssStyle="width:142pt;"/></td>
		</tr>
		
		<tr>
			<td colspan="7">
			<s:if test="refSectionArray.length>0">
			<s:iterator value="refSectionArray" status="rowstatus">
			
				<div class="fidRepeat">
					Under Section
					<span class="required">*</span> 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;
					
<%-- 					<s:select list="refSectionList" name="refSectionArray" id="RefSectionId" listKey="id" listValue="sectionCode" headerKey="" headerValue="- Select -" cssStyle="width:142pt;" value="%{refSectionArray[#rowstatus.index]}"/> --%>
					<s:textfield type="text" size="24" name="refSectionArray" id = "sectionTextbox" maxlength="160" value="%{refSectionArray[#rowstatus.index]}"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Sub Section
					<!--04-03-2020 start AK -->
<%-- 					<span class="required">*</span>  --%>
					<!--04-03-2020 end AK -->
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;
					<%-- <s:select list="refSubSectionList" name="refSubSection.id" id="refSubSectionId" listKey="id" listValue="subSectionDescription" headerKey="" headerValue="- Select -" cssStyle="width:142pt"/> --%>
					<s:textfield class="text" type="text" size="10" name="sectionRemarks" id="sectionRemarks" value="%{sectionRemarks[#rowstatus.index]}"/>
					<s:if test="%{#rowstatus.count!=refSectionArray.size()}">
					<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>
					</s:if>
					<s:else>
					<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>
					<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
					</s:else>
				</div>	
			</s:iterator>
			</s:if>
			<s:else>
<%-- 			<s:select list="refSectionList" name="refSectionArray2" id="RefSectionId" listKey="id" listValue="Section 9" cssStyle="width:142pt;" /> --%>
				<div class="fidRepeat">
					Under Section
					<span class="required">*</span> 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;
					<s:textfield type="text" size="24" name="refSectionArray" id = "sectionTextbox" maxlength="160" value="%{section[#rowstatus.index]}"/>
<%-- 					<s:select list="refSectionList" name="refSectionArray" id="RefSectionId" listKey="id" listValue="sectionCode" headerKey="" headerValue="- Select -" cssStyle="width:142pt;" value="%{refSectionArray[#rowstatus.index]}"/> --%>
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Sub Section
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;
					<%-- <s:select list="refSubSectionList" name="refSubSection.id" id="refSubSectionId" listKey="id" listValue="subSectionDescription" headerKey="" headerValue="- Select -" cssStyle="width:142pt"/> --%>
					<s:textfield class="text" type="text" size="10" name="sectionRemarks" id="sectionRemarks" value="%{refSectionArray[#rowstatus.index]}"/>
					<s:if test="%{#rowstatus.count!=refSectionArray.size()}">
					<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>
					</s:if>
					<s:else>
					<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>
					<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
					</s:else>
				</div>	
			</s:else>
			</td>
		</tr>
						
		<tr valign="top">
			<td>Regulation<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5" >
			<s:select list="refRegulationList" name="refRegulation" id="refRegulationId" listKey="id" listValue="regulationDescription" headerKey="" headerValue="- Select -" cssStyle="width:900pt" multiple = "true" value="refRegulation"/>
			<%-- <select name="refRegulation" multiple="multiple" style="width:510pt" id="refRegulationId">
        <s:iterator value="refRegulationList">
            <option value="<s:property value="id"/>" title="<s:property value="regulationDescription"/>">
                <s:property value="regulationDescription"/>
            </option>
        </s:iterator>
    </select> --%>
			<br><span class="tooltip">(Use "Ctrl" key to select multiple.)</span>
			</td>
		</tr>
		
		<tr valign="top">
			<td>Keywords<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
			<s:select list="refKeywordList" name="refKeyword" id="refKeywordId" listKey="id" listValue="keywordDescription" headerKey="" headerValue="- Select -" cssStyle="width:510pt" multiple = "true" value="refKeyword"/>
			<br><span class="tooltip">(Use "Ctrl" key to select multiple.)</span></td>
									
		</tr>
		<tr id = "otherrefKeywordid">
		<td>Other Keyword</td>
			<td>:</td>
			<td>
			<s:textfield type="text" size="24" name="otherrefKeyword" id = "otherrefKeyword" maxlength="160"/>
			</td>
		</tr>
	
		<!--<tr>
			<td>Intrim Order</td>
			<td>:</td>
			<td colspan="5"><input type="checkbox" name="intrimOrder" id="intrimOrder" /></td>						
		</tr>
		<tr>
			<td>Nature of Urgency</td>
			<td>:</td>
			<td colspan="5"><textarea cols="128" name="subjectDescription" id="subjectDescription" style="width:256pt"></textarea></td>						
		</tr>
		-->
		<tr class="subheading notInPerson">
			<td colspan="7">Advocate / Law Firm Dealing with Petition (if any)</td>									
		</tr>
		<tr class="notInPerson">
			<td>Name</td>
			<td>:</td>
			<td colspan="5">
			<s:select list="advocateList" name="advocate.id" id="advocateId" listKey="id" listValue="firstName+' '+lastName" headerKey="" headerValue="- Select -" cssStyle="width:284pt"/>
			</td>
		</tr>
		
		
		<tr class="organizationPetitioner subheading">
			<td colspan="7">Petitioner's Nodal Person Details (if any)</td>									
		</tr>
		<tr class="organizationPetitioner">
			<td>Name</td>
			<td>:</td>
			<td colspan="5">
				<s:select list="nodalOfficerList" name="nodalOfficer.id" id="nodalOfficerId" listKey="id" listValue="firstName+' '+lastName" headerKey="" headerValue="- Select -" cssStyle="width:284pt"/>
			</td>
		</tr>
		<tr class="individualPetitionerNodalPerson">
			<td>Name<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><input type="text" size="22" name="petitionerNodalPersonName" id="petitionerNodalPersonName"/></td>
		</tr>
		<tr class="individualPetitionerNodalPerson">
			<td>Address<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><input type="text" size="22" name="petitionerNodalPersonAddress" id="petitionerNodalPersonAddress"/></td>
		</tr>
		<tr class="individualPetitionerNodalPerson">
			<td>State<span class="required">*</span></td>
			<td>:</td>
			<td><select name="refPetitionerNodalPersonStateId" id="refPetitionerNodalPersonStateId" style="width:142pt"/></td>
			<td></td>
			<td>City<span class="required">*</span></td>
			<td>:</td>
			<td><select name="refPetitionerNodalPersonCityId" id="refPetitionerNodalPersonCityId" style="width:142pt"/></td>
		</tr>
		<tr class="individualPetitionerNodalPerson">
			<td>Pincode<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><input type="text" size="22" name="petitionerNodalPersonPincode" id="petitionerNodalPersonPincode"/></td>
		</tr>
		<tr class="individualPetitionerNodalPerson">
			<td>Mobile Number<span class="required">*</span></td>
			<td>:</td>
			<td><input type="text" size="22" name="petitionerNodalPersonMobile" id="petitionerNodalPersonMobile"/></td>
			<td></td>
			<td>EMail Address<span class="required">*</span></td>
			<td>:</td>
			<td><input type="text" size="22" name="petitionerNodalPersonEmail" id="petitionerNodalPersonEmail"/></td>
		</tr>
		<tr>
		<td></td>
		</tr>
		<tr>
<!-- 			<td colspan="3"> -->
<%-- 				
					<s:if test="referenceNumber!=null">
						<input type="submit" id="submitbutton" name="submitbutton" value="Submit" class="formbutton"  />
					</s:if>
 --%>				
<!-- 			</td> -->
			<td colspan="4" align="center">
				<s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'"> 
					<s:if test="referenceNumber!=null">
						<input type="button" id="nextbutton" name="nextbutton" value="Next &gt;&gt;" class="formbutton" />&nbsp;&nbsp;
					</s:if>
					<input type="submit" id="savebutton" name="savebutton" value="Save" class="formbutton"/>&nbsp;&nbsp;
					<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				 
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/>
				</s:if>
			</td>
		</tr>
	<s:token/>
	</table>
</s:form>
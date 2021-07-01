<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="js/inputFieldValidationFilter.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var crDt=new Date();
		$(".delete").hide();
		$('.showGT').show();
		$('.showTT').hide();
		$('#regHide').hide();
		
		if($('#assetType').val()=='E')
		{
			$('.assetSubType').show();
			$('.assetSubTypeGT').show();
			$('.assetSubTypeTT').hide();
		}
		else if($('#assetType').val()=='N')
		{
			$('.assetSubType').show();
			$('.assetSubTypeGT').hide();
			$('.assetSubTypeTT').show();
		}
		else
		{
			$('.assetSubType').hide();
			$('.assetSubTypeGT').hide();
			$('.assetSubTypeTT').hide();
		}
		
		
		$("#idc").on('keypress',function (e) 
	    	    {
	    	        //if the letter is not digit then display error and don't type anything
	    	        if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57))
	    	        {
	    	           //display error message
	    	        	$("#idcerrmsg").html("Digits Only").hide();
	    	            return true;
	    	       	}
	    	        else
	    	        {
	    	        	$("#idcerrmsg").html("Digits Only").show();
	    	        	e.preventDefault();
	    	            
	    	        }
	  });
		$("#iedc").on('keypress',function (e) 
	    	    {
	    	        //if the letter is not digit then display error and don't type anything
	    	        if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57))
	    	        {
	    	           //display error message
	    	        	$("#iedcerrmsg").html("Digits Only").hide();
	    	            return true;
	    	       	}
	    	        else
	    	        {
	    	        	$("#iedcerrmsg").html("Digits Only").show();
	    	        	e.preventDefault();
	    	            
	    	        }
	  });
		$("#costOfProjectApproved").on('keypress',function (e) 
	    	    {
	    	        //if the letter is not digit then display error and don't type anything
	    	        if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57))
	    	        {
	    	           //display error message
	    	        	$("#costOfProjectApprovederrmsg").html("Digits Only").hide();
	    	            return true;
	    	       	}
	    	        else
	    	        {
	    	        	$("#costOfProjectApprovederrmsg").html("Digits Only").show();
	    	        	e.preventDefault();
	    	            
	    	        }
	  });
		$("#actualCostOfProject").on('keypress',function (e) 
	    	    {
	    	        //if the letter is not digit then display error and don't type anything
	    	        if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57))
	    	        {
	    	           //display error message
	    	        	$("#actualCostOfProjecterrmsg").html("Digits Only").hide();
	    	            return true;
	    	       	}
	    	        else
	    	        {
	    	        	$("#actualCostOfProjecterrmsg").html("Digits Only").show();
	    	        	e.preventDefault();
	    	            
	    	        }
	  });
		$("#costOverRun").on('keypress',function (e) 
	    	    {
	    	        //if the letter is not digit then display error and don't type anything
	    	        if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57))
	    	        {
	    	           //display error message
	    	        	$("#costOverRunerrmsg").html("Digits Only").hide();
	    	            return true;
	    	       	}
	    	        else
	    	        {
	    	        	$("#costOverRunerrmsg").html("Digits Only").show();
	    	        	e.preventDefault();
	    	            
	    	        }
	  });
		$("#timeOverRun").on('keypress',function (e) 
	    	    {
	    	        //if the letter is not digit then display error and don't type anything
	    	        if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57))
	    	        {
	    	           //display error message
	    	        	$("#timeOverRunerrmsg").html("Digits Only").hide();
	    	            return true;
	    	       	}
	    	        else
	    	        {
	    	        	$("#timeOverRunerrmsg").html("Digits Only").show();
	    	        	e.preventDefault();
	    	            
	    	        }
	  });
		$("#capacity").on('keypress',function (e) 
	    	    {
	    	        //if the letter is not digit then display error and don't type anything
	    	        if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57))
	    	        {
	    	           //display error message
	    	        	$("#capacityerrmsg").html("Digits Only").hide();
	    	            return true;
	    	       	}
	    	        else
	    	        {
	    	        	$("#capacityerrmsg").html("Digits Only").show();
	    	        	e.preventDefault();
	    	            
	    	        }
	  });
		
		$("#revisedCostOfProject").on('keypress',function (e) 
	    	    {
	    	        //if the letter is not digit then display error and don't type anything
	    	        if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57))
	    	        {
	    	           //display error message
	    	        	$("#revisedCostOfProjecterrmsg").html("Digits Only").hide();
	    	            return true;
	    	       	}
	    	        else
	    	        {
	    	        	$("#revisedCostOfProjecterrmsg").html("Digits Only").show();
	    	        	e.preventDefault();
	    	            
	    	        }
	  });
		$('select[name="refPetitionTypeName"]').change(function () {
			if ($('#refRegionId').val()=="")
			{
				alert("Please select Region first.");
				return false;
			}
				$("#refGenerationTransmissionId").get(0).options.length = 0;
	        	$("#refGenerationTransmissionId").get(0).options[0] = new Option("- Select -", "");
		     	var refPetitionTypeName =  $(this).val();
		     	var refRegionName = $("#refRegionId").val();
		     	$("#refElementType").get(0).options.length = 0;
	        	$("#refElementType").get(0).options[0] = new Option("- Select -", "");
		     	
	        	
	        	
		     	//document.getElementById("refPetitionTypeId").value=refPetitionTypeName;
		     	$.ajax({
		    		url: "loadGenerationTransmissionList",
		            data : {
		            	refRegionName:refRegionName,
		            	refPetitionTypeName:refPetitionTypeName,
		            	refGenerationTransmissionList:"",
		            	refElementTypeList:"",
		            },
		            dataType: "json",
		            type: 'POST',
		            success: function(refGenerationTransmissionList) {
		            	//alert(refGenerationTransmissionList);
						$.each(refGenerationTransmissionList, function (id, generationTransmissionName) {
							//alert(id);
							if(id=='refGenerationTransmissionList'){
							$.each(generationTransmissionName, function(id,generationTransmissionName){
								//alert(id);
		            			$("#refGenerationTransmissionId").get(0).options[$("#refGenerationTransmissionId").get(0).options.length] = new Option(generationTransmissionName.generationTransmissionName,generationTransmissionName.id);
							});
							}
							if(id=='refElementTypeList'){
								$.each(generationTransmissionName, function(id,generationTransmissionName){
									//alert(id);
			            			$("#refElementType").get(0).options[$("#refElementType").get(0).options.length] = new Option(generationTransmissionName.description,generationTransmissionName.id);
								});
								}
						}); 
						
						if(refPetitionTypeName=='4')
						{
							if($('#assetType').val()=='E')
							{   $('.assetSubTypeGT').show();
							   $('.assetSubTypeTT').hide();
								$('.assetSubType').show();
								$('.showGT').show();
								$('.showTT').hide();
								
							}
							else
							{
								$('.assetSubType').hide();
								$('.showGT').show();
								$('.showTT').hide();
							}
							
						}
						else if(refPetitionTypeName=='10')
						{
							if($('#assetType').val()=='E')
							{
								$('.assetSubType').show();
								$('.showGT').hide();
								$('.showTT').show();
								$('.assetSubTypeTT').show();
								$('.assetSubTypeGT').hide();
							}
							else
							{
								$('.assetSubType').hide();
								$('.showGT').hide();
								$('.showTT').show();
							}
						}
						else
						{
							$('.showGT').hide();
							$('.showTT').show();
						}
						
					},
		            error: function() {
		            	alert("Failed to load data.");
		            }
				});
		});
		
		$('select[name="refElementTypeId"]').change(function () {
			$("#refElementSubType").get(0).options.length = 0;
        	$("#refElementSubType").get(0).options[0] = new Option("- Select -", "");
	     	var refElementTypeId =  $(this).val();
	     	$.ajax({
	    		url: "loadRefElementSubTypeList",
	            data : {
	            	refElementTypeId:refElementTypeId,
	            	refElementSubTypeList:"",
	            },
	            dataType: "json",
	            type: 'POST',
	            success: function(refElementSubTypeList) {
					$.each(refElementSubTypeList, function (id, refElementSubType) {
	            		$.each(refElementSubType, function(id,elementSubType){
	            			$("#refElementSubType").get(0).options[$("#refElementSubType").get(0).options.length] = new Option(elementSubType.description,elementSubType.id);
						});
					}); 
				},
	            error: function() {
	            	alert("Failed to load Element Sub Type");
	            }
			});
	});
		$('select[name="assetType"]').change(function () {
				
			if($('#assetType').val()=='E')
			{
				if($('#refPetitionTypeId').val()==4)
				{
					$('.assetSubType').show();
					$('.assetSubTypeGT').show();
					$('.assetSubTypeTT').hide();
				}
				else if($('#refPetitionTypeId').val()==10)
				{
					$('.assetSubType').show();
					$('.assetSubTypeGT').hide();
					$('.assetSubTypeTT').show();
				}
				
			}
			else if($('#assetType').val()=='N')
			{
				$('.assetSubType').hide();
				$('.assetSubTypeGT').hide();
				$('.assetSubTypeTT').hide();
			}
			else
			{
				$('.assetSubType').hide();
				$('.assetSubTypeGT').hide();
				$('.assetSubTypeTT').hide();
			}
		});
		
		
		
		$("input[name='savebutton']").click(function(){
			var assetName=document.getElementsByName("assetName");
			var assetType=document.getElementsByName("assetType");
			var capacity=document.getElementsByName("capacity");
			var anticipatedDoco=document.getElementsByName("anticipatedDocoDate");
			var actualDoco=document.getElementsByName("actualDocoDate");
			var actualDocoDateTemp = $("#actualDocoDate").val();
			var investmentApprovalDate=null;
						
			$.ajax({
				url:'getCutOffDate',
				data: {actualDocoDateTemp:actualDocoDateTemp},
				dataType: "json",
				 success: function (data) {
					 $('#cutoffDate').val(data);
				 },
			}); 
// 			<!--	04-03-2020 start AK -->		
			if ($("#investmentApprovalDate").val()!="")
			{
				
				var from = $("#investmentApprovalDate").val().split("/");
				investmentApprovalDate = new Date(from[2], from[1] - 1, from[0]);
			}
			if($('#refRegionId').val()=="")
			{
				alert("Please select region.");
				$('#refRegionId').focus();
				return false;
			}
			else if($('#refPetitionTypeId').val()=="")
			{
				alert("Please select Asset/Unit For.");
				$('#refPetitionTypeId').focus();
				return false;
			}
			
			else if($('#refGenerationTransmissionId').val()=="")
			{
				alert("Please select generation station.");
				$('#refGenerationTransmissionId').focus();
				return false;
			}
			else if($('#assetName').val()=="")
			{
				alert("Please enter Asset/Unit name.");
				$('#assetName').focus();
				return false;
			}
			else if(filterTextArea.test($('#assetName').val())==false)
			{
				alert("Invalid  asset/unit name.")
				$('#assetName').focus();
				return false;
			}
			else if($('#assetDetails').val()=="")
			{
				alert("Please enter asset/unit details.");
				$('#assetDetails').focus();
				return false;
			}
		
			else if(filterTextArea.test($('#assetDetails').val())==false)
			{
				alert("Invalid  asset/unit details.")
				$('#assetDetails').focus();
				return false;
			}
			
			else if($('#assetType').val()=="")
			{
				alert("Please select Asset/Unit type.");
				$('#assetType').focus();
				return false;
			}
			else if($('#assetType').val()=="E" && $('#assetSubType').val()=="")
			{
				alert("Please select Asset/Unit sub type.");
				$('#assetSubType').focus();
				return false;
			}
// 			else if($('#refElementType').val()=="" && $('#refElementType').val()=="Transmission Tariff")
			else if($('#refElementType').val()=="")
			{
				alert("Please select element type.");
				$('#refElementType').focus();
				return false;
			}
			else if($('#refElementSubType').val()=="" && $('#refElementSubType').children('option').length>1)
			{
				alert("Please select element subtype.");
				$('#refElementSubType').focus();
				return false;
			}
			else if($('#capacity').val()=="")
			{
				alert("Please enter capacity.");
				$('#capacity').focus();
				return false;
			}
			else if(filterDecimal.test($('#capacity').val())==false)
			{
				alert("Invalid capacity.")
				$('#capacity').focus();
				return false;
			}
			else if($('#assetType').val()!="E" && $('#approvedCompletionDate').val()=="")
			{
				alert("Please enter proposed completion date.");
				$('#approvedCompletionDate').focus();
				return false;
			}
			
			else if(dtRegex.test($('#approvedCompletionDate').val())==false && $('#assetType').val()!="E")
			{
				alert("Invalid date.")
				$('#approvedCompletionDate').focus();
				return false;
			}
			else if($('#assetType').val()!="E" && $('#anticipatedDocoDate').val()=="")
			{
				alert("Please enter anticipated DOCO.");
				$('#anticipatedDocoDate').focus();
				return false;
			}
			
			else if(dtRegex.test($('#anticipatedDocoDate').val())==false && $('#assetType').val()!="E")
			{
				alert("Invalid date.")
				$('#anticipatedDocoDate').focus();
				return false;
			}
				  
			
			else if($('#assetType').val()!="N" && $('#actualDocoDate').val()=="")
			{
				alert("Please enter actual DOCO.");
				$('#actualDocoDate').focus();
				return false;
			}	
			
				else if(dtRegex.test($('#actualDocoDate').val())==false && $('#assetType').val()!="N")
			{
				alert("Invalid date.")
				$('#actualDocoDate').focus();
				return false;
			}
// 			<!-- 			04-03-2020 end AK -->
			/* else if(Date.parse($('#anticipatedDocoDate').val())<Date.parse(crDt))
			{
				alert("Anticipated DOCO should be future date.");
				$('#anticipatedDocoDate').focus();
				return false;
			} */
			/* else if($('#revisedDocoDate').val()!="" && Date.parse($('#revisedDocoDate').val())<Date.parse(crDt))
			{
				alert("Revised DOCO should be future date.");
				$('#revisedDocoDate').focus();
				return false;
			} */
			/* else if($('#costOfProjectApproved').val()=="")
			{
				alert("Please enter approved investment cost.");
				$('#costOfProjectApproved').focus();
				return false;
			} 
			else if($('#investmentApprovalDate').val()=="")
			{
				alert("Please enter investment approval date.");
				$('#investmentApprovalDate').focus();
				return false;
			}
			else if(dtRegex.test($('#investmentApprovalDate').val())==false)
			{
				alert("Invalid date.")
				$('#investmentApprovalDate').focus();
				return false;
			}*/
			
			
		
			else if(investmentApprovalDate.getTime() > crDt.getTime())
			{
				alert("Investment approval date should not be future date.");
				$('#investmentApprovalDate').focus();
				return false;
			}
			/* else if(Date.parse($('#approvedCompletionDate').val())<Date.parse(crDt))
			{
				alert("Proposed completion date should be future date.");
				$('#approvedCompletionDate').focus();
				return false;
			} */
			/* else if($('#idc').val()=="")
			{
				alert("Please enter idc.");
				$('#idc').focus();
				return false;
			}
			 
			else if($('#iedc').val()=="")
			{
				alert("Please enter iedc.");
				$('#iedc').focus();
				return false;
			} */
			
			/* else{
				return false;
			} */
			/* for (var i = 0; i < assetName.length; i++)
			{
				//var filter =^[0-9]([.,][0-9]{1,2})?$
				var filter = /^([0-9]*)(\.)?[0-9]+$/;
				var chkCapacity=filter.test(capacity[i].value);
				if(assetType[i].value=="E")
				{
					if (assetName[i].value=="" || assetType[i].value=="" || capacity[i].value=="" ||  actualDoco[i].value=="")
					{
						alert("Please complete asset details.");
						return false;
					}
				}
				else if(assetType[i].value=="N")
				{
					if (assetName[i].value=="" || assetType[i].value=="" || capacity[i].value=="" ||  (anticipatedDoco[i].value=="" && actualDoco[i].value==""))
					{
						alert("Please complete asset details.");
						return false;
					}
				}
				else if(chkCapacity==false)
				{
					alert("Capacity should be numeric.");
					
					return false;
				}
								
			} */
		});
	});
	
	var incre=0;
	
	function fidAdd() {
		var x = $('.fidRepeat:first').clone().insertAfter(".fidRepeat:last");
		
		//alert(incre);
		//incre++;
		//x.find("#assetType").attr("id","assetType"+incre);
		//x.find("#assetType").attr("name","assetType"+incre);
		//alert(incre);
		
		x.find("#assetName").val("");
		x.find("#capacity").val("");
		x.find("#anticipatedDocoDate").val("");
		x.find("#actualDocoDate").val("");
		
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
		f_tcalAddOnload (f_tcalInit);
		f_tcalInit();
	}
	
	function fidDelete(e) {
		$(e).parents(".fidRepeat").remove();		
	}
</script>

<s:form theme="simple" name="respondentMapping" action="assetMasterSave" method="post" enctype="multipart/form-data">
	<table border="0">
		<tr>
			<th colspan="7" class="showGT mainheading">Unit Details</th>
			<th colspan="7" class="showTT mainheading">Assets Details</th>
		</tr>
		<tr valign="top" id = "regHide" >
			<td width="20%">Region<span class="required">*</span></td>
			<td width="1%">:</td>
			<td Colspan="5">
			<s:select list="refRegionList" name="refRegionName"
						id="refRegionId" listKey="id"
						listValue="region" headerKey="1"
						headerValue="All" cssStyle="width:142pt;" />
			</td>
		</tr>
		<tr valign="top">
			<td width="20%" class="showGT">Unit For<span class="required">*</span></td>
			<td width="20%" class="showTT">Asset For<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%">
				<s:select list="refPetitionTypeList" name="refPetitionTypeName"
						id="refPetitionTypeId" listKey="id"
						listValue="petitionType" headerKey=""
						headerValue="- Select -" cssStyle="width:142pt;" />
			</td>
			<td width="2%"></td>
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>
		</tr>
		<tr valign="top">
			<td class="showGT">Generation Station<span class="required">*</span></td>
			<td class="showTT">Project Name<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<s:select list="refGenerationTransmissionList" name="refGenerationTransmissionName"
						id="refGenerationTransmissionId" listKey="id"
						listValue="generationTransmissionName" headerKey=""
						headerValue="- Select -" cssStyle="width:284pt;" />
			<s:url action="addNewGenerationTransmission" var="addNewGenerationTransmission">
					<s:param name="struts.token.name">token</s:param>
					<s:param name="token" value="token"/>
					<s:param name="refPetitionTypeName" value="refPetitionTypeName"/>
					<s:param name="refRegionName" value="refRegionName"/>
					<s:param name="assetParam" value="1"/>
			</s:url>
			<s:a href="%{addNewGenerationTransmission}">Add New</s:a></td>
		</tr>
		<%-- <tr>
			<td colspan="7">
				<table border="0">
					<tr class="subheading" align="center">
						
						<td width="26%">Unit Name</td>
						<td width="8%">Unit Type</td>
						<td width="10%">Capacity</td>
						<td width="20%">Anti. DOCO Date</td>
						<td width="20%">DOCO Date</td>
						<td width="9%" align="right">Add More</td>
					</tr>
					<tr valign="top" class="fidRepeat">
						
						<td><s:textfield name="assetName" id="assetName" cssStyle="width:180pt"/></td>
						<td><s:select list="#{'':'- Select -','E':'Existing','N':'New'}" name="assetType" id="assetType"/></td>
						<td><s:textfield name="capacity" id="capacity" cssStyle="width:55pt"/></td>
						<td><s:textfield type="text" name="anticipatedDocoDate" id="anticipatedDocoDate" class="tcal" cssStyle="width:110pt"/></td>
						<td><s:textfield type="text" name="actualDocoDate" id="actualDocoDate" class="tcal" cssStyle="width:110pt"/></td>
						<td align="right">
							<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>
							<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
						</td>
					</tr>
				</table>
			</td>			
		</tr> --%>
		<tr valign="top">
			<td class="showGT">Unit Name (Refered As)<span class="tooltip">*</span></td>
			<td class="showTT">Asset / Element Name (Refered As)<span class="tooltip">*</span></td>
			<td>:</td>
			<td colspan="5"><s:textfield name="assetName" id="assetName" size="98"/></td>			
		</tr>
		<tr valign="top">
			<td class="showGT">Unit Details<span class="tooltip">*</span></td>
			<td class="showTT">Asset / Element Details<span class="tooltip">*</span></td>
			<td>:</td>
			<td colspan="5"><s:textfield name="assetDetails" id="assetDetails" size="98"/></td>
		</tr>
		<tr valign="top">
			<td class="showGT">Unit Type<span class="tooltip">*</span></td>
			<td class="showTT">Asset Type<span class="tooltip">*</span></td>
			<td>:</td>
			<td ><s:select list="#{'':'- Select -','E':'Existing','N':'New'}" name="assetType" id="assetType" cssStyle="width:142pt;"/></td>
			
			<td></td>
			<td class="assetSubTypeGT">Unit Sub Type<span class="tooltip">*</span></td>
			<td class="assetSubTypeTT">Asset Sub Type<span class="tooltip">*</span></td>
			<td class="assetSubType">:</td>
			<td class="assetSubType">
				<s:select list="#{'':'- Select -','Augumentation':'Augumentation','Replacement':'Replacement','Not Applicable':'Not Applicable'}" name="assetSubType" id="assetSubType" cssStyle="width:142pt;"/>
			</td>
		</tr>
		<tr valign="top">
			<td>Element Type<span class="tooltip">*</span></td>
			<td>:</td>
			<td>
			<%-- <s:if test="#this.refPetitionTypeId.id!=null"> --%>
			<%-- 	<s:select list="refElementTypeList.{? #this.refPetitionTypeId.id==4}" name="refElementTypeId"
						id="refElementType" listKey="id"
						listValue="description" headerKey=""
						headerValue="- Select -" cssStyle="width:142pt;"/>
			</td>
			<td class="showTT">
				<s:select list="refElementTypeList.{? #this.refPetitionTypeId.id==10}" name="refElementTypeId"
						id="refElementType" listKey="id"
						listValue="description" headerKey=""
						headerValue="- Select -" cssStyle="width:142pt;"/>
				</s:if>
				<s:else> --%>
				<%-- <s:select list="refElementTypeList.{? #this.refPetitionTypeId.id == #refPetitionTypeId}" name="refElementTypeId"
						id="refElementType" listKey="id"
						listValue="description" headerKey=""
						headerValue="- Select -" cssStyle="width:142pt;" class="showTT"/> --%>
				<%-- </s:else> --%>
				<s:select list="refElementTypeList" name="refElementTypeId"
						id="refElementType" listKey="id"
						listValue="description" headerKey=""
						headerValue="- Select -" cssStyle="width:142pt;"/>
			</td>
			<td></td>
			<td>Element Sub Type<span class="tooltip">*</span></td>
			<td>:</td>
			<td>
				<s:select list="refElementSubTypeList" name="refElementSubTypeId"
						id="refElementSubType" listKey="id"
						listValue="description" headerKey=""
						headerValue="- Select -" cssStyle="width:142pt;" />
			</td>
		</tr>
		<tr valign="top">
			<td class="showGT">Capacity (in MW)<span class="tooltip">*</span></td>
			<td class="showTT">ATC<span class="tooltip">*</span></td>
			<td>:</td>
			<td colspan="5">
				<s:textfield name="capacity" id="capacity" size="48"/>
				<br/>
				<span id="capacityerrmsg" class="tooltip"></span>
				<br/>
				<span class="tooltip showTT">Annual Transmission Charges for 1 Year in Rupees</span></td>
				
			</td>			
		</tr>
		<tr valign="top" class="subheading">
			<td colspan="7">Investment Details</td>			
		</tr>
		<tr valign="top">
			<td>Investment Approval Date</td>
			<td>:</td>
			<td colspan="5"><s:textfield type="text" name="investmentApprovalDate" id="investmentApprovalDate" class="tcal" cssStyle="width:130pt;"/></td>			
		</tr>
		<tr valign="top">
			<td>IDC</td>
			<td>:</td>
			<td>&#8377; <s:textfield type="text" name="idc" id="idc" size="24"/><br><span id="idcerrmsg" class="tooltip"></span></td>
			<td></td>
			<td>IEDC</td>
			<td>:</td>
			<td>&#8377; <s:textfield name="iedc" id="iedc" size="24"/><br><span id="iedcerrmsg" class="tooltip"></span></td>
		</tr>
		<tr valign="top">
			<td>Initial Cost Approved</td>
			<td>:</td>
			<td>&#8377; <s:textfield type="text" name="costOfProjectApproved" id="costOfProjectApproved" size="24"/><br><span id="costOfProjectApprovederrmsg" class="tooltip"></span></td>
			<td></td>
			<td>Revised Cost of Project</td>
			<td>:</td>
			<td>&#8377; <s:textfield name="revisedCostOfProject" id="revisedCostOfProject" size="24"/><br><span id="revisedCostOfProjecterrmsg" class="tooltip"></span></td>
		</tr>
		<tr valign="top">
			<td>Actual Cost of Project</td>
			<td>:</td>
			<td>&#8377; <s:textfield name="actualCostOfProject" id="actualCostOfProject" size="24"/><br><span id="actualCostOfProjecterrmsg" class="tooltip"></span></td>
			<td></td>	
			<td>Cost Overrun<br/>(% age)</td>
			<td>:</td>
			<td><s:textfield name="costOverRun" id="costOverRun" size="24"/><br><span id="costOverRunerrmsg" class="tooltip"></span></td>
		</tr>
		<tr valign="top">
			<td>Approved By</td>
			<td>:</td>
			<td colspan="5">
				<s:select list="#{'':'- Select -','Board Of Director':'Board Of Director','CEA':'CEA','DIA':'DIA','MOP':'MOP'}" name="approvedBy" id="approvedBy" cssStyle="width:142pt;"/>
			</td>
		</tr>
<%-- 		<tr valign="top">
			<td>Cost Overrun<br/>(% age)</td>
			<td>:</td>
			<td><s:textfield name="costOverRun" id="costOverRun" size="24"/><br><span id="costOverRunerrmsg" class="tooltip"></span></td>
			<td></td>	
			<td>Approved By</td>
			<td>:</td>
			<td>
				<s:select list="#{'':'- Select -','Board Of Director':'Board Of Director','CEA':'CEA','DIA':'DIA','MOP':'MOP'}" name="approvedBy" id="approvedBy" cssStyle="width:142pt;"/>
			</td>
		</tr>
 --%>		<tr valign="top">
			<td>Cost Overrun Reason</td>
			<td>:</td>
			<td colspan="5">
				<s:select list="refCostOverRunReasonList" name="refCostOverRunReason"
						id="refCostOverRunReason" listKey="id"
						listValue="description" headerKey=""
						headerValue="- Select -" cssStyle="width:284pt" />
			</td>
			
		</tr>
		<tr valign="top" class="subheading">
			<td colspan="7">Dates</td>			
		</tr>
		<tr valign="top">
			<td>Proposed/Actual Completion Date<span class="tooltip">*</span></td>
			<td>:</td>
			<td colspan="5"><s:textfield type="text" name="approvedCompletionDate" id="approvedCompletionDate" class="tcal" cssStyle="width:130pt;"/><br/><span class="tooltip">(For 'New Asset/Unit Type' only)</span></td>			
		</tr>
		<tr valign="top">
			<td>Anticipated DOCO<span class="tooltip">*</span></td>
			<td>:</td>
			<td><s:textfield type="text" name="anticipatedDocoDate" id="anticipatedDocoDate" class="tcal" cssStyle="width:130pt;"/><br/><span class="tooltip">(For 'New Asset/Unit Type' only)</span></td>
			<td></td>
			<td>Revised DOCO</td>
			<td>:</td>
			<td><s:textfield type="text" name="revisedDocoDate" id="revisedDocoDate" class="tcal" cssStyle="width:130pt"/></td>
		</tr>
		<tr valign="top">
			<td>Actual DOCO<span class="tooltip">*</span></td>
			<td>:</td>
			<td><s:textfield type="text" name="actualDocoDate" id="actualDocoDate" class="tcal" cssStyle="width:130pt"/><br/><span class="tooltip">(For 'Existing Asset/Unit Type' only)</span></td>
			<td></td>
			<td>Cut-Off Date</td>
			<td>:</td>
			<td><s:textfield type="text" name="cutoffDate" id="cutoffDate" class="tcal" cssStyle="width:130pt"/></td>			
		</tr>
		<tr valign="top">
			<td>Time Overrun<br/>(months)</td>
			<td>:</td>
			<td><s:textfield name="timeOverRun" id="timeOverRun" size="24"/><br><span id="timeOverRunerrmsg" class="tooltip"></span></td>
			<td></td>
			<td>Time Overrun Reason</td>
			<td>:</td>
			<td>
				<s:select list="refTimeOverRunReasonList" name="refTimeOverRunReason"
						id="refTimeOverRunReason" listKey="id"
						listValue="description" headerKey=""
						headerValue="- Select -" cssStyle="width:142pt" />
			</td>	
		</tr>
		<tr valign="top" class="subheading">
			<td colspan="7">Other Details</td>			
		</tr>
		<tr valign="top">
			<td>Remarks</td>
			<td>:</td>
			<td colspan="5"><s:textarea name="remarks" id="remarks" size="24" cols="100"/></td>			
		</tr>
		<tr valign="top" class="subheading">
			<td colspan="7">Attachments</td>			
		</tr>
		<tr>
			<td valign="top">Add More</td>
			<td valign="top">:</td>
			<td valign="top" colspan="5">
			<s:push value="refDocumentList"></s:push>
				<div class="fidRepeat">
					<s:select list="refDocumentList" name="fileUploadName" listKey="id" listValue="documentName" id="fileUploadName" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:120pt"/>
					&nbsp;<s:textfield type="text" size="24" name="documentDescription" id="documentDescription"/>
					&nbsp;<s:file name="fileUpload" id="fileUpload" label="Select a File to upload" cssStyle="width:130pt" onclick="resetInputBox(this);"/>
					&nbsp;<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>								        	
					<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
						
				</div>
				<br/>
				<span class="tooltip"><!-- (pdf / jpeg files only) -->(pdf,doc,excel,jpeg files only)</span>
				<br/>
				<br/>
				<span class="tooltip">Note : Consolidated, uploaded documents size should not exceed 300 MB.</span>	
			</td>									
		</tr>
		<tr>
			<td align="right" colspan="7">
				<input type="submit" id="savebutton" name="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp;
				<input type="reset" id="searchbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				<s:submit id="searchbutton" value="Cancel" cssClass="formbutton" action="assetMasterList"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>
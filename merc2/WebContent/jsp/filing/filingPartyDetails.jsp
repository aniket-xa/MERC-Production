<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
</script>

<script type="text/javascript">
	$(document).ready(function() {
     
		$("a[name='copyAddress']").click(function(){
        	$('#correspondenceAddress').val($('#address').val());
        	$('#refCorrespondenceStateId').val($('#refStateId').val());
        	$('#refCorrespondenceCityId').val($('#refCityId').val());
        	$('#correspondencePincode').val($('#pincode').val());
    	});
		
		$('input[name="sameAddr"]').click(function ()
				{
							if($('#sameAddr').is(':checked'))
							{
								$('#correspondenceAddress').val($('#address').val());
					        	$('#refCorrespondenceStateId').val($('#refStateId').val());
					        	$('#refCorrespondenceCityId').val($('#refCityId').val());
					        	$('#correspondencePincode').val($('#pincode').val());
							}
							else
							{
								$('#correspondenceAddress').val("");
					        	$('#refCorrespondenceStateId').val("");
					        	$('#refCorrespondenceCityId').val("");
					        	$('#correspondencePincode').val("");
							}
				});
				
				if($('#correspondenceAddress').val() != "" && $('#correspondenceAddress').val() === $('#address').val() && $('#refCorrespondenceStateId').val() === $('#refStateId').val() && $('#refCorrespondenceCityId').val() === $('#refCityId').val() && $('#correspondencePincode').val() === $('#pincode').val())
				{
					$("#sameAddr").attr("checked", true);
				}
				else
				{
					$("#sameAddr").attr("checked", false);
				}
		
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
		$("#correspondencePincode").on('keypress', function (e){
		    //alert("1 :"+e.keyCode);
		    	if (e.which == 13 ||e.which == 46 || e.which == 8 || e.keyCode == 9 || e.which == 27 || (e.which == 65 && e.ctrlKey == true) || (e.ctrlKey == true && (e.which == '118' || e.which == '86')) || (e.ctrlKey == true && (e.which == '99' || e.which == '67')) ||(e.ctrlKey == true && (e.which == '120' || e.which == '88')) || (e.keyCode >= 35 && e.keyCode <= 40)||(e.which >= 48 && e.which <= 57)) 
		        {
		    		//alert(e.which);
		        
		        	$("#correspondencePincodeerrmsg").html("Digits Only").hide();
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
	    			$("#correspondencePincodeerrmsg").html("Digits Only").show();
	    			//$('#pincode').val("");
	    			//return false; 
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
		$("input[name='savebutton']").click(function(){
			var sEmail = $('#email').val();	
			
			
			if ($('#respondentName').val()=="")
			{
				alert("Please enter Respondent Name");
				$('#respondentName').focus();
				return false;
			}
    		else if ($('#address').val()=="")
			{
				alert("Please enter address");	
				$('#address').focus();
				return false;
			}
    		else if ($('#refStateId').val()=="")
			{
				alert("please select state");
				$('#refStateId').focus();
				return false;
			}
    		else if ($('#refCityId').val()=="")
			{
				alert("Please select city");
				$('#refCityId').focus();
				return false;
			}
    			
    		else if ($('#pincode').val()=="" || $('#pincode').val().length<6)
			{
				alert("Please enter 6 Digit pin");	
				$('#pincode').focus();
				return false;
			}
    		else if ($('#correspondenceAddress').val()=="")
			{
				alert("Please enter correspondence address");
				$('#correspondenceAddress').focus();
				return false;
			}
    		else if ($('#refCorrespondenceStateId').val()=="")
			{
				alert("Please enter correspondence State");
				$('#refCorrespondenceStateId').focus();
				return false;
			}
    		else if ($('#refCorrespondenceCityId').val()=="")
			{
				alert("Please enter correspondence city");
				$('#refCorrespondenceCityId').focus();
				return false;
			}
    		else if ($('#correspondencePincode').val()=="" || $('#correspondencePincode').val().length<6)
			{
				alert("Please enter correspondence pin");
				$('#correspondencePincode').focus();
				return false;
			}
    			
    		else if ($('#contactNumber').val()=="" || $('#contactNumber').val().length<11)
			{
				alert("Enter number with STD code. \nContact number is either blank or not valid");
				$('#contactNumber').focus();
				return false;
			}
    		/* else if ($('#mobile').val()=="" || $('#mobile').val().length<10)
			{
				alert("Please enter mobile");	
				return false;
			} */
    		else if ($.trim(sEmail).length==0)
    		{
    			alert('Please enter valid email address');
    			$('#email').focus();
    			//e.preventDefault();
    			return false;
    		}
    		else if(!validateEmail(sEmail))
    		{
    			alert('Invalid Email Address');
       			//e.preventDefault();
       			$('#email').focus();
       			return false;
       		}
    		else
        	{
       			document.filingOtherResponentDetails.action="filingOtherResponentDetailsSave";
    			document.filingOtherResponentDetails.submit();
    			//return true;
        	}
		});
		
		$('select[name="cercOtherRespondent.refStateId.id"]').change(function () {
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
		
		$('select[name="cercOtherRespondent.correspondenceRefStateId.id"]').change(function () {
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
</script>

<s:include value="/jsp/tiles/tabs.jsp"></s:include>
	<s:form theme="simple" name="filingOtherResponentDetails">
	<s:hidden name="filingBeanId"/>
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Respondent Details</th>
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
		<s:hidden name="referenceNumber"/>
		<s:hidden name="referenceYear"/>
		<s:hidden name="referenceNumberDisplay"/>
		<s:hidden name="diaryNumber"/>
		<s:hidden name="diaryYear"/>
		<s:hidden name="diaryNumberDisplay"/>
		<s:hidden name="registrationNumber"/>
		<s:hidden name="registrationYear"/>
		<s:hidden name="registrationNumberDisplay"/>
		
		<tr>
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>
			<td width="2%"></td>
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>					
		</tr>
		<tr valign="top">
			<td>Respondent Name<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<s:textfield type="text" size="22" name="cercOtherRespondent.partyName" id="respondentName"/>
			</td>
		</tr>
		<tr class="subheading">
			<td colspan="3">Permanent Address</td>
			<td><a name="copyAddress" id="copyAddress" onclick="copyAddress(this);" href="javascript:void(0);">></a></td>
			<td colspan="3">Correspondence Address</td>
		</tr>
		<tr>
			<td>Address<span class="required">*</span></td>
			<td>:</td>
			<td><s:textarea cols="21" name="cercOtherRespondent.address" id="address"></s:textarea></td>
			<td></td>
			<td>Address<span class="required">*</span></td>
			<td>:</td>
			<td><s:textarea cols="21" name="cercOtherRespondent.correspondenceAddress" id="correspondenceAddress"></s:textarea></td>
		</tr>
		<tr>
			<td>State<span class="required">*</span></td>
			<td>:</td><s:url id="remoteurl" action="loadCities"/>
			<td><s:select list="refStateList" name="cercOtherRespondent.refStateId.id" listKey="id" listValue="stateName" theme="simple" id="refStateId" cssStyle="width:142pt" headerValue="- Select -" headerKey=""/></td>
			<td></td>
			<td>State<span class="required">*</span></td>
			<td>:</td>
			<td><s:select list="refStateList" name="cercOtherRespondent.correspondenceRefStateId.id" listKey="id" listValue="stateName" theme="simple" id="refCorrespondenceStateId" cssStyle="width:142pt" headerValue="- Select -" headerKey=""/></td>			
		</tr>
		<tr>
			<td>City<span class="required">*</span></td>
			<td>:</td>
			<td><s:select list="refCityList" name="cercOtherRespondent.refCityId.id" listKey="id" listValue="cityName" theme="simple" id="refCityId" cssStyle="width:142pt" headerValue="- Select -" headerKey=""/></td>
			<td></td>
			<td>City<span class="required">*</span></td>
			<td>:</td>
			<td><s:select list="refCityList" name="cercOtherRespondent.correspondenceRefCityId.id" listKey="id" listValue="cityName" theme="simple" id="refCorrespondenceCityId" cssStyle="width:142pt" headerValue="- Select -" headerKey=""/></td>			
		</tr>
		<tr>
			<td>Pincode<span class="required">*</span></td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="cercOtherRespondent.pinCode" id="pincode" maxlength="6" minlength="6"/><br><span id="pincodeerrmsg" class="tooltip"></span></td>
			<td></td>
			
			<td>Pincode<span class="required">*</span></td>
			<td>:</td>
			<td><s:textfield type="text" size="24" name="cercOtherRespondent.correspondencePinCode" id="correspondencePincode" maxlength="6" minlength="6"/><br><span id="correspondencePincodeerrmsg" class="tooltip"></span></td>
		</tr>
		<tr>
			<td colspan = "5"><s:checkbox name="sameAddr" id="sameAddr" fieldValue="true" /> Click here if Permanent address and Correspondence address are same</td>
		</tr>
		<tr class="subheading">
			<td colspan="7">Communication Details</td>	
		</tr>
		<tr align="left">
			<td>Landline Number<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:textfield type="text" size="24" name="cercOtherRespondent.contactNumber" id="contactNumber" maxlength="11"/><br><span id="contactNumbererrmsg" class="tooltip"></span></td>
		</tr>
		<tr align="left">
			<td>Mobile</td>
			<td>:</td>
			<td colspan="5"><s:textfield type="text" size="24" name="cercOtherRespondent.mobile" id="mobile" maxlength="11"/><br><span id="mobileerrmsg" class="tooltip"></span></td>
		</tr>
		<tr>
			<td>EMail Address<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:textfield type="text" size="22" name="cercOtherRespondent.email" id="email"/></td>	
		</tr>
		<tr><td colspan="7"></td></tr>
		<tr><td colspan="7" align="right">
		<input type="submit" id="savebutton" name="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp;
		<!-- 			04-02-2020 start AK -->
		<input type="reset" id="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
		<!-- 			04-02-2020 end AK -->
		<s:submit type="submit" id="cancelhbutton" value="Cancel" class="formbutton" action="filingMappingRespondentDetailsList"/>
		</td></tr>
	</table>
	<s:token/>
</s:form>	
            	
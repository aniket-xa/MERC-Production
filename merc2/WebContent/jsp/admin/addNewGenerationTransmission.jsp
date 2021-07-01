<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="js/inputFieldValidationFilter.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.regHide').hide();
		$("input[name='savebutton']").click(function(){
			var filterProject = /^([0-9a-zA-Z/ ,-]+)$/;
			var filterScope = /^([&lt;0-9a-zA-Z/,-]*)$/;
			var dtRegex = new RegExp(/\b\d{1,2}[/]\d{1,2}[/]\d{4}\b/);
			if($('#refRegionId').val()=="")
			{
				alert("Please select region.");
				$('#refRegionId').focus();
				return false;
			}
			else if($('#refPetitionTypeId').val()=="")
			{
				alert("Please select Asset For.");
				$('#refPetitionTypeId').focus();
				return false;
			}
			else if($('#refGenerationTransmissionName').val()=="")
			{
				alert("Please enter generation station.");
				$('#refGenerationTransmissionName').focus();
				return false;
			}
			else if(filterTextArea.test($('#refGenerationTransmissionName').val())==false)
			{					
				alert("Invalid generation station.");
				$('#refGenerationTransmissionName').focus();
				return false;
			}
			else if(filterTextArea.test($('#projectScope').val())==false)
			{					
				alert("Invalid scope.");
				$('#projectScope').focus();
				return false;
			}
			/* else if($('#investmentApprovalDate').val()=="")
			{
				alert("Please enter investment approval date.");
				$('#investmentApprovalDate').focus();
				return false;
			}
			else if(dtRegex.test($('#investmentApprovalDate').val())==false)
			{
				alert("Invalid Investment Approval date.")
				$('#investmentApprovalDate').focus();
				return false;
			}
			else if($('#idc').val()=="")
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
			}
			else if($('#costOfProjectApproved').val()=="")
			{
				alert("Please enter Initial Cost Approved.");
				$('#costOfProjectApproved').focus();
				return false;
			} */ 
			
			/* else if($('#approvedCompletionDate').val()=="")
			{
				alert("Please enter proposed completion date.");
				$('#approvedCompletionDate').focus();
				return false;
			} */
			else if($('#approvedCompletionDate').val()!=null && dtRegex.test($('#approvedCompletionDate').val())==false)
			{
				alert("Invalid Proposed Completion date.")
				$('#approvedCompletionDate').focus();
				return false;
			}
			
		});
		
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
		
	})
</script>
<div class="message">
	<s:fielderror />
	<s:actionerror />
	<s:actionmessage />
</div>
<s:form theme="simple" name="respondentMapping"
	action="addNewGenerationTransmissionSave">
	<s:hidden name="assetParam" />
	<table border="0">
		<tr>
			<th colspan="7" class="mainheading">Project / Station Details</th>
		</tr>
		<tr class = "regHide">
			<td width="20%">Region<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"><s:select list="refRegionList"
					name="refRegionName" id="refRegionId" listKey="id"
					listValue="region" headerKey="1" headerValue="All"
					cssStyle="width:284pt" /></td>
		</tr>
		<tr>
			<td width="20%">For<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"><s:select list="refPetitionTypeList"
					name="refPetitionTypeName" id="refPetitionTypeId" listKey="id"
					listValue="petitionType" headerKey="" headerValue="-- Select --"
					cssStyle="width:284pt" /></td>
			<td width="2%"></td>
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>
		</tr>
		<tr>
			<td>Project / Station / Line<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:textfield
					name="refGenerationTransmissionName"
					id="refGenerationTransmissionName" size="70" /></td>
		</tr>
		<tr>
			<td>Project / Station / Line Scope<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:textarea name="projectScope"
					id="projectScope" rows="4" cols="65" /></td>
		</tr>
		<tr valign="top" class="subheading">
			<td colspan="7"></td>
		</tr>
		<tr valign="top">
			<td>Investment Approval Date</td>
			<td>:</td>
			<td colspan="5"><s:textfield type="text"
					name="investmentApprovalDate" id="investmentApprovalDate"
					class="tcal" cssStyle="width:130pt;" /></td>
		</tr>
		<tr valign="top">
			<td>IDC</td>
			<td>:</td>
			<td>&#8377; <s:textfield type="text" name="idc" id="idc"
					size="24" /><br>
			<span id="idcerrmsg" class="tooltip"></span></td>
			<td></td>
			<td>IEDC</td>
			<td>:</td>
			<td>&#8377; <s:textfield name="iedc" id="iedc" size="24" /><br>
			<span id="iedcerrmsg" class="tooltip"></span></td>
		</tr>
		<tr valign="top">
			<td>Initial Cost Approved</td>
			<td>:</td>
			<td>&#8377; <s:textfield type="text" name="initialCostOfProject"
					id="costOfProjectApproved" size="24" /><br>
			<span id="costOfProjectApprovederrmsg" class="tooltip"></span></td>
			<td></td>
			<td>Revised Cost of Project</td>
			<td>:</td>
			<td>&#8377; <s:textfield name="revisedCostOfProject"
					id="revisedCostOfProject" size="24" /><br>
			<span id="revisedCostOfProjecterrmsg" class="tooltip"></span></td>
		</tr>
		<tr valign="top">
			<td>Actual Cost of Project</td>
			<td>:</td>
			<td>&#8377; <s:textfield name="actualCostOfProject"
					id="actualCostOfProject" size="24" /><br>
			<span id="actualCostOfProjecterrmsg" class="tooltip"></span></td>
			<td></td>
			<td>Cost Overrun<br />(% age)
			</td>
			<td>:</td>
			<td><s:textfield name="costOverRun" id="costOverRun" size="24" /><br>
			<span id="costOverRunerrmsg" class="tooltip"></span></td>
		</tr>
		<tr valign="top">
			<td>Approved By</td>
			<td>:</td>
			<td colspan="5"><s:select
					list="#{'':'- Select -','Board Of Director':'Board Of Director','CEA':'CEA','DIA':'DIA','MOP':'MOP'}"
					name="approvedBy" id="approvedBy" cssStyle="width:142pt;" /></td>
		</tr>
		<tr valign="top">
			<td>Cost Overrun Reason</td>
			<td>:</td>
			<td colspan="5"><s:select list="refCostOverRunReasonList"
					name="refCostOverRunReason" id="refCostOverRunReason" listKey="id"
					listValue="description" headerKey="" headerValue="- Select -"
					cssStyle="width:284pt" /></td>

		</tr>
		<tr valign="top" class="subheading">
			<td colspan="7">Dates</td>
		</tr>
		<tr valign="top">
			<td>Proposed Completion Date<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:textfield type="text"
					name="approvedCompletionDate" id="approvedCompletionDate"
					class="tcal" cssStyle="width:130pt;" /></td>
		</tr>
		<tr valign="top">
			<td>Time Overrun<br />(months)
			</td>
			<td>:</td>
			<td><s:textfield name="timeOverRun" id="timeOverRun" size="24" /><br>
			<span id="timeOverRunerrmsg" class="tooltip"></span></td>
			<td></td>
			<td>Time Overrun Reason</td>
			<td>:</td>
			<td><s:select list="refTimeOverRunReasonList"
					name="refTimeOverRunReason" id="refTimeOverRunReason" listKey="id"
					listValue="description" headerKey="" headerValue="- Select -"
					cssStyle="width:142pt" /></td>
		</tr>
		<tr>
			<td align="right" colspan="7"><input type="submit"
				id="savebutton" name="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp;<input
				type="reset" id="searchbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				<s:submit id="searchbutton" value="Cancel" cssClass="formbutton"
					action="projectStationMasterList" /></td>
		</tr>
	</table>
	<s:token />
</s:form>
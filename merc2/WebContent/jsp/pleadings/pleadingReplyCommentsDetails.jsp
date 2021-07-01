<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
	$(document).ready(function(){
		var crDt=new Date();
			$(".delete").hide();	
			
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
			
			$("input[name='submitbutton']").click(function()
			{
				var fUpload=document.getElementsByName("fileUpload");
				var fUploadName=document.getElementsByName("fileUploadName");
				var sEmail = $('#email').val();	
				var orderDateId=null,orderDateId1=null,orderDateId2=null,dateOfFiling=null;
				if ($("#orderDateId").val()!="")
				{
					
					var from = $("#orderDateId").val().split("/");
					orderDateId = new Date(from[2], from[1] - 1, from[0]);
				}
				if ($("#orderDateId1").val()!="")
				{
					var from = $("#orderDateId1").val().split("/");
					orderDateId1 = new Date(from[2], from[1] - 1, from[0]);
				}
				if ($("#orderDateId2").val()!="")
				{
					var from = $("#orderDateId2").val().split("/");
					orderDateId2 = new Date(from[2], from[1] - 1, from[0]);
				}
				if ($("#dateOfFiling").val()!="")
				{
					var from = $("#dateOfFiling").val().split("/");
					dateOfFiling = new Date(from[2], from[1] - 1, from[0]);
				}
				if($('#dateOfFiling').val()=="")
				{
					alert("Please enter date of filing reply / comment.");
					$('#dateOfFiling').focus();
					return false;
				}
				else if(dateOfFiling.getTime()>crDt.getTime())
				{
					alert("Date of filing reply should not be future date.");
					$('#dateOfFiling').focus();
					return false;
				}
				else if($('#orderDateId').val()=="" && ($('#orderDateId1').val()!="" || $('#orderDateId2').val()!=""))
				{
						alert("Please enter Order Date / Direction of Commission in order.");
						$('#orderDateId').focus();
						return false;
				} 
				else if($('#orderDateId').val()!="" && $('#orderDateId1').val()=="" && $('#orderDateId2').val()!="")
				{
					
						alert("Please enter Order Date / Direction of Commission in order.");
						$('#orderDateId1').focus();
						return false;
				}
				else if($('#orderDateId').val()!="" && orderDateId.getTime()>crDt.getTime())
				{
						alert("order date should not be future date.");
						$('#orderDateId').focus();
						return false;
				}
				else if($('#orderDateId1').val()!="" && orderDateId1.getTime()>crDt.getTime())
				{
						alert("order date should not be future date.");
						$('#orderDateId1').focus();
						return false;
				}
				else if($('#orderDateId2').val()!="" && orderDateId2.getTime()>crDt.getTime())
				{
						alert("order date should not be future date.");
						$('#orderDateId2').focus();
						return false;
				}
				else if($('#cercPetitionPartyDetailsId').val()==null ||$('#cercPetitionPartyDetailsId').val()=="")
				{
					if($('[name=cercPetitionPartyDetailsId]').val()=="")
					{
						alert("Please enter party name.");
						$('#cercPetitionPartyDetailsId').focus();
						return false;
					}
					else if ($('#contactNumber').val()=="" || $('#contactNumber').val().length<11)
	    			{
	    				alert("Enter number with STD code. \nContact number is either blank or not valid");
	    				$('#contactNumber').focus();
	    				return false;
	    			}
					else if($('#mobile').val()=="" || $('#mobile').val().length<10)
					{
						alert("Please enter mobile number.");
						$('#mobile').focus();
						return false;
					}
					
					else if(!validateEmail(sEmail))
	        		{
	        			alert('Invalid Email Address.');
	           			//e.preventDefault();
	           			return false;
	           		}
				}
				for (var i = 0; i < fUpload.length; i++) 
				{
					var fileExtension = (fUpload[i].value).substring((fUpload[i].value).lastIndexOf('.') + 1).toLowerCase();
					/* if (fileExtension!="pdf" || fUpload[i].value=="" || fUploadName[i].value=="") */
					if ((fileExtension!="pdf" && fileExtension!="doc" && fileExtension!="docx" &&  fileExtension!="xls" && fileExtension!="xlsx") || fUpload[i].value=="" || fUploadName[i].value=="")
					{
						alert("Please select / upload document")
						$('#refDocumentId').focus();
						return false;
					}
				}
				
				if($('#refDocumentId').val() == -1 && $('[name=documentDescription]').val()==""){
					alert("Please specify the document name");
					$("#documentDescription").focus();
					return false;
				}	
				
			});
	});

	function fidAdd() {
		$('.fidRepeat:first').clone().insertAfter(".fidRepeat:last").find("#attachedDocument").val("");
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
<s:include value="/jsp/tiles/tabsPleading.jsp"></s:include>
<s:form theme="simple" name="pleadingReplyCommentsDetails" action="pleadingReplyCommentsDetailsSave" method="post" enctype="multipart/form-data">
<s:hidden name="pleadingBeanId"/>
<s:hidden name="isReplyOrComment"/>
 	<table border = "0">
 		<s:if test="isReplyOrComment=='R'">
	 		<tr>
	 			<th colspan="7" class="mainheading">REPLY</th>
			</tr>
		</s:if>
		<s:elseif test="isReplyOrComment=='C'">
	 		<tr>
	 			<th colspan="7" class="mainheading">Comments / Objections</th>
			</tr>
		</s:elseif>
		<s:include value="/jsp/pleadings/pleadingPetitionDetails.jsp"></s:include>
		<tr valign="top">
			<tr class="subheading">
			<td colspan="7">Details</td>
		</tr>
		<tr valign="top">
			<td>Party Name<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
			<s:if test="cercPetitionPartyDetailsList!=null">
			<!-- 			04-02-2020 start AK -->
			<s:select list="cercPetitionPartyDetailsList" name="cercPetitionPartyDetailsId" id="cercPetitionPartyDetailsId" listKey="id" listValue="partyName" headerKey="" headerValue="- Select -"  cssStyle="width:142pt"/>
<!-- 			04-02-2020 end AK -->
			
			
<%-- 				<s:property value="cercPetitionPartyDetails.cercUserId.userName"></s:property> --%>
<%-- 				<s:hidden name="cercPetitionPartyDetailsId" id="cercPetitionPartyDetailsId" value="%{cercPetitionPartyDetails.id}"/> --%>
			</s:if>
			<s:elseif test="isReplyOrComment=='R'">
			<s:select list="cercPetitionPartyDetailsList" name="cercPetitionPartyDetailsId" id="cercPetitionPartyDetailsId" listKey="id" listValue="partyName" headerKey="" headerValue="- Select -"  cssStyle="width:142pt"/>
			</s:elseif>
			</td>								
		</tr>
		<tr valign="top">
			<td>Date of filing Reply<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
			<s:date name="dateOfFiling" format="dd/MM/yyyy" var="dateOfFilingFormat"/>
			<s:textfield name="dateOfFiling" id="dateOfFiling" cssClass="tcal" value="%{#dateOfFilingFormat}"/>&nbsp;<span class="tooltip">(dd/mm/yyyy)</span>
			</td>								
		</tr>
		<tr valign="top">
			<td>Date of ROP/Order/Direction of Commission</td>
			<td>:</td>
			<td colspan="5">
				<s:textfield name="orderDate" id="orderDateId" cssClass="tcal" value="" />&nbsp;&nbsp;
				<s:textfield name="orderDate1" id="orderDateId1" cssClass="tcal" value="" />&nbsp;&nbsp;
				<s:textfield name="orderDate2" id="orderDateId2" cssClass="tcal" value="" />
				<br/>
				<span class="tooltip">(dd/mm/yyyy)</span>
			</td>								
		</tr>
		<tr valign="top">
			<td>Brief</td>
			<td>:</td>
			<td colspan="5">
				<textarea name="description"  id="description" style="width:500pt"  cols="1000"></textarea>
			</td>								
		</tr>
		 <!-- and cercPetitionPartyDetails.size == 0 -->
<%-- 	
			in cerc the below section is no seen as they removed any one can add comment feature
	 <s:if test="isReplyOrComment=='C' and (cercPetitionPartyDetails==null or cercPetitionPartyDetails=='' or cercPetitionPartyDetails.size() == 0)"> --%>
		<s:if test="isReplyOrComment=='Z' and (cercPetitionPartyDetails==null or cercPetitionPartyDetails=='' or cercPetitionPartyDetails.size() == 0)">
			<tr valign="top">
			<td>Party Name<span class="tooltip">*</span></td>
			<td>:</td>
			<td colspan="5">
				<s:textfield name="partyName"  id="partyName" cssStyle="width:500pt" />
			</td>								
		</tr>
		<tr>
			<td>Organization Type</td>
			<td>:</td>
			<td colspan="5">
			<s:select list="refOrgnisationTypeList" listKey="id" listValue="organisationType" name="refOrganisationType.id" id="refOrganisationType" theme="simple" headerValue="- Select -" headerKey="-1" cssStyle="width:142pt"/>
			</td>
		</tr>	
		<tr class="subheading">
			<td colspan="7">Communication Details</td>	
		</tr>
		<tr align="left">
			<td>Contact Number<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:textfield type="text" size="48" name="contactNumber" id="contactNumber" maxlength="11"/><br><span id="contactNumbererrmsg" class="tooltip"></span></td>
		</tr>
		<tr align="left">
			<td>Mobile<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:textfield type="text" size="48" name="mobile" id="mobile" maxlength="10"/><br><span id="mobileerrmsg" class="tooltip"></span></td>
		</tr>
		<tr>
			<td>EMail Address<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5"><s:textfield type="text" size="48" name="email" id="email"/></td>	
		</tr>
		
		</s:if>
		<tr class="subheading">
			<td colspan="7">Attachment</td>
		</tr>
		<tr valign="top">
			<td>Document Type<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<div class="fidRepeat">
					<s:select list="refDocumentList" name="fileUploadName" listKey="id" listValue="documentName" id="refDocumentId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:142pt"/>
					&nbsp;<s:textfield type="text" size="24" name="documentDescription" id="documentDescription"/>
					&nbsp;<s:file name="fileUpload" id="attachedDocument" label="Select a File to upload" size=""/>
					<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>								        	
					<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
				</div>
				<span class="tooltip">(pdf,doc,excel files only)</span>
				<br/>
				<br/>
				<span class="tooltip">Note : Consolidated, uploaded documents size should not exceed 300 MB.</span>	
			</td>				
		</tr>
		
		<tr>
			<td colspan="7" align="right">
				<input type="submit" id="submitbutton" name="submitbutton" value="Submit" class="formbutton" />&nbsp;&nbsp;
				<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="pleadingList"/>				
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
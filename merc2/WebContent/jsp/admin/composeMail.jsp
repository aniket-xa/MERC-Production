<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="js/inputFieldValidationFilter.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		if ($('input:radio[name=userType]:checked').val() == "X") {
			$(".others").show();
        }
		else{
			$('#otherEmailAddress').val("");
			$(".others").hide();
		}
		$('input[name="userType"]').change(function () {
			if ($(this).val() == "X") {
				$(".others").show();
			}
			else{
				$('#otherEmailAddress').val("");
				$(".others").hide();
			}
		});
		
		
		
		
		$('#savebutton').click(function(){
			if ($('input:radio[name=userType]:checked').val() == "X" && $('#otherEmailAddress').val()==""){
				alert("Please enter email ID.");
				$('#otherEmailAddress').focus();
				return false;
			}
			if($('#subject').val()=="")
			{
				alert("Please enter subject.");
				$('#subject').focus();
				return false;
			}
			if($('#emailContent').val()=="")
			{
				alert("Please enter email content.");
				$('#emailContent').focus();
				return false;
			}
			if ($('input:radio[name=userType]:checked').val() == "Z") {
				var x=confirm('Are you sure, you want to send this mail to all organisations and advocates ?');
		    	if (x){
		    		return true;
		    	} 
		    	else{
		        	return false;
		    	}
			}
			
			if ($('input:radio[name=userType]:checked').val() == "O") {
				var x=confirm('Are you sure, you want to send this mail to all organisations ?');
		    	if (x){
		    		return true;
		    	} 
		    	else{
		        	return false;
		    	}
			}
			
			if ($('input:radio[name=userType]:checked').val() == "A") {
				var x=confirm('Are you sure, you want to send this mail to all advocates ?');
		    	if (x){
		    		return true;
		    	} 
		    	else{
		        	return false;
		    	}
			}
		});
		
	});
	
	function fidAdd() {
		$('.fidRepeat:first').clone().insertAfter(".fidRepeat:last").find("#fileUpload").val("");
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
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<s:form theme="simple" name="utrMaster" action="composeMailSave" method="post" enctype="multipart/form-data">
	<table border="0">
		<s:if test="hasActionMessages()">
			<tr align="left">
				<td colspan="3"><font color="red" size="3pt"><s:actionmessage/></font></td>
			</tr>
		</s:if>
		<tr>
			<th colspan="3" class="mainheading">Compose E-Mail</th>
		</tr>
		<tr>
			<td colspan="3">
			<s:radio list="#{'Z':'All (Organisations & Advocates)','O':'All Organization','A':'All Advocate','X':'Other Users'}" name="userType" id="userType" theme="simple" value="%{'Z'}"/>
			</td>
		</tr>
		<tr class="others">
			<td width="15%">Email ID<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="*"><s:textfield name="otherEmailAddress" id="otherEmailAddress" size="100"/></td>
		</tr>
		<tr>
			<td width="15%">Subject<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="*"><s:textfield name="subject" id="subject" size="100"/></td>
		</tr>
		<tr>
			<td>E-Mail Content<span class="required">*</span></td>
			<td>:</td>
			<td><s:textarea name="emailContent" id="emailContent" cols="1000" cssStyle="width:500pt"/></td>
		</tr>
		<tr>
			<td valign="top">Add Attachment</td>
			<td valign="top">:</td>
			<td valign="top">
				<span class="fidRepeat">
					&nbsp;<s:file name="fileUpload" id="fileUpload" label="Select a File to upload" cssStyle="width:130pt" onclick="resetInputBox(this);"/>
					<%-- &nbsp;<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>								        	
					<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span> --%>
				</span>
				<br/>
				<span class="tooltip">(pdf / jpeg files only)</span>
				<br/>
				<br/>
				<span class="tooltip">Note : Consolidated, uploaded documents size should not exceed 300 MB.</span>	
			</td>									
		</tr>
		<tr>
			<td align="right" colspan="3">
				<input type="submit" id="savebutton" name="savebutton" value="Send" class="formbutton" />&nbsp;&nbsp;
				<input type="reset" id="searchbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				<s:submit id="searchbutton" value="Cancel" cssClass="formbutton" action="cercBulkCommunicationList"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>
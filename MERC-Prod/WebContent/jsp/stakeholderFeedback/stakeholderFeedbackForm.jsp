<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="js/inputFieldValidationFilter.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/userValidation.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
<script src="inputFieldValidationFilter.js"></script>
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<script>
	  
	
function validate(){
    if ((document.form.stakeholdername.value=="") || (document.form.stakeholderdesignation.value=="")||(document.form.stakeholdercontactnumber.value=="")||(document.form.stakeholdersubject.value=="")||(document.form.stakeholdergrievances.value=="")||(document.form.stakeholderemail.value=="")){
        alert("You must fill in all of the required fields!")
        return false
    }
    else
        return true
}
	
</script>
  <div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div> 
   <s:form theme="simple" name = "stakeHolderFeedbackform" action= "stakeholderFeedbackSubmit"  onsubmit="return validate()" method="post" validate="true" enctype="multipart/form-data" id="form_id" >
		<table border="0">
			<s:if test="hasActionMessages()">
				<tr align="left">
					<td colspan="3"><font color="red" size="3pt"><s:actionmessage/></font></td>
				</tr>
			</s:if>
			<tr>
				<th colspan="3" class="mainheading">FeedBack Form</th>
			</tr>
			<table border="0">
				<tr>
			    	<td width="15%">Name<span class="required">*</span></td>
					<td width="1%">:</td>
					<td width="*"><s:textfield name="stakeholderName" id="stakeholderName" size="50" maxlength="40" requiredLabel="true" theme="simple" /></td>
				</tr>
				<tr>
					<td width="15%">Email Id<span class="required">*</span></td>
					<td width="1%">:</td>
					<td width="*"><s:textfield name="stakeholderEmail" id="stakeholderEmail" size="50"  maxlength="40"/></td>				
				</tr>
				<tr>
			    	<td width="15%">Designation<span class="required">*</span></td>
					<td width="1%">:</td>
					<td width="*"><s:textfield name="stakeholderDesignation" id="stakeholderDesignation" size="50"  maxlength="40" theme="simple"/></td>
				</tr>
				<tr>
		    		<td width="15%">Contact no.<span class="required">*</span></td>
					<td width="1%">:</td>
					<td width="*"><s:textfield name="stakeholderContactNumber" id="stakeholderContactNumber" size="50"  maxlength="10" theme="simple"/></td>
				</tr>			
				<tr>
					<td>Subject<span class="required">*</span></td>
					<td>:</td>
					<td><s:textfield name="stakeholderSubject" size="50"  theme="simple"/></td>
				</tr>
				<tr>
					<td>Grievances/Queries<span class="required">*</span></td>
					<td>:</td>
					<td><s:textarea name="stakeholderGrievances" id="stakeholderGrievances" cols="500" rows="10" cssStyle="width:550pt"  theme="simple"/></td>
				</tr>	
				<tr>
					<td align="right" colspan="3">
						<input type="submit" id="savebutton" name="savebutton" value="Submit"  action= "stakeholderFeedbackSubmit" class="formbutton"/>&nbsp;&nbsp;
						<input type="reset" id="searchbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
						<s:submit id="searchbutton" value="Cancel" cssClass="formbutton" action="login" />
					</td>
				</tr>
				<tr class="subheading">
					<td colspan="7">You can also write/mail for all queries, training slots dates, grievances, feedback, suggestions etc to the following :</td>
				</tr>
				<tr class='white_td'>
					<td colspan="7" align="center">
						
						e-mail :asim.shaikh@merc.gov.in<br/><br/>
					 Maharashtra Electricity Regulatory Commission,<br/>
						World Trade Centre,Centre No.1,<br/>
 				13th Floor,Cuffe Parade,<br/>
 					Colaba, Mumbai-400005<br/><br/>
							 Ph: 091-22-22163964/65/69<br/>
			Fax: 091-22-22163976<br/><br/>
 				e-mail :mercindia@merc.gov.in</td> 
						
					</td>
				</tr>
				<tr class="subheading">
					<td colspan="7">You can also write/mail for all queries, training slots dates to the following :</td>
				</tr>
				<tr class='white_td'>
					<td colspan="7" align="center">
						Asim Shaikh<br/> <br/> 
						e-mail : asim.shaikh@merc.gov.in<br/><br/>
						
					</td>
				</tr>					
		</table>		
	</table>
	<s:token/>
</s:form>
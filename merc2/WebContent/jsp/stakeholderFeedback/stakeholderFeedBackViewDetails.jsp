<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<script src="js/inputFieldValidationFilter.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
	
</script>
<script type="text/javascript">

</script>
<div class="message">
	<s:fielderror />
	<s:actionerror />
	<s:actionmessage />
</div>
<s:form theme="simple" name="stakeholderFeedBackDetailsUpdateForm" id="stakeholderFeedBackDetailsUpdateForm"
	action="stakeholderFeedBackDetailsUpdate" method="post">
	<s:hidden name="cercStakeholderFeedback.id" />
	<s:hidden name="cercStakeholderFeedback.stakeholderName" />
	<%-- <s:hidden name="cercStakeholderFeedback.stakeholderEmail" /> --%>
	<s:hidden name="cercStakeholderFeedback.stakeholderDesignation" />
	<s:hidden name="cercStakeholderFeedback.stakeholderContactNumber" />
	<s:hidden name="cercStakeholderFeedback.stakeholderSubject" />
	<s:hidden name="cercStakeholderFeedback.stakeholderGrievances" />
	<s:hidden name="cercStakeholderFeedback.stakeholderEmail" />
	<s:hidden name="cercStakeholderFeedback.stakeholderFeedbackDate" />
	
	<table border="0">
	
		 <tr>
			<th colspan="7" class="mainheading">FeedBack Review - Feedback Date : <s:date name="cercStakeholderFeedback.stakeholderFeedbackDate" format="dd/MM/yyyy"/></th>
		</tr>
		
		<tr>
		
			<td width="20%">Name</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercStakeholderFeedback.stakeholderName" /></td>
			<td width="2%"></td>
		</tr>
		<tr>
			<td>EMail Address</td>
			<td>:</td>
			<td colspan="5"><s:property value="cercStakeholderFeedback.stakeholderEmail" /></td>
		</tr>
		
		<tr>
			<td width="20%">Designation</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercStakeholderFeedback.stakeholderDesignation" /></td>
			<td width="2%"></td>
		</tr>
		
		<tr align="left">
			<td>Contact Number</td>
			<td>:</td>
			<td><s:property value="cercStakeholderFeedback.stakeholderContactNumber" /></td>
		</tr>
		<tr>
			<td width="20%">Subject</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercStakeholderFeedback.stakeholderSubject" /></td>
			<td width="2%"></td>
		</tr>
		<tr>
			<td width="20%">Grievances/Queries</td>
			<td width="1%">:</td>
			<td width="28%"><s:property value="cercStakeholderFeedback.stakeholderGrievances" /></td>
			<td width="2%"></td>
		</tr>
		
		<tr class="subheading">
			<td colspan="7">Remarks</td>
		</tr>
		
		 <tr>
			<td>Remarks<span class="required">*</span></td>
			<td>:</td>
		    <td><s:property value="cercStakeholderFeedback.cercStakeholderFeedbackRemarks" /><br><s:textarea name="cercStakeholderFeedback.cercStakeholderFeedbackRemarks" id="cercstakeholderfeedbackremarks" cols="1000" cssStyle="width:250pt" value="%{#cercStakeholderFeedback.cercStakeholderFeedbackRemarks}"/></td>
		</tr>
		
		 <tr class="subheading">
			<td colspan="7">Status</td>
		</tr>
		
		<tr>
			<td>Status<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<s:radio list="refStatusList" name="cercStakeholderFeedback.stakeholderStatusId.id" id="stakeholderStatusId" listKey="id" listValue="statusName" theme="simple" value="cercStakeholderFeedback.stakeholderStatusId.id" /> 
			</td> 
		</tr>
		
		<tr>
			<td colspan="7" align="right"><s:submit id="savebutton"
					name="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp; 
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel"
					class="formbutton" action="stakeholderFeedbackList" /></td>
		</tr>
		                                    
	</table>
	<s:token />
</s:form>
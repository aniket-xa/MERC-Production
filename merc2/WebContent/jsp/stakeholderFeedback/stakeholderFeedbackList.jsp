<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>

<script type="text/javascript">
 function deleteConfirmation() 
{
    var x=confirm('Are you sure you want to delete ?');
    if (x) 
    {
    	return true;
    } 
    else 
    {
        return false;
    }
    
} 

</script>
	<s:form theme="simple" name="feedbackList">
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">FeedBack List</th>
		</tr>
		<tr>
			<td colspan="7">
				<table border = "0" >
					<tr class="subheading">
						<td width="6%">S. No.</td>
						<!-- <td width="6%"> ID </td> -->
						<td width="20%">Name</td>
						<td width="20%">Subject</td>
						<td width="20%">Status</td>
						<td width="20%">Date</td>
					</tr>
					<s:if test="stakeholderFeedbackList.size()>0">
						<s:iterator value="stakeholderFeedbackList" status="rowstatus">
							<tr class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
								<td>
						 			<s:url var="url" action="stakeholderFeedBackViewDetails">
										<s:param name="struts.token.name">token</s:param>
										<s:param name="token" value="token"/>
										<s:param name="cercStakeholderFeedbackId" value="id"/>
					    			</s:url>
					    			<s:if test="stakeholderStatusId.statusCode!='36' and stakeholderStatusId.statusType=='B'">
										<s:a href="%{url}"><s:property value="#rowstatus.count"/></s:a>
									</s:if>
									<s:else><s:property value="#rowstatus.count"/></s:else>
								</td>
								<td><s:property value="stakeholderName"/></td>
								<td><s:property value="stakeholderSubject"/></td>
								<td><s:property value="stakeholderStatusId.statusName"/></td>
								<td><s:date name="stakeholderFeedbackDate" format="dd/MM/yyyy"/><!-- <br/> -->  at   <s:date name="stakeholderFeedbackDate" format="hh:mm a"/></td>
							</tr>
						</s:iterator>
					</s:if>					
				</table>
			</td>
		</tr>
		<tr>
			<td align="right" colspan="7">
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	

            	
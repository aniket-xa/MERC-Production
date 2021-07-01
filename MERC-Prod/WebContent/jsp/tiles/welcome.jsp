<%@ taglib uri="/struts-tags" prefix="s"%>

<%-- 	<s:if test="hasActionMessages()">
	<s:iterator value = "actionMessages">
		<script language = "JavaScript">
			alert ("<s:property escape ="false "/>");
		</script>
	</s:iterator>
</s:if> --%>

<script type="text/javascript">
	function inProcess(){
		document.pendingRegistrationApproval.action="inProcess";
		document.pendingRegistrationApproval.submit();
	}
	
	function forCalrification(){
		document.pendingRegistrationApproval.action="forCalrification";
		document.pendingRegistrationApproval.submit();
	}
	      	
</script>
<script type="text/javascript">
$(document).ready(function() {
	call();
	$("#reportWindow").click(function(event) {
	    	   event.preventDefault();
	           event.stopPropagation();
	           winddd = window.open(this.href,"report",'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no');
	       });
	});
</script>	

<!-- 05-05-2020 start AK -->
		 
<%-- <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>       --%>
<script src="js/chart.min.js"></script>

<style type="text/css">
.messages {
	background-color:#991111;
	color: #FFFFFF;
	border:1px solid #CC0000;    
	width:500px;
	margin-bottom:8px;
}

</style>
<h2 style="padding-left: 72px;">Welcome</h2>

<!-- 05-05-2020 end AK -->
<!-- <h4>The status of petitions is as on 31/03/2016</h4> -->
<s:if test="messageToShow!=null">
	<div class="messages">
    	<s:property value="messageToShow"/>
	</div>
	
	<s:a action="openAcknowledgement">
		<s:param name="struts.token.name" value="%{'token'}"/>
		<s:param name="token" value="token"/>
	   	<s:param name="filingBeanId" value="%{filingBeanId}"/>
	   	<s:param name="reportName" value="'diaryAcknowledgement.rptdesign'"/>
	</s:a>
</s:if>         

                <s:if test="#session.CERC_USER.refStatusId.statusCode!='A'">
                <li>
                <s:if test="#session.CERC_USER.refStatusId.statusCode=='I' or #session.CERC_USER.refStatusId.statusCode=='C' or #session.CERC_USER.refStatusId.statusCode=='R'">
                <h4 class="h4-green"><span>Your Registration Status - (<s:property value="#session.CERC_USER.refStatusId.statusName"/> )</span></h4>
                <h5 class="h4-green"><span>To edit your profile click on 'view profile'.</span></h5>
                <s:if test="#session.CERC_REJECTION_REASON!=null">
                <font>Rejection Reason:</font><h3><s:property value="#session.CERC_REJECTION_REASON.rejectionReason"/></h3>
                </s:if>
                </s:if>
                </li>
                
	
<%-- 					<s:if test="#session.CERC_USER.userType=='A'"> --%>
<%-- 					<s:a action="openReportTemplateReport1"> --%>
<%-- 					<s:param name="struts.token.name" value="%{'token'}"/> --%>
<%-- 					<s:param name="token" value="token"/> --%>
<%-- 	   				<s:param name="userName" value="%{#session.CERC_USER.id}"/> --%>
<%-- 	   				<s:param name="cercUserId" value="%{#session.CERC_USER.id}"/> --%>
<%-- 					<s:param name="reportName" value="'registrationFormAdvocate.rptdesign'"/> --%>
<!-- 					<input type="button" id="printbutton" name="printbutton" value="Print Registration Form" class="formbutton"/> -->
<%-- 					</s:a> --%>
<%-- 					</s:if> --%>
<%-- 					<s:if test="#session.CERC_USER.userType=='E'"> --%>
<%-- 					<s:a action="openReportTemplateReport1"> --%>
<%-- 					<s:param name="struts.token.name" value="%{'token'}"/> --%>
<%-- 					<s:param name="token" value="token"/> --%>
<%-- 	   				<s:param name="userName" value="%{#session.CERC_USER.id}"/> --%>
<%-- 	   				<s:param name="cercUserId" value="%{#session.CERC_USER.id}"/> --%>
<%-- 					<s:param name="reportName" value="'registrationFormEmployee.rptdesign'"/> --%>
<!-- 					<input type="button" id="printbutton" name="printbutton" value="Print Registration Form" class="formbutton"/> -->
<%-- 					</s:a> --%>
<%-- 					</s:if> --%>
<%-- 					<s:if test="#session.CERC_USER.id!=1"> --%>
<%-- 					<s:if test="#session.CERC_USER.userType=='I'"> --%>
<%-- 					<s:a action="openReportTemplateReport1"> --%>
<%-- 					<s:param name="struts.token.name" value="%{'token'}"/> --%>
<%-- 					<s:param name="token" value="token"/> --%>
<%-- 	   				<s:param name="userName" value="%{#session.CERC_USER.id}"/> --%>
<%-- 	   				<s:param name="cercUserId" value="%{#session.CERC_USER.id}"/> --%>
<%-- 					<s:param name="reportName" value="'registrationFormIndividual.rptdesign'"/> --%>
<!-- 					<input type="button" id="printbutton" name="printbutton" value="Print Registration Form" class="formbutton"/> -->
<%-- 					</s:a> --%>
<%-- 					</s:if> --%>
<%-- 					</s:if> --%>
<%-- 					<s:if test="#session.CERC_USER.userType=='O'"> --%>
<%-- 					<s:a action="openReportTemplateReport1"> --%>
<%-- 					<s:param name="struts.token.name" value="%{'token'}"/> --%>
<%-- 					<s:param name="token" value="token"/> --%>
<%-- 	   				<s:param name="userName" value="%{#session.CERC_USER.id}"/> --%>
<%-- 	   				<s:param name="cercUserId" value="%{#session.CERC_USER.id}"/> --%>
<%-- 					<s:param name="reportName" value="'registrationFormOrganisation.rptdesign'"/> --%>
<!-- 					<input type="button" id="printbutton" name="printbutton" value="Print Registration Form" class="formbutton"/> -->
<%-- 					</s:a> --%>
<%-- 					</s:if> --%>
					</s:if>
				
					
				
				
				
				
				
				
				<%-- <s:if test="#session.CERC_USER.userType=='A'">
					<s:a id="reportWindow" href="/cerc/run?__report=registrationFormAdvocate.rptdesign&userName=%{cercUser.id}&__format=pdf">
						<input type="button" id="printbutton" name="printbutton" value="Print Registration Form" class="formbutton"/>
					</s:a>
				</s:if>
				<s:if test="#session.CERC_USER.userType=='E'">
					<s:a id="reportWindow" href="/cerc/run?__report=registrationFormEmployee.rptdesign&userName=%{cercUser.id}&__format=pdf">
						<input type="button" id="printbutton" name="printbutton" value="Print Registration Form" class="formbutton"/>
					</s:a>
				</s:if>
				<s:if test="#session.CERC_USER.userType=='I'">
					<s:a id="reportWindow" href="/cerc/run?__report=registrationFormIndividual.rptdesign&userName=%{cercUser.id}&__format=pdf">
						<input type="button" id="printbutton" name="printbutton" value="Print Registration Form" class="formbutton"/>
					</s:a>
				</s:if>
				<s:if test="#session.CERC_USER.userType=='O'">
					<s:a id="reportWindow" href="/cerc/run?__report=registrationFormOrganisation.rptdesign&userName=%{cercUser.id}&__format=pdf">
						<input type="button" id="printbutton" name="printbutton" value="Print Registration Form" class="formbutton"/>
					</s:a>
				</s:if> --%>
                
                <%-- <s:a id="reportWindow" href="/cerc/run?__report=registrationForm.rptdesign&userName=%{#session.CERC_USER.id}&__format=pdf">
				<input type="button" id="printbutton" name="printbutton" value="Print Registration Form" class="formbutton"/>
				</s:a> --%>
               
                 <!--  <div>
					<img src="LineChart.jpeg" height="300" width="500"/>
				</div> -->
				
				 <s:if test="#session.CERC_USER.id==1">
				<!-- 05-05-2020 start AK -->
<div style = "width:600px; padding-top:50px">
				 <canvas id="myChart"  style="height: 400px; max-width: 700px; margin: 0px auto;"></canvas>
				 <script src="js/chart.js"></script >			 
</div>
<!-- 05-05-2020 end AK -->
				
				
<!-- 				<div> -->
<%--                 	<jsp:include page="chart.jsp"></jsp:include> --%>
<!--                 </div> -->
                </s:if> 
                <s:if test="#session.CERC_USER.id!=1">
                <div>
                <table border = "0">
					<tr style="text-align: justify;text-justify: inter-word;">
						 <td>MERC has made all endeavour to provide updated, correct and accurate information about petition status. However MERC shall accept no responsibility and the users are advised to verify the correctness of the information from the records of the Commission.</td>
					</tr>
					<tr style="text-align: justify;text-justify: inter-word;">
						<td>Only following information will be shown for Petitions not filed through e-filling portal and migrated:-</td>
					</tr>
					<tr style="text-align: justify;text-justify: inter-word;">
						<td>
							<table border = "1" cellspacing="0" cellpadding="0">
								<tr align="center"><th class="mainheading">S. No.</th><th class="mainheading">Field Name</th></tr>
								<tr style="text-align: justify;text-justify: inter-word;">
									<td>1</td>
									<td>Diary Number<br/>(It is an auto generated number for migrated petitions).</td>
								</tr>
								<tr style="text-align: justify;text-justify: inter-word;">
									<td>2</td>
									<td>Diary Date<br/>(Petition date is considered as Diary Date for migrated petitions)</td>
								</tr>
								<tr style="text-align: justify;text-justify: inter-word;">
									<td>3</td>
									<td>Petition Number</td>
								</tr>
								<tr style="text-align: justify;text-justify: inter-word;">
									<td>4</td>
									<td>Petition Date</td>
								</tr>
								<tr style="text-align: justify;text-justify: inter-word;">
									<td>5</td>
									<td>Petition Type</td>
								</tr>
								<tr style="text-align: justify;text-justify: inter-word;">
									<td>6</td>
									<td>Subject</td>
								</tr>
								<tr style="text-align: justify;text-justify: inter-word;">
									<td>7</td>
									<td>Petition Status</td>
								</tr>
								<tr style="text-align: justify;text-justify: inter-word;">
									<td>8</td>
									<td>Petition Details</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
                </div>
                </s:if>
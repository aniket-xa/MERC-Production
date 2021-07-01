<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">
// 	function filingGeneralInformation(){
// 		document.filingPartyDetailsList.action="filingGeneralInformation?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
// 		document.filingPartyDetailsList.submit();
// 	}


$(document).ready(function() {
	
	$("#cercUserrId").hide();
	
	$('select[name="level"]').change(function () {
		  var deptId = $(this).val();
		if(deptId =='-1'){
   		 $("#cercUserrId").hide(); 
   	 }
		else{		
		 $("#cercUserrId").get(0).options.length = 0;
	        $("#cercUserrId").get(0).options[0] = new Option("- Select -", "");
   
// 				var deptId = null;
		     $.ajax({
		    	    url: "loadcercuser",
		            data : {
           			deptId:deptId,
		            	cercUserList:"",
		            },
		            dataType: "json",
		            type: 'POST',
		            success: function(cercUserList) {
		            	
		            	 $.each(cercUserList, function (id, cercUser) {
		            		 $.each(cercUser, function(id,lastName){
		            			console.log(lastName.id,lastName.lastName+''+lastName.firstName);
			            		 $("#cercUserrId").get(0).options[$("#cercUserrId").get(0).options.length] = new Option(lastName.firstName+'  '+lastName.lastName,lastName.id);
		            		 });
		                }); 
		            	 
		            	 $('#cercUserrId').show();
		                	$('#cercUserrId').focus();
		            },
		             error: function() {
		            	 alert("Failed to load Employee");
		            }
		        });
		}
			});
	
	
	$('input[name="updatebutton"]').click(function (){
		
		 if($('#cercUserrId').val()=="")
		{
			alert('Please select Employee and level from Dropdown.')
			$('#level').focus()
			return false; 
		}
		 else{
		 document.filingPartyDetailsList.action="updatelevl";
			document.filingPartyDetailsList.submit()
	    	return true; 
		 }
		
			});		
	
	
	
	
	
});
	
	function forword(){
		document.filingPartyDetailsList.action="firstlevl?struts.token.name=token&token=<s:property value="token"/>";
		document.filingPartyDetailsList.submit();
	}  
	
	function filingSummary(){
		document.filingPartyDetailsList.action="filingSummary?struts.token.name=token&token=<s:property value="token"/>";
		document.filingPartyDetailsList.submit();
		
			
		
	
	}  
	function filingSummary1(){
		document.filingPartyDetailsList.action="filingNodalOfficerDetails2?struts.token.name=token&token=<s:property value="token"/>&filingBeanId=<s:property value="filingBeanId"/>";
		document.filingPartyDetailsList.submit();
	} 
	
	function update(){
		document.filingPartyDetailsList.action="updatelevl";
		document.filingPartyDetailsList.submit();
	} 

	
	
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
* {
  box-sizing: border-box;
}

body {
  background-color: #474e5d;
  font-family: Helvetica, sans-serif;
   
}

/* The actual timeline (the vertical ruler) */
.timeline {
  position: relative;
  max-width: 1200px;
  margin: 0 auto;
  border: 1px solid Black;
}

/* The actual timeline (the vertical ruler) */
.timeline::after {
  content: '';
  position: absolute;
  width: 6px;
  background-color: white;
  top: 2%;
  bottom:6%;
  left: 5%;
  margin-left: -3px;
  border: 1px solid Black;
}

/* Container around content */
.container {
  padding: 10px 40px;
  position: relative;
  background-color: inherit;
  width: 70%;
  order: 1px solid Black;
}

/* The circles on the timeline */
.container::after {
  content: '';
  position: absolute;
  width: 25px;
  height: 25px;
  right: -17px;
  background-color: white;
  border: 4px solid #FF9F55;
  top: 15px;
  border-radius: 50%;
  z-index: 1;
}

/* Place the container to the left */
.left {
  left: 0;
}

/* Place the container to the right */
.right {
  left: 5%;
}

/* Add arrows to the left container (pointing right) */
.left::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  right: 30px;
  border: 1px solid Black;
  border-width: 10px 0 10px 10px;
  border-color: transparent transparent transparent Black;
}

/* Add arrows to the right container (pointing left) */
.right::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  left: 30px;
   border: 1px solid Black;
  border-width: 10px 10px 10px 0;
  border-color: transparent Black transparent transparent;
}

/* Fix the circle for containers on the right side */
.right::after {
  left: -16px;
}

/* The actual content */
.content {
  padding: 20px 30px;
  background-color: white;
  position: relative;
  border-radius: 6px;
  border: 1px solid Black;
}

/* Media queries - Responsive timeline on screens less than 600px wide */
@media screen and (max-width: 600px) {
  /* Place the timelime to the left */
  .timeline::after {
  left: 31px;
  }
  
  /* Full-width containers */
  .container {
  width: 100%;
  padding-left: 70px;
  padding-right: 25px;
  }
  
  /* Make sure that all arrows are pointing leftwards */
  .container::before {
  left: 60px;
  border-width: 10px 10px 10px 0;
  border-color: transparent white transparent transparent;
  
  }

  /* Make sure all circles are at the same spot */
  .left::after, .right::after {
  left: 15px;
  }
  
  /* Make all right containers behave like the left ones */
  .right {
  left: 0%;
  }
}
</style>

<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<%-- <s:include value="/jsp/tiles/tabs.jsp"></s:include> --%>
<s:form theme="simple" name="filingPartyDetailsList">
<s:hidden name="filingBeanId"/>
<s:hidden name="secret"/>
    <s:if test ="level ==1">
      <input type="button" value="Add level" onClick="filingSummary1()" class="formbutton">
 </s:if>
<div >
    <div >
  
     <br>
   
    </div>
  </div>
  <div >
    <div >
    
     <table border = "0">
		<tr>
			<th colspan="7" class="mainheading">File Movement Tracking  </th>
		</tr>
<!-- 		<tr class="subheading"> -->
<%-- 				<td colspan="7" align="center">Petition No. :<s:property value="cercPetition.registrationNumberDisplay"/></td> --%>
<!-- 			</tr> -->
			<tr class="subheading">
				<td colspan="3" style= "font-size: 11pt" align="left">Diary No. : <s:property value="cercPetition.diaryNumberDisplay"/></td>
				<td colspan="3" style= "font-size: 11pt" align="right">Reference No. : <s:property value="cercPetition.referenceNumberDisplay"/></td>									
			</tr>
		
		</table>
    </div>
  </div>		

	
	
<div class="timeline">
<%--  <s:if test = "auditPetitionFileMovement1== null"> --%>
<s:if test = "PetitiFileMovment== null">
  <div class="container right">
  <div class="content"> 
  
      <s:if test = "#session.CERC_USER.refOrganisationId.id == 1 and #session.CERC_USER.userType == 'O'">

      <input type="button" value="Forward to first level" onClick="forword()" class="formbutton">
      

      </s:if>

  </div>
  </div>  
  
  </s:if>
	<s:elseif test = "PetitiFileMovment !=null">
	
	
<!--   <div class="container right"> -->
    <!-- <div class="content"> -->
     
<%--       <s:if test = "level == 1  and status == 'pending'"> --%>
      <s:iterator value="auditPetitionFileMovement1" status="rowstatus">
<%--       <s:if test = "level == 1 and status != 'pending'"> --%>
    <div class="container right">
    <div class="content">
      <h4>
					<s:if test='level== 1'>Legal Officer</s:if>
					<s:if test='level== 2'>Deputy Director</s:if>
					<s:if test='level== 3'>Director</s:if>
					<s:if test='level== 4'>Executive Director	</s:if>
					<s:if test='level== 5'>Secretary </s:if>
					<s:if test='level== 6'>Member1	</s:if>
					<s:if test='level== 7'>	Member2</s:if>
					<s:if test='level== 8'>Chairperson</s:if>					
		&emsp;&emsp;&emsp;&emsp;&emsp;Received Date:- <s:date  name="updatedDate" format="dd/MM/yyyy hh:mm:ss"/></h4>
      
      <h4>Name:-<s:property value="updatedBy.userName"/>&emsp;&emsp;&emsp;&emsp;&emsp;Status:-<s:property value="status"/></h4>
      <h4>Comment:-<s:property value="comentDesc"/>&emsp;&emsp;</h4> 
<%-- (<s:property value="department.departmentDescription"/>-<s:property value="devision.divisionName"/>) 
&emsp;&emsp;&emsp;--%>
Comment Date:-<s:date name="commentDate" format="dd/MM/yyyy hh:mm:ss"/>
	<hr>
	</div>
     </div>
     
<%--       </s:if> --%>
      </s:iterator>
       <s:if test="PetitiFileMovment!=null and PetitiFileMovment.status == 'pending'  " >
    <div class="container right">
      <div class="content">
      <h4>			<s:if test='PetitiFileMovment.level== 1'>Legal Officer</s:if>
					<s:if test='PetitiFileMovment.level== 2'>Deputy Director</s:if>
					<s:if test='PetitiFileMovment.level== 3'>Director</s:if>
					<s:if test='PetitiFileMovment.level== 4'>Executive Director</s:if>
					<s:if test='PetitiFileMovment.level== 5'>Secretary</s:if>
					<s:if test='PetitiFileMovment.level== 6'>Member1</s:if>
					<s:if test='PetitiFileMovment.level== 7'>Member2</s:if>
					<s:if test='PetitiFileMovment.level== 8'>Chairperson</s:if>
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;  
      Received Date:- <s:date  name="PetitiFileMovment.updatedDate"  format="dd/MM/yyyy hh:mm:ss" /></h4>
      <h4>
      <s:if test='PetitiFileMovment.cercUserId.id != null'>
           Name:<s:property value="PetitiFileMovment.cercUserId.userName"/> 
      </s:if>
<%--       Employee:<s:property value="levelUserMapping.employeename.userName"/> --%>
<!--        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; -->
       
       
<!--        &emsp;&emsp;&emsp;&emsp;&emsp; -->
<%--       Status-<s:property value="PetitiFileMovment.comment"/></h4> --%>
<br>
Status:-Pending</h4>

     <s:if test="PetitiFileMovment.level!= null and #session.CERC_USER.refOrganisationId.id == 1 and #session.CERC_USER.userType == 'E' and cercPetition.refStatusId.id !=12 and(PetitiFileMovment.level==1 or #session.CERC_USER.id == PetitiFileMovment.cercUserId.id)">
      
<!--       	<button  onClick="filingSummary()" style="font-size:24px "><i class="fa fa-edit" ></i></button> -->
      	
     
<%--      <s:if test = "#session.CERC_USER.refOrganisationId.id == 1 and #session.CERC_USER.userType == 'E' and #session.CERC_USER.refDivisionId.divisionCode.trim()!='12' " > --%>
      <button  onClick="filingSummary()" style="font-size:24px "><i class="fa fa-edit" ></i></button>
<%--       </s:if> --%>
       </s:if>

<%--       <p><s:property value="cercPetition.referenceNumberDisplay"/>, quo ei simul congue exerci, habeo iusto primis ea eam.</p> --%>
     <s:if test="PetitiFileMovment.department!= null">
<%--       (<s:property value="PetitiFileMovment.department.departmentDescription"/>-<s:property value="PetitiFileMovment.division.divisionName"/>) --%>
      <br>
      </s:if>
      <h4>			
 
      <s:if test = "#session.CERC_USER.refOrganisationId.id == 1 and #session.CERC_USER.userType == 'O'">
      <s:if test='PetitiFileMovment.level!= 1'>
				Choose Level&EMP :-
				</s:if>
					
					<s:if test='PetitiFileMovment.level== 2'> 
					<s:select list="#{'2':'Deputy Director'}"   name="level" id="level" theme="simple" headerValue="- Select -" headerKey="-1" cssStyle="width:150pt"/>
					<s:select list="cercUserList" listKey="id" listValue="lastName+'  '+firstName" name="cercUserrId.id" id="cercUserrId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:100pt"/>
					</s:if>
					<s:if test='PetitiFileMovment.level== 3'>
					<s:select list="#{'3':'Director'}"   name="level" id="level" theme="simple" headerValue="- Select -" headerKey="-1" cssStyle="width:150pt"/>
		<s:select list="cercUserList" listKey="id" listValue="lastName+'  '+firstName" name="cercUserrId.id" id="cercUserrId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:100pt"/>
					</s:if>
					<s:if test='PetitiFileMovment.level== 4'>
					<s:select list="#{'4':'Executive Director'}"   name="level" id="level" theme="simple" headerValue="- Select -" headerKey="-1" cssStyle="width:150pt"/>
					<s:select list="cercUserList" listKey="id" listValue="lastName+'  '+firstName" name="cercUserrId.id" id="cercUserrId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:100pt"/>		
					</s:if>
					<s:if test='PetitiFileMovment.level== 5'>
					<s:select list="#{'5':'Secretary'}"   name="level" id="level" theme="simple" headerValue="- Select -" headerKey="-1" cssStyle="width:150pt"/>
		<s:select list="cercUserList" listKey="id" listValue="lastName+'  '+firstName" name="cercUserrId.id" id="cercUserrId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:100pt"/>					
					</s:if>
					<s:if test='PetitiFileMovment.level== 6'>
					<s:select list="#{'6':'Member1'}"   name="level" id="level" theme="simple" headerValue="- Select -" headerKey="-1" cssStyle="width:150pt"/>
		<s:select list="cercUserList" listKey="id" listValue="lastName+'  '+firstName" name="cercUserrId.id" id="cercUserrId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:100pt"/>
					
					</s:if>
					<s:if test='PetitiFileMovment.level== 7'>
					<s:select list="#{'7':'Member2'}"   name="level" id="level" theme="simple" headerValue="- Select -" headerKey="-1" cssStyle="width:150pt"/>
		<s:select list="cercUserList" listKey="id" listValue="lastName+'  '+firstName" name="cercUserrId.id" id="cercUserrId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:100pt"/>
					
					</s:if>
					<s:if test='PetitiFileMovment.level== 8'>
					<s:select list="#{'8':'Chairperson'}"   name="level" id="level" theme="simple" headerValue="- Select -" headerKey="-1" cssStyle="width:150pt"/>
		<s:select list="cercUserList" listKey="id" listValue="lastName+'  '+firstName" name="cercUserrId.id" id="cercUserrId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:100pt"/>										
					</s:if>
					      <s:if test='PetitiFileMovment.level!= 1'>
<!--       <button  onClick="update()" style="font-size:24px "><i class="fa fa-edit" ></i></button> -->
      
      <s:submit  name="updatebutton" id="updatebutton" value="Update" class="formbutton" />
      </s:if>
      </s:if>
<!--   <input type="submit" id="submitbutton" name="submitbutton"  class="formbutton" onClick="filingSummary()"> -->
  </div>
  </div>
  </s:if>
  <%-- <s:elseif test="auditPetitionFileMovement1 == null and  PetitiFileMovment == null">
  <div class="content">
  <h4>Level-1&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Status:-Pending</h4>
     <s:if test = "#session.CERC_USER.refOrganisationId.id == 1 and #session.CERC_USER.userType == 'O'">
      Update Authority:-<button  onClick="filingSummary1()" style="font-size:24px "><i class="fa fa-edit" ></i></button>
      </s:if>
      </div>
  </s:elseif> --%>
<!--     </div> -->
  </div>
   
  
 
 </s:elseif>




	<s:token/>
</s:form>	
            	
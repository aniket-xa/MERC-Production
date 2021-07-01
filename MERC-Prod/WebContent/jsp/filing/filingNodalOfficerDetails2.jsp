<%@ taglib uri="/struts-tags" prefix="s"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js">
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('select[id="level"]').val(-1)
		$('select[name="StatusId"]').val(-1)
		 $("input[name='savebutton']").click(function(){
			 if ($('select[id="level"]').val() == "-1") {
				 alert("Please Select level");
				 return false; 
			 }
// 			 else  if ($('select[name="refDepartmentId.id"]').val() =="") {
// 				 alert("Please Select Department");
// 				 return false; 
// 			 }
// 			 else if ($('select[name="refDivisionId.id"]') == "") {
// 				 alert("Please Select Division");
// 				 return false; 
// 			 }
			 else if ($('select[name="cercUserrId.id"]').val() == "") {
				 alert("Please Select Employee");
				 return false; 
			 }
			 else if ($('select[name="StatusId"]').val() == "-1") {
				 alert("Please Select Status");
				 return false; 
			 }
			 else 
			 {
				document.filingNodalOfficerDetails.action="authSetting";
    			document.filingNodalOfficerDetails.submit();
			 }
			 
		}); 
		 
		 
		 
		 $('select[name="level"]').change(function () {
			 $("#cercUserrId").get(0).options.length = 0;
		        $("#cercUserrId").get(0).options[0] = new Option("- Select -", "");
 			     var id = $(this).val();
					var deptId = null;
			     $.ajax({
			    	    url: "loadcercuser",
			            data : {
	            			id:id,
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
			            },
			             error: function() {
			            	 alert("Failed to load Employee");
			            }
			        });
				});
			
		
		
		/* $('select[name="level"]').change(function () {
			$("#refDepartmentId").get(0).options.length = 0;
	        $("#refDepartmentId").get(0).options[0] = new Option("- Select -", "");
		     var deptId = $(this).val();
		     $.ajax({
		    	    url: "loadRefDepartment",
		            data : {
		            	refDepartmentList:"",
		            },
		            dataType: "json",
		            type: 'POST',
		            success: function(refDepartmentList) {
		            	 $.each(refDepartmentList, function (id, refDepartment) {
		            		 $.each(refDepartment, function(id,departmentDescription){
			            		 $("#refDepartmentId").get(0).options[$("#refDepartmentId").get(0).options.length] = new Option(departmentDescription.departmentDescription,departmentDescription.id);
		            		 });
		                }); 
		            },
		             error: function() {
		            	 alert("Failed to load Department");
		            }
		        });
			}); */
		
		/* $('select[name="refDepartmentId.id"]').change(function () {
			$("#refDivisionId").get(0).options.length = 0;
	        $("#refDivisionId").get(0).options[0] = new Option("- Select -", "");
		     var deptId = $(this).val();
		     $.ajax({
		    	    url: "loadRefDivision",
		            data : {
		            	deptId:deptId,
		            	refDivisionList:"",
		            },
		            dataType: "json",
		            type: 'POST',
		            success: function(refDivisionList) {
		            	 $.each(refDivisionList, function (id, refDivision) {
		            		 $.each(refDivision, function(id,divisionName){
			            		 $("#refDivisionId").get(0).options[$("#refDivisionId").get(0).options.length] = new Option(divisionName.divisionName,divisionName.id);
		            		 });
		                }); 
		            },
		             error: function() {
		            	 alert("Failed to load Documents");
		            }
		        });
			}); */
		
		
		
/* 		$('select[name="refDivisionId.id"]').change(function () {
			$("#cercUserrId").get(0).options.length = 0;
	        $("#cercUserrId").get(0).options[0] = new Option("- Select -", "");
		     var deptId = $(this).val();
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
		            },
		             error: function() {
		            	 alert("Failed to load Employee");
		            }
		        });
			});
 */	
		
		
	});
	

</script>

<%-- <s:include value="/jsp/tiles/tabs.jsp"></s:include> --%>
	<s:form theme="simple" name="filingNodalOfficerDetails">
	<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
	<s:hidden name="filingBeanId"/>
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Verification Officer Details</th>
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
			<td>Choose Level<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<%-- <select headerValue="- Select -" headerKey=""cssStyle="width:242pt">
					<option value="- Select -">- Select -</option>
			</select> --%>
<%-- 			<s:select list="#{'1':'Level1','2':'Level2','3':'Level3','4':'Level4','5':'Level5','6':'Level6','7':'Level7','8':'Level8'}"   name="level" id="level" theme="simple" headerValue="- Select -" headerKey="-1" cssStyle="width:242pt"/> --%>
		<s:select list="#{'1':'Legal Officer','2':'Deputy Director','3':'Director','4':'Executive Director','5':'Secretary','6':'Member1','7':'Member2','8':'Chairperson'}"   name="level" id="level" theme="simple" headerValue="- Select -" headerKey="-1" cssStyle="width:242pt"/>
			</td>
		</tr>
		<%-- <tr valign="top">
			<td>Department<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<select headerValue="- Select -" headerKey=""cssStyle="width:242pt">
					<option value="- Select -">- Select -</option>
			</select>
    <s:select list="refDepartmentList" listKey="id" listValue="departmentDescription" name="refDepartmentId.id" id="refDepartmentId" headerKey="" headerValue="- Select -" cssStyle="width:242pt"/>
			</td>
		</tr>
		<tr valign="top">
			<td>Divison<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				<select headerValue="- Select -" headerKey=""cssStyle="width:242pt">
					<option value="- Select -">- Select -</option>
			</select>
<s:select list="refDivisionList" listKey="id" listValue="divisionName" name="refDivisionId.id" id="refDivisionId" headerKey="" headerValue="- Select -" cssStyle="width:242pt"/>
			</td>
		</tr> --%>
		<tr valign="top">
			<td>Employee<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
<%-- 			<select headerValue="- Select -" headerKey=""cssStyle="width:242pt">
					<option value="- Select -">- Select -</option>
			</select> --%>
			<s:select list="cercUserList" listKey="id" listValue="lastName+'  '+firstName" name="cercUserrId.id" id="cercUserrId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:242pt"/><!--  -->
			</td>
		</tr>
		<tr valign="top">
			<td>Status<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
<%-- <select headerValue="- Select -" headerKey=""cssStyle="width:242pt">
					<option value="- Select -">- Select -</option>
			</select>--%>
 <s:select list="#{1:'Active',2:'Inactive'}"  name="StatusId" id="StatusId" theme="simple" headerValue="- Select -" headerKey="-1" cssStyle="width:242pt"/>
			</td>
		</tr>
		<tr><td colspan="7"></td></tr>
		<tr><td colspan="7" align="right">
		<input type="submit" id="savebutton" name="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp;
		<input type="reset" id="searchbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
		<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="filingOtherAuthoritiesDetailsList"/>
		</td></tr>
	</table>
	<s:token/>
</s:form>	
            	
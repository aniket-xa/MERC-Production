<%@ taglib uri="/struts-tags" prefix="s"%>


<script type="text/javascript">

	$(document).ready (function() {

		var fileName = $('#attachedDocument').val().toLowerCase();
		var fUpload=document.getElementsByName("fileUpload");
		var fUploadName=document.getElementsByName("fileUploadName"); 
		var crDt=new Date();
				
			if($('input:radio[name="cercCourtDetails.agencyType"]:checked').val()=='H'){
				$(".agencyTypeHigherCourt").show();	
				$(".agencyTypeAuthorityOrOther").hide();
				
			}
			else {
				$('input:radio[name="cercCourtDetails.agencyType"][value="A"]').click();
				$(".agencyTypeHigherCourt").hide();	
				$(".agencyTypeAuthorityOrOther").show();
			}
	
		
		$(".delete").hide();
		$('#orderDateRequired').hide();
		$('#uploadOrderRequired').hide();
		$('[name="cercCourtDetails.orderType"]').click(function(){
			if($(this).val()!='N'){
				$('#orderDateRequired').show();
				$('#uploadOrderRequired').show();
			}
			else{
				$('#orderDateRequired').hide();
				$('#uploadOrderRequired').hide();
			}
		});
		
		$('input[name="cercCourtDetails.agencyType"]').change(function(){
			if($(this).val()=='H'){
				$(".agencyTypeHigherCourt").show();	
				$(".agencyTypeAuthorityOrOther").hide();
				$('#refAgencyStateId').val("");
				$('#refAgencyNameId').val("");
				
					$(".agency").hide();
					$(".ag").hide();
					$(".agencyName").hide();
				
					
				
			}
			else {
				$(".agencyTypeHigherCourt").hide();	
				$(".agencyTypeAuthorityOrOther").show();
				$(".agency").show();
				$(".ag").show();
				$(".agencyName").show();
			}
		});
		
		$('select[name="cercCourtDetails.courtType"]').change(function()
		{
			$('#refAgencyStateId').val("");
			$('#refAgencyNameId').val("");
			if($('#courtType').val()=='A')
			{
				$(".agency").hide();
				$(".ag").hide();
				$(".agencyName").hide();
			}
			else
			{
				$(".agency").show();
				$(".ag").show();
				$(".agencyName").show();
			}
		});
		function formValidation(e)
		{
			var order=$('input:radio[name="cercCourtDetails.orderType"]:checked').val();
			var orderDate=null;
			if ($("#orderDate").val()!="")
			{
				
				var from = $("#orderDate").val().split("/");
				orderDate = new Date(from[2], from[1] - 1, from[0]);
			}
			for (var i = 0; i < fUpload.length; i++)
			{	
				var fileName = fUpload[i].value; 
				var fileExtension = (fUpload[i].value).substring((fUpload[i].value).lastIndexOf('.') + 1).toLowerCase();
				//var docName=document.getElementsByName("fileUploadName");
				 //alert(fUploadName[i].value);
// 			if ((fileExtension!="pdf" && fileExtension!="jpg" && fileExtension!="jpeg"))
// 			if ((fileExtension!="pdf" && fileExtension!="jpg" && fileExtension!="jpeg") || fUpload[i].value=="" || fUploadName[i].value=="")
			if ((fileExtension!="pdf" && fileExtension!="jpg" && fileExtension!="jpeg") && (fUploadName[i].value!=""))
				{
					alert("Please upload pdf / jpg file only");
					$('[name=fileUpload]').focus();
					return false;
				} 
				/* else if ((fileExtension!="jpeg" && fileExtension!="jpg" && fileExtension!="pdf"))
				{
					alert("Please upload pdf/jpeg files only.")
					return false
				} */
			
				else if(fUpload[i].value!="" && fUploadName[i].value=="")
				{
					alert("Please select document type");
					$('[name=fileUploadName]').focus();
					return false;
				}
				
				else if ((fileExtension!="pdf" && fileExtension!="jpg" && fileExtension!="jpeg") && fUpload[i].value=="" && order != 'N'){
					alert("Please upload pdf / jpg file only");
					$('[name=fileUpload]').focus();
					return false;
				}
				
				else if ((fileExtension!="pdf" && fileExtension!="jpg" && fileExtension!="jpeg") && fUploadName[i].value=="" && order != 'N'){
					alert("Please select document type");
					$('[name=fileUploadName]').focus();
					return false;
				}
				
			}
			
			
			
			if($('input[name="cercCourtDetails.agencyType"]:checked').val()=="H")	
				{
					if($('#refAgencyStateId').val()=="")
					{
						alert("Please select state.");
						$('#refAgencyStateId').focus();
						return false;
					}
				}
			else
			{
				if($('#authorityName').val()=="")
				{
					alert('Plese enter authority name.');
					$('#authorityName').focus();
					return false;
				}
			}
			if($('#caseType').val()=="")
			{
				alert('Plese enter court case type.');
				$('#caseType').focus();
				return false;
			}
			else if($('#caseNumber').val()=="")
			{
				alert('Plese enter court case number.');
				$('#caseNumber').focus();
				return false;
			}
			else if($('#caseYearId').val()=="")
			{
				alert('Plese enter court case year.');
				$('#caseYearId').focus();
				return false;
			}
			else if(order!='I' && order!='F' && order!='N')
			{
				alert("Please select order type.");
				return false;			
			}
			else if((order=='I' || order=='F') && $('#orderDate').val()=="" )
			{
				alert("Please select order date.");
				return false;			
			}
			else if(orderDate.getTime() > crDt.getTime())
			{
					alert("Order date should not be future date.")
					$('#orderDate').focus();
					return false;
			}
			
			else  
			{
				filingCourtDetailsSave();
			}		
		}
		
		;
		
		$("input[name='savebutton']").click(formValidation);
		
		$('select[name="cercCourtDetails.courtType"]').change(function () {
			var courtType = $('#courtType').val();
			$("#refAgencyStateId").get(0).options.length = 0;
	        $("#refAgencyStateId").get(0).options[0] = new Option("- Select -", "");
			if(courtType=="A"){
// 				console.log("aniket");
				
			     var refAgencyStateId = $(this).val();
			     var courtType = $('#courtType').val();	
			     console.log(courtType);
			     console.log(refAgencyStateId);
			     $.ajax({
			    	    url: "loadAgencyState",
			    	    data : {
			            	refAgencyStateList:""
			            },
			            dataType: "json",
			            type: 'POST',
			            success: function(refAgencyStateList,tokenInfo,response) {
			            	 $.each(refAgencyStateList, function (id, refAgencyState) {
			            		 $.each(refAgencyState, function(id,agencyState){
				            		 $("#refAgencyStateId").get(0).options[$("#refAgencyStateId").get(0).options.length] = new Option(agencyState.agencyState,agencyState.id);
			            		 });
			            	 });
			           
			            },
			             error: function() {
			            	 alert(" Failed to load Agency State");
			            }
			        });
			    	 }
			else {
				 if(courtType!=null && courtType!="" && courtType!="A"){
				
				console.log("aniket2");
				
			     var refAgencyStateId = $(this).val();
			     var courtType = $('#courtType').val();	
			     console.log(courtType);
			     console.log(refAgencyStateId);
			     $.ajax({
			    	    url: "loadAgencyState2",
			    	    data : {
			            	refAgencyStateList:""
			            },
			            dataType: "json",
			            type: 'POST',
			            success: function(refAgencyStateList,tokenInfo,response) {
			            	 $.each(refAgencyStateList, function (id, refAgencyState) {
			            		 $.each(refAgencyState, function(id,agencyState){
				            		 $("#refAgencyStateId").get(0).options[$("#refAgencyStateId").get(0).options.length] = new Option(agencyState.agencyState,agencyState.id);
			            		 });
			            	 });
			           
			            },
			             error: function() {
			            	 alert(" Failed to load Agency State");
			            }
			        });
				
			}}
			
			
			
			
		});
		

		    
		$('select[name="refAgencyState.id"]').change(function () {
			$("#refAgencyNameId").get(0).options.length = 0;
	        $("#refAgencyNameId").get(0).options[0] = new Option("- Select -", "");
		     var refAgencyStateId = $(this).val();
		     var courtType = $('#courtType').val();
		     if(refAgencyStateId!=null && refAgencyStateId!="")
		    	 {
		    	 
		    	 
		    	 //alert(refAgencyStateId+"hiiiiiiiiii");
		     $.ajax({
		    	    url: "loadAgencyNames",
		    	    data : {
		            	refAgencyStateId:refAgencyStateId,
		            	agencyType:courtType,
		            	refAgencyNameList:"",
		            },
		            dataType: "json",
		            type: 'POST',
		            success: function(refAgencyNameList,tokenInfo,response) {
		            	 $.each(refAgencyNameList, function (id, refAgencyName) {
		            		 $.each(refAgencyName, function(id,agencyName){
			            		 $("#refAgencyNameId").get(0).options[$("#refAgencyNameId").get(0).options.length] = new Option(agencyName.agencyName,agencyName.id);
		            		 });
		                });
		            },
		             error: function() {
		            	 alert(" Failed to load Agency Names");
		            }
		        });
		    	 }
		});
		
		$('input[name="cercCourtDetails.agencyType"]').change(function(){
			$("#refAuthorityTypeId").get(0).options.length = 0;
			$("#refAuthorityTypeId").get(0).options[0] = new Option("- Select -", "");
			var agencyTypeId = $(this).val();
			$.ajax({
				url:"loadRefAuthorityType",
				data:{
					agencyTypeId:agencyTypeId,
					refAuthorityTypeList:"",
				},
				dataType:"json",
				type:'POST',
				success : function(refAuthorityTypeList){
					$.each(refAuthorityTypeList,function(id,authorityTypeList){
						if(refAuthorityTypeList!=""){
							$.each(authorityTypeList, function(id, authorityType){
//									alert("SUCCESSS!!!!!!!!!");
								$("#refAuthorityTypeId").get(0).options[$("#refAuthorityTypeId").get(0).options.length] = new Option(authorityType.authorityType,authorityType.id);
							});
						}	
					});
				},
				error:function(){
					alert("Failed to load authority types");
				}
				
			});
			
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
	
	function filingCourtDetailsSave(){
		document.filingCourtDetails.action="filingCourtDetailsSave";
		document.filingCourtDetails.submit();
	}
	
	function identicalCaseDetails(){
		document.filingCourtDetails.action="identicalCaseDetails";
		document.filingCourtDetails.submit();
	}      	
</script>
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="filingCourtDetails" action="filingCourtDetailsSave" enctype="multipart/form-data" method="post">
<s:hidden name="filingBeanId"/>
<s:hidden name="courtDetailsId"/>
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Court Details</th>
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
			<td>Agency Type</td>
			<td>:</td>
			<td colspan="5">
				<s:radio list="#{'A':'Authority','H':'Higher Court','O':'Any Other'}" name="cercCourtDetails.agencyType" id="agencyType" theme="simple"/>
			</td>						
		</tr>
		
		<tr class="agencyTypeAuthorityOrOther">
			<td width="20%">Authority Name<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%"><s:textfield type="text" name="cercCourtDetails.authorityName" id="authorityName" size="24"/></td>
			<td width="2%"></td>
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>		
		</tr>
		<tr class="agencyTypeAuthorityOrOther">
			<td>Authority Type</td>
			<td>:</td>
			<td>
			<!-- 			04-03-2020 start AK -->
			<s:select list="refAuthorityTypeList" name = "refAuthorityType.id" id="refAuthorityTypeId" listKey="id" listValue="authorityType" headerKey = "" headerValue = "-- Select --"  value = "{cercCourtDetails.refAuthorityType}"/>
			<!-- 			04-03-2020 end AK -->
			</td>
		</tr>
		
		<tr>
		</tr>
		<tr class="agencyTypeHigherCourt">
			<td width="20%">Court Type</td>
			<td width="1%">:</td>
			<!-- 			04-01-2020 start AK -->
			<td width="28%">
				<s:select list="#{'A':'Appellate Tribunal of Electricity (ATE)','H':'High Court','S':'Supreme Court of India'}"  headerKey = "" headerValue = "-- Select --"  name="cercCourtDetails.courtType" id="courtType" cssStyle="width:142pt" theme="simple"/>
				
			</td>
			<!-- 			04-01-2020 end AK -->
			<td width="2%"></td>
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>			
		</tr>
		<tr class="agencyTypeHigherCourt">
			<td>State<span class="required">*</span></td>
			<td>:</td>
			<td>
			<s:select name="refAgencyState.id" list="refAgencyStateList" listKey="id" listValue="agencyState" headerKey="" headerValue="-- Select --" id="refAgencyStateId" cssStyle="width:142pt" value="cercCourtDetails.refAgencyStateId.id"/>
			</td>
			<td></td>
			<td class=agency>Name</td>
			<td class=ag>:</td>
			<td class=agencyName>
			<s:select name="refAgencyName.id" list="refAgencyNameList" listKey="id" listValue="agencyName" headerKey="" headerValue="-- Select --" id="refAgencyNameId" cssStyle="width:142pt" value="cercCourtDetails.refAgencyNameId.id"/>
			</td>			
		</tr>
		
		<tr>
			<td>Court Case Details<span class="required">*</span></td>
			<td>:</td>
			<td colspan="5">
				Type&nbsp;<s:textfield type="text" name="cercCourtDetails.caseType" id="caseType" size="22" maxlength="8"/>
				&nbsp;&nbsp;Number&nbsp;<s:textfield type="text" name="cercCourtDetails.caseNumber" id="caseNumber" size="22"/>
				&nbsp;&nbsp;Year&nbsp;
				<s:select  name="cercCourtDetails.caseYear" id="caseYearId" list="yearList" headerValue="- Select -" headerKey=""/>
			</td>
		</tr>
		<tr>
			<td>Order Type<span class = "tooltip">*</span></td>
			<td>:</td>
			<td colspan="5">
			<s:radio list="#{'I':' Interim','F':' Final','N':' No order Passed'}" name="cercCourtDetails.orderType" id="orderType" theme="simple"/>
			</td>			
		</tr>
		<tr>
			<td>Order Date<span class = "required" id = "orderDateRequired">*</span></td>
			<td>:</td>
			<td colspan="5"><div><s:textfield name="cercCourtDetails.orderDate"  id="orderDate" class="tcal"/>&nbsp;<span class="tooltip">(dd/mm/yyyy)</span></div></td>			
		</tr>
		<tr valign="top">
			<td>Upload Order<span class = "required" id = "uploadOrderRequired">*</span></td>
			<td>:</td>
			<td colspan="5">
				<div class="fidRepeat">
					<s:select list="refDocumentList" name="fileUploadName" listKey="id" listValue="documentName" id="refDocumentId" theme="simple" headerValue="- Select -" headerKey="" cssStyle="width:142pt"/>
					&nbsp;
					<s:textfield type="text" size="24" name="documentDescription" id="documentDescription"/>
					&nbsp;<s:file name="fileUpload" id="attachedDocument" label="Select a File to upload" size="40"/>
					
					<span class="delete"><a href="#" onClick="fidDelete(this);return false" title="Delete" class="tip">delete</a></span>								        	
					<span class="add"><a href="#" onClick="fidAdd();return false;" id="add-address">Add More</a></span>
				</div>
				<span class="tooltip">(pdf / jpeg files only)</span>
				<br/>
				<br/>
				<span class="tooltip">Note : Consolidated, uploaded documents size should not exceed 300 MB.</span>
				<br/>
				<br/>	
				<span class="tooltip">Note : File name should not contain any space.</span>	
			</td>				
		</tr>
		<tr>
			<td colspan="7" align="right">
				<s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'">
					<input type="submit" id="savebutton" name="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp;
					<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				</s:if>	
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="filingCourtDetailsList"/>					
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
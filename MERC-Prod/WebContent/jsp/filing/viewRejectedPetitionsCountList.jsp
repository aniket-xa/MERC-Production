<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<script type="text/javascript">
	$(document).ready(function() {
		$("#reportWindow").click(function(event) {
	    	   event.preventDefault();
	           event.stopPropagation();
	           winddd = window.open(this.href,"report",'width=635px,directories=0, resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no, titlebar=no');
	       });

		if ($("#searchBy").val() == "1") {
			$("#refPetitionTypeId").prop('disabled', 'disabled');
			$("#searchedPetitionNumber").removeAttr("disabled");
			$("#searchedPetitionYear").removeAttr("disabled");
			$("#searchbutton").removeAttr("disabled");
			$("#searchedPetitionNumber").focus();
		}
		else if ($("#searchBy").val() == "2") {
			$("#refPetitionTypeId").removeAttr("disabled");
			$("#searchedPetitionNumber").removeAttr("disabled");
			$("#searchedPetitionYear").removeAttr("disabled");
			$("#searchbutton").removeAttr("disabled");
			$("#refPetitionTypeId").focus();
		}
		else{
			$("#refPetitionTypeId").prop('disabled', 'disabled');
			$("#searchedPetitionNumber").prop('disabled', 'disabled');
			$("#searchedPetitionYear").prop('disabled', 'disabled');
			$("#searchbutton").prop('disabled', 'disabled');
		}
	
		$("#searchBy").change(function () {
			if ($(this).val() == "1") {
				$("#refPetitionTypeId").val("");	
				$("#refPetitionTypeId").prop('disabled', 'disabled');
				$("#searchedPetitionNumber").removeAttr("disabled");
				$("#searchedPetitionYear").removeAttr("disabled");
				$("#searchbutton").removeAttr("disabled");
				$("#searchedPetitionNumber").focus();
			}
			else if ($(this).val() == "2") {
				$("#refPetitionTypeId").removeAttr("disabled");
				$("#searchedPetitionNumber").removeAttr("disabled");
				$("#searchedPetitionYear").removeAttr("disabled");
				$("#searchbutton").removeAttr("disabled");
				$("#refPetitionTypeId").focus();
			}
			else{
				$("#refPetitionTypeId").prop('disabled', 'disabled');
				$("#searchedPetitionNumber").prop('disabled', 'disabled');
				$("#searchedPetitionYear").prop('disabled', 'disabled');
				$("#searchbutton").prop('disabled', 'disabled');
			}				
		});
		$("input[name='searchbutton']").click(function(){
			var filter = /^([0-9]+)$/;
			
			if ($("#searchBy").val() == "1")
			{
// 				<!-- 			04-01-2020 start AK -->
				if(filter.test($('#searchedPetitionNumber').val())==false)
				{	
					if($('#searchedPetitionNumber').val()=="") {
						alert("Please Enter Diary Number");
					$('#searchedPetitionNumber').focus();
					return false;}
				else{
				alert("Please Enter Diary  Number In numeric.");
				$('#searchedPetitionNumber').focus();
				return false;
				}	

				}
				else if($('#searchedPetitionYear').val()=="")
				{
					alert("Please select diary year.");
					$('#searchedPetitionYear').focus();
					return false;
				}
			}
			else if ($("#searchBy").val() == "2")
			{
				if($("#refPetitionTypeId").val()=="")
				{
					alert("Please select petition type.");
					$("#refPetitionTypeId").focus();
					return false;
				}

				else if(filter.test($('#searchedPetitionNumber').val())==false)
				{
					if($('#searchedPetitionNumber').val()=="") {
						alert("Please Enter Petition Number");
					$('#searchedPetitionNumber').focus();
					return false;}
				else{
					alert("Petition Number should be numeric.");
					$('#searchedPetitionNumber').focus();
					return false;
					}
				}
// 				<!-- 			04-03-2020 end AK -->
				else if($('#searchedPetitionYear').val()=="")
				{
					alert("Please select registration year.");
					$('#searchedPetitionYear').focus();
					return false;
				}
						
			}
		});
		
	});  
function validateNumber(sNumber)
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
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Refer Back Petition</th>
		</tr>
		<tr>
			<td colspan="7">
				<s:form theme="simple" name="searchPetition" action="searchRejectedPetition">
					<table border = "0">
						<tr>
							<td>
								Search By&nbsp;:&nbsp;
								<s:select list="#{1:'Diary Number',2:'Petition Number'}" name="searchBy" id="searchBy" headerKey="" headerValue="- Select -" theme="simple" cssStyle="width:115pt" value="%{2}"/>
								&nbsp;&nbsp;Type&nbsp;:&nbsp;
								<s:select list="refPetitionTypeList" name="refPetitionType.id" id="refPetitionTypeId" listKey="id" listValue="petitionType+'  ('+petitionTypeCode+')'" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/>
								&nbsp;&nbsp;Number&nbsp;:&nbsp;<s:textfield size="8" name="searchedPetitionNumber" id="searchedPetitionNumber"/>
								&nbsp;&nbsp;Year&nbsp;:&nbsp;
								<s:select name="searchedPetitionYear" id="searchedPetitionYear" list="yearList" headerValue="- Select -" headerKey="" cssStyle="width:60pt"/>
								&nbsp;&nbsp;
								<input type="submit" name="searchbutton" id="searchbutton" value="Search" class="formbutton" />	
							</td>	
						</tr>		
					</table>
					<s:token/>
				</s:form>
			</td>
		</tr>
</table>
<s:if test="cercPetitionSearched!=null">
<s:form theme="simple" name="filingSummary" action="submitRejectedPetition">
<s:hidden name="filingBeanId"/>
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Petition - Summary <s:if test="cercPetitionSearched.isMigrated == true"><font color="red"><b>(MIGRATED PETITION)</b></font></s:if></th>
		</tr>
		<tr>
		<td colspan="7">
			<table border="1" cellspacing="0" cellpadding="0">
				<tr valign="top">
					<td width="20%">Reference No.</td>
					<td width="30%"><s:property value="cercPetitionSearched.referenceNumberDisplay"/></td>
					<td width="35%">Reference No. Generation Date</td>
					<td width="15%"><s:date name="cercPetitionSearched.referenceNumberGeneratedOn" format="dd/MM/yyyy"/></td>
				</tr>
				<tr valign="top">
					<td>Diary No.</td>
					<td><s:property value="cercPetitionSearched.diaryNumber"/>/<s:property value="cercPetitionSearched.diaryYear"/></td>
					<td>Diary No. Generation Date</td>
					<td><s:date name="cercPetitionSearched.filedOn" format="dd/MM/yyyy"/></td>
				</tr>
				<tr valign="top">
					<td>Petition No.</td>
					<td><s:property value="cercPetitionSearched.registrationNumberDisplay"/></td>
					<td>Petition No. Generation Date</td>
					<td><s:date name="cercPetitionSearched.registeredOn" format="dd/MM/yyyy"/></td>
				</tr>
			</table>
			</td>					
		</tr>
		<tr>
		<td width="15%">Petition Type</td>
		<td width="1%">:</td>
		<td width="*" colspan="5"><s:property value="cercPetitionSearched.refPetitionTypeId.petitionType"/> - <s:property value="cercPetitionSearched.refPetitionSubtypeId.petitionSubType"/></td>
		</tr>
		<tr>
		<td width="15%">Region</td>
		<td width="1%">:</td>
		<td width="*" colspan="5"><s:property value="cercPetitionSearched.refRegionId.region"/> </td>
		</tr>
		<tr>
		<td width="15%">Subject</td>
		<td width="1%">:</td>
		<td width="*" colspan="5"><s:property value="cercPetitionSearched.subject"/> </td>
		</tr>
		<tr>
		<td width="15%">Petition Status</td>
		<td width="1%">:</td>
		<td width="*" colspan="5"><div class="blink" style="color: red;">
			<s:property value="cercPetitionSearched.refStatusId.refStatusPublicDomainId.statusName"/>
			<s:if test="cercPetitionSearched.refStatusId.isDivisionConcat==true">
			<s:if test="cercPetitionStatusDivisionList.size()>0">
			<s:iterator value="cercPetitionStatusDivisionList">
			<s:if test='refDivisionId.divisionCode==6 or refDivisionId.divisionCode==7'>
			<s:if test="cercPetitionStatusDivisionList.size()>1">
			 <s:property value="refDivisionId.divisionName"/> and 
			 </s:if>
			 <s:else>
			 <s:property value="refDivisionId.divisionName"/>
			 </s:else>
			</s:if>
			</s:iterator>
			</s:if>
			</s:if>
			</div>
		</td>
		</tr>
		<tr>
			<th colspan="7" class="mainheading">Refer Back Petition</th>
		</tr>
		<tr>
		<td colspan="7">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr valign="top">
					<td colspan="3"><s:checkbox name="feeReverted" id="feeReverted" theme="simple"/> Please check if filing fee is to be reverted back to Petitioner's UTR</td>
				</tr>
				<tr valign="top">
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr valign="top">
					<td width="20%">Refer Back Reason: </td>
					<td width="*"><s:textarea name="rejectionReason" cols="100" rows="5"/></td>
				</tr>
			</table>
			</td>					
		</tr>
		<tr>
			<td colspan="7" align="right">
				<input type="submit" id="filePetitionbutton" name="filePetitionbutton" value="Refer Back Petition" class="formbutton" />&nbsp;&nbsp;
				<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>
</s:if>
<s:else>
	<table border="0">
		<s:if test="rejectedPetitionsCountList.size>0">
			<tr>
				<th colspan="8" class="mainheading">Referred Back Petitions</td>				
			</tr>
			<tr>
				<td colspan="8">
					<display:table export="false" id="disposedPetitions" name="rejectedPetitionsCountList" pagesize="20" requestURI="">
					<s:url var="url" action="filingSummary">
							<s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token" />
							<s:param name="filingBeanId" value="%{#attr.disposedPetitions.id}" />
						</s:url>
						 <display:column title="Petition/Diary Number" sortable="true">
							<s:a href="%{url}">
								<s:if test="%{#attr.disposedPetitions.registrationNumberDisplay!=null}">
									<s:property value="%{#attr.disposedPetitions.registrationNumberDisplay}"/>
								</s:if>
								<s:else>
									<s:property value="%{#attr.disposedPetitions.diaryNumberDisplay}"/>
								</s:else>
							</s:a>
						</display:column>
						<display:column title="Subject" sortable="true" style="text-align: justify;text-justify: inter-word;">
						<s:property value="%{#attr.disposedPetitions.subject}"/>
						</display:column>
						<display:column title="Petitioner Name" sortable="true">
							<s:property value="%{#attr.disposedPetitions.cercUserPetitionerId.userName}"/>
						</display:column>
						<display:column title="Filed By" sortable="true">
							(<s:property value="%{#attr.disposedPetitions.cercUserFiledBy.userType}"/>)
							<s:property value="%{#attr.disposedPetitions.cercUserFiledBy.userName}"/>
						</display:column>
						<display:column property="filedOn" format="{0,date,dd/MM/yyyy}" title="Filed On" sortable="true"/>
						<display:column title="Referred Back" sortable="true">
							<s:property value="%{#attr.disposedPetitions.updatedBy.userName}"/>
						</display:column>
						<display:column property="updatedOn" format="{0,date,dd/MM/yyyy}" title="Referred Back On" sortable="true"/>		
					</display:table>
				</td>
			</tr>
		</s:if>
		<s:elseif test="cercPetitionSearched==null">
			<tr align="center">
				<td colspan="8"><span class="required">No Record Found.</span></td>
			</tr>
		</s:elseif>
	</table>
</s:else>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<script src="js/inputFieldValidationFilter.js"></script>
<style type="text/css">
div.petition { float:left; }
div.party { float:left;vertical-align: middle;top: 50% }
div.dop { float:left; } 
div.nod { float:left; }
div.addedby { float:left; }
div.common { float:left; }
</style>
<script type="text/javascript">
	$(document).ready(function() {
		if ($('input:radio[name=searchType]:checked').val() == "petition") {
    		$(".petition").show();
	        $(".party").hide();
	        $(".dop").hide();
	 		$(".nod").hide();
	 		$(".addedby").hide();
	 		$(".common").hide();
        }
		else if ($('input:radio[name=searchType]:checked').val() == "party") {
    		$(".petition").hide();
	        $(".party").show();
	        $(".dop").hide();
	 		$(".nod").hide();
	 		$(".addedby").hide();
	 		$(".common").show();
        }
		else if ($('input:radio[name=searchType]:checked').val() == "dop") {
    		$(".petition").hide();
	        $(".party").hide();
	        $(".dop").show();
	 		$(".nod").hide();
	 		$(".addedby").hide();
	 		$(".common").hide();
        }
		else if ($('input:radio[name=searchType]:checked').val() == "nod") {
    		$(".petition").hide();
	        $(".party").hide();
	        $(".dop").hide();
	 		$(".nod").show();
	 		$(".addedby").hide();
	 		$(".common").show();
        }
		else if ($('input:radio[name=searchType]:checked').val() == "addedby") {
    		$(".petition").hide();
	        $(".party").hide();
	        $(".dop").hide();
	 		$(".nod").hide();
	 		$(".addedby").show();
	 		$(".common").show();
        }
		else{
			$('input:radio[name=searchType][value="petition"]').click();
			$(".petition").show();
	        $(".party").hide();
	        $(".dop").hide();
	 		$(".nod").hide();
	 		$(".addedby").hide();
	 		$(".common").hide();
		}
		
		
		$('input[name="searchType"]').change(function () {
			if ($(this).val() == "petition") {
				$(".petition").show();
		        $(".party").hide();
		        $(".dop").hide();
		 		$(".nod").hide();
		 		$(".addedby").hide();
		 		$(".common").hide();
		 		$('#dop').val("");
		 		$('#searchedPleadingContent').val("");
			}
			else if ($(this).val() == "party") {
	    		$(".petition").hide();
		        $(".party").show();
		        $(".dop").hide();
		 		$(".nod").hide();
		 		$(".addedby").hide();
		 		$(".common").show();
	        }
			else if ($(this).val() == "dop") {
	    		$(".petition").hide();
		        $(".party").hide();
		        $(".dop").show();
		 		$(".nod").hide();
		 		$(".addedby").hide();
		 		$(".common").hide();
	        }
			else if ($(this).val() == "nod") {
	    		$(".petition").hide();
		        $(".party").hide();
		        $(".dop").hide();
		 		$(".nod").show();
		 		$(".addedby").hide();
		 		$(".common").show();
	        }
			else if ($(this).val() == "addedby") {
	    		$(".petition").hide();
		        $(".party").hide();
		        $(".dop").hide();
		 		$(".nod").hide();
		 		$(".addedby").show();
		 		$(".common").show();
	        }
			
		});
		$('#searchbutton').click(function()
		{
			if ($('input:radio[name=searchType]:checked').val() == "petition") 
			{
				if($('#searchBy').val()==1)
				{
					if($('#searchedPetitionNumber').val()=="")
					{
						alert("Please enter diary number.");
						return false;
					}
					else if($('#searchedPetitionYear').val()=="")
					{
						alert("Please select diary year.");
						return false;
					}
				}
				else
				{
					if($('#refPetitionTypeId').val()=="")
					{
						alert("Please select petition type.");
						return false;
					}
					else if($('#searchedPetitionNumber').val()=="")
					{
						alert("Please enter petition number.");
						return false;
					}
					else if($('#searchedPetitionYear').val()=="")
					{
						alert("Please select petition year.");
						return false;
					}
				}
			
			}
			else if ($('input:radio[name=searchType]:checked').val() == "party")
			{
				if($('#searchedPleadingContent').val()=="")
				{
					alert("Please enter party name.");
					return false;
				}
			}
			else if ($('input:radio[name=searchType]:checked').val() == "nod")
			{
				if($('#searchedPleadingContent').val()=="")
				{
					alert("Please enter nature of document.");
					return false;
				}
			}
			else if ($('input:radio[name=searchType]:checked').val() == "addedby")
			{
				if($('#searchedPleadingContent').val()=="")
				{
					alert("Please enter added by.");
					return false;
				}
			}
			else if ($('input:radio[name=searchType]:checked').val() == "dop")
			{
				if($('#dop').val()=="")
				{
					alert("Please enter date of pleading.");
					$('#dop').focus();
					return false;
				}
				else if(dtRegex.test($('#dop').val())==false)
				{
					alert("Invalid date.");
					$('#dop').focus();
					return false;
				}
			}
		});
	});  

</script>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Pleadings Search</th>
		</tr>
		<tr>
			<td colspan="7">
				<s:form theme="simple" name="searchPetition" action="searchPleadingPetition">
					<table border = "0">
						<tr>
							<td>
								Search By&nbsp;:&nbsp;<s:radio list="#{'petition':'Petition ','party':'Party Name ','dop':'Date of Pleading ','nod':'Nature of Document','addedby':'Added By'}" name="searchType" id="searchType" theme="simple"/>
							</td>
						</tr>
						<tr>
							<td>
							<div class="petition">
								<s:select list="#{1:'Diary Number',2:'Petition Number'}" name="searchBy" id="searchBy" headerKey="" headerValue="- Select -" theme="simple" cssStyle="width:115pt" value="%{2}"/>
								&nbsp;&nbsp;Type&nbsp;:&nbsp;
								<s:select list="refPetitionTypeList" name="refPetitionType.id" id="refPetitionTypeId" listKey="id" listValue="petitionType+'  ('+petitionTypeCode+')'" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/>
								&nbsp;&nbsp;Number&nbsp;:&nbsp;<s:textfield size="8" name="searchedPetitionNumber" id="searchedPetitionNumber"/>
								&nbsp;&nbsp;Year&nbsp;:&nbsp;
								<s:select name="searchedPetitionYear" id="searchedPetitionYear" list="yearList" headerValue="- Select -" headerKey="" cssStyle="width:60pt"/>
								&nbsp;&nbsp;
							</div>
							<div class="party">&nbsp;&nbsp;Party Name&nbsp;:&nbsp;</div>
							<div class="nod">&nbsp;&nbsp;Nature of Document&nbsp;:&nbsp;</div>
							<div class="addedby">&nbsp;&nbsp;Added By&nbsp;:&nbsp;</div>
							<div class="common"><s:textfield size="50" name="searchedPleadingContent" id="searchedPleadingContent"/>&nbsp;&nbsp;</div>
							<div class="dop">&nbsp;&nbsp;Date of Pleading From&nbsp;:&nbsp;<s:textfield type="text" name="dop"  id="dop" class="tcal" value="" size="21"/>&nbsp;<span class="tooltip">(dd/mm/yyyy)</span>&nbsp;&nbsp;</div>
							<div class="dop">&nbsp;&nbsp;Date of Pleading To&nbsp;:&nbsp;<s:textfield type="text" name="dop"  id="dop" class="tcal" value="" size="21"/>&nbsp;<span class="tooltip">(dd/mm/yyyy)</span>&nbsp;&nbsp;</div>
							<input type="submit" name="searchbutton" id="searchbutton" value="Search" class="formbutton" />
							</td>	
						</tr>		
					</table>
					<s:token/>
				</s:form>
			</td>
		</tr>
</table>
<s:form theme="simple" name="newUserRegistration">
	<table border="0">
		<s:if test="hasActionMessages()">
			<tr align="left">
				<td colspan="8"><span class="required"><s:actionmessage/></span></td>
			</tr>
		</s:if>
		<s:if test="cercPetitionPleadingList.size>0">
			<tr>
				<th colspan="8" class="mainheading">Pleadings List</td>				
			</tr>
			<tr>
				<td colspan="8">
					<display:table export="false" id="petitionPleadings" name="cercPetitionPleadingList" pagesize="20" requestURI="">
						<s:url var="url" action="viewDashboardPleadingDetails">
							<%-- <s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token" /> --%>
							<s:param name="filingBeanId" value="%{#attr.petitionPleadings.id}" />
						</s:url>
						<s:url var="url1" action="viewPleadingHardCopyRecieved">
							<%-- <s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token" /> --%>
							<s:param name="filingBeanId1" value="%{#attr.petitionPleadings.id}" />
						</s:url>
						<s:url action="viewDashboardPleadingDetails" var="url" escapeAmp="false">
							<%-- <s:param name="struts.token.name">token</s:param>
							<s:param name="token" value="token"/> --%>
            				<s:param name="pleadingId"><s:property value="%{#attr.petitionPleadings[0]}"/></s:param>
            				<s:param name="filingBeanId" value="%{#attr.petitionPleadings[1]}"/>
            				<s:param name="divisionCode"><s:property value="%{#attr.petitionPleadings[2]}"/></s:param>
        				</s:url>
        				<s:url action="viewPleadingHardCopyRecieved" var="url1" escapeAmp="false">
						<s:param name="struts.token.name">token</s:param>
						<s:param name="token" value="token"/>
                        <s:param name="pleadingId"><s:property value="%{#attr.petitionPleadings[0]}"/></s:param>
            			<s:param name="filingBeanId1" value="%{#attr.petitionPleadings[1]}"/>
            			<s:param name="divisionCode"><s:property value="%{#attr.petitionPleadings[2]}"/></s:param>
            		    </s:url>						
						<display:column title="Sr. No." sortable="true">
						<s:property value="%{#attr.petitionPleadings_rowNum}"/>
						</display:column>
						<display:column title="Diary / Petition No." sortable="true">
							<s:a href="%{url}">
								<s:property value="%{#attr.petitionPleadings[8]}"/>
							</s:a>
						</display:column>
						<display:column title="Name Of Document" sortable="true">
								<s:property value="%{#attr.petitionPleadings[3]}"/>
						</display:column>
						<display:column title="Party Name" sortable="true">
								<s:property value="%{#attr.petitionPleadings[4]}"/>
						</display:column>
						<display:column title="Compliance Date" sortable="true">
								<s:date name="%{#attr.petitionPleadings[5]}" format="dd/MM/yyyy"/>
						</display:column>
						<display:column title="Added By" sortable="true">
								<s:property value="%{#attr.petitionPleadings[6]}"/>
						</display:column>
						<display:column title="Added On" sortable="true">
								<s:date name="%{#attr.petitionPleadings[7]}" format="dd/MM/yyyy HH:mm"/>
						</display:column>
						<display:column  title="View" sortable="true" style="width:10%">
				             <s:a href="%{url1}">View</s:a>
				        </display:column>	
					</display:table>
				</td>
			</tr>
		</s:if>
		<s:else>
			<tr align="center">
				<td colspan="8"><span class="required">No Record Found.</span></td>
			</tr>
		</s:else>
	</table>
</s:form>

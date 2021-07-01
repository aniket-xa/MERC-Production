<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
	
var unsaved = false;	
	
$(document).ready(function() {
	$(":input").change(function(){ 
    	unsaved = true;
	});
	
});
	
	function filingAssetDetails(){
		if(unsaved){
			var confo = confirm("Are you sure you want to leave this page? There is unsaved data on this page");
			if(confo != true){
				$("#previousbutton").blur();
				return false;
			}
		
		}
		document.filingCheckList.action="filingAssetDetails?struts.token.name=token&token=<s:property value="token"/>";
		document.filingCheckList.submit();
	}
	
	function filingSummary(){
		if(unsaved){
			var confo = confirm("Are you sure you want to leave this page? There is unsaved data on this page");
			if(confo != true){
				$("#nextbutton").blur();
				return false;
			}
		
		}
		document.filingCheckList.action="filingSummary?struts.token.name=token&token=<s:property value="token"/>";
		document.filingCheckList.submit();
		//return false;
	}
	  	
</script>


<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="filingCheckList" action="filingCheckListSave">
<s:hidden name="filingBeanId"/>
	<table border = "0" valign="top">
		<tr>
			<th colspan="7" class="mainheading">Filing - Check List</th>
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
			<td colspan="7">
				<table border="0">
					<tr class="subheading" align="center">
						<td width="5%">S. No.</td>
						<td width="70%">Description</td>
						<td width="15%">Status</td>
					</tr>
					
					<s:iterator value="cercChecklistList" status="rowstatus">
					<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
						<td><s:if test = "#rowstatus.count != 3 and #rowstatus.count != 4 and #rowstatus.count != 5 and #rowstatus.count != 6"><s:property value="#rowstatus.count == 1 or #rowstatus.count == 2 ? #rowstatus.count : (#rowstatus.count - 4)"/></s:if></td>
						<td><s:property value="refChecklistId.description"/></td>
						
						<td>
							
							<s:hidden name="cercChecklistList[%{#rowstatus.index}].id"/>
							<s:hidden name="cercChecklistList[%{#rowstatus.index}].refChecklistId.id"/>
							<s:if test = "#rowstatus.count != 2">
							&nbsp;&nbsp;&nbsp;&nbsp;<s:radio list="#{'N':'Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;','Y':'No'}" name="cercChecklistList[%{#rowstatus.index}].checkStatus" id="checkStatus" theme="simple" />
							</s:if>

						</td>
					</tr>
					</s:iterator>
				</table>
			</td>
		</tr>
		
		<tr><td colspan="7"></td></tr>
		<tr>
			<td colspan="3" align="right">
				
				<!-- <input type="submit" id="submitbutton" name="submitbutton" value="Submit" class="formbutton" onClick="filingSummary()" /> -->
				
			</td>
			<td colspan="4" align="right">
			<s:if test = "filingBean.diaryNumber == null">
				<input type="button" id="previousbutton" name="previousbutton" value=" &lt;&lt; Previous" class="formbutton" onClick="filingAssetDetails()"/>&nbsp;&nbsp;
				<input type="button" id="nextbutton" name="nextbutton" value="Next &gt;&gt;" class="formbutton" onClick="filingSummary()"/>&nbsp;&nbsp;
				<s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'">			
					<input type="submit" id="deletebutton" name="deletebutton" value="Save" class="formbutton" />&nbsp;&nbsp;
					<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				</s:if>
				<s:submit id="cancelbutton" name="cancelbutton" value="Cancel" class="formbutton" action="welcome"/> 
			</s:if>
			</td>
		</tr>
	</table>
	<s:token/>
</s:form>	
            	
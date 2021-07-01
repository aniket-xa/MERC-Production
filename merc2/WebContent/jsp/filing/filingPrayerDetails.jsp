<%@ taglib uri="/struts-tags" prefix="s"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta charset="UTF-8">

<!-- 26-3-2020 Start AK -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<%-- <script src="js/keyboard.js"></script> --%>
<!-- <link rel="stylesheet" href="css/keyboard.css"> -->

<script src="js/Encoder.js"></script>
<script src="js/google.js"></script>
<script src="js/google1.js"></script>
<script src="js/inputFieldValidationFilter.js"></script>
<script type="text/javascript">
// Load the Google Transliteration API
      google.load("elements", "1", {
        packages: "transliteration"
      });
    
      function onLoad() {
        var options = {
          sourceLanguage: 'en',
          destinationLanguage: ['mr'],
          shortcutKey: 'ctrl+m',
          transliterationEnabled: true
        }
    
        // Create an instance on TransliterationControl with the required options.
        var control = new google.elements.transliteration.TransliterationControl(options);
    
        // Enable transliteration in the textfields with the given ids.
        var ids = ["issueDescription"];
        control.makeTransliteratable(ids);
    
        // Show the transliteration control which can be used to toggle between English and Hindi and also choose other destination language.
        control.showControl('translControl');
      }
    
      google.setOnLoadCallback(onLoad);

  
	
// 	26-03-2020 End AK


  
  
$(document).ready(function() {
	


// 	<!-- 27-3-2020 Start AK -->
	if(document.getElementById("issueDescription").value!=""){
		
		var s = document.getElementById("issueDescription").value;
// 		alert("@@@@"+ s);	
		var decoded = Encoder.htmlDecode(s);
// 		alert("@@@@"+ decoded);
		document.getElementById("issueDescription").value= decoded;
	}
// 	<!-- 27-3-2020 end AK -->	
	$("input[name='savebutton']").click(function()
	{
		if($('#issueDescription').val()=="")
		{
			alert("Plese enter prayer description");
			$('#issueDescription').focus();
			return false
		}
		else if(filterTextArea.test($('#issueDescription').val())==false)
		{
			
			alert("Invalid Description.")
			$('#issueDescription').focus();
			return false;
		}
		else
		{
			document.filingIssuesDetails.action="filingPrayerDetailsSave";
			document.filingIssuesDetails.submit();
		}
	});
}); 
</script>
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
	<s:form theme="simple" name="filingIssuesDetails" >
	<s:hidden name="filingBeanId"/>
	<s:hidden name="cercPrayerId"/>
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Issues Details</th>
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
		<tr valign = "top">
			<td></td>
			<td></td>
			<td><span class = "tooltip">User can enter prayer in Eng or Mar.   </span></td>
		</tr>
		<tr valign = "top">
			<td width="20%"></td>
			<td width="1%"></td>
			<td colspan="5"><div id = "translControl" style="width:50px"></div></td>
		</tr>
		<tr valign="top">
			<td width="20%">Description<span class="required">*</span></td>
			<td width="1%">:</td>
			<td colspan="5" >
				<s:textarea cols="128" rows="23"  name="cercPrayer.description" id="issueDescription" cssStyle="width:560pt"  ></s:textarea>
			
			</td>								
		</tr>
		<tr><td colspan="7"></td></tr>
		<tr>
			<td colspan="7" align="right">
			<!-- 			04-01-2020 start AK -->
				<s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'">
					<input type="submit" id="savebutton" name="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp;
					<input type="reset" id="resetbutton" name="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
				</s:if>	
				<s:submit type="submit" id="cancelhbutton" name="cancelbutton" value="Cancel" class="formbutton" action="filingPrayerDetailsList"/>
			<!-- 			04-01-2020 end AK -->
			</td></tr>
	</table>
	
	<s:token/>
</s:form>	
            	
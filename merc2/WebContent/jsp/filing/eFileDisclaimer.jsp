<%@ taglib uri="/struts-tags" prefix="s"%>
<s:form action="filingGeneralInformation">
<table border = "0">
		<tr><th colspan="7" class="mainheading">INSTRUCTIONS  FOR  E-FILING PETITION</th></tr>
		<tr style="text-align: justify;text-justify: inter-word;">
			<td width="10%"></td>
			<td width="80%">For E-Filing the petition the user has to log-in to the MERC application. Only active registered users can e-File petition.</td>
			<td width="10%"></td>
		</tr>
		<tr style="text-align: justify;text-justify: inter-word;">
			<td></td>
			<td>User need to provide following information related to the petition that he/she is going to e-File :
					 <br/>General Information, Respondent Details, Court Details, Related Petition, Identical Petitions, Prayers, Fees, Attachments
					 <br/>
				User can fill these forms in any sequence by clicking on the tabs on the top or can navigate in the same sequence by clicking next or previous button at the bottom of the form. Please note that if tabs are clicked, any information modified on the current tab will not be saved until save button is clicked
			</td>
		</tr>
		<tr style="text-align: justify;text-justify: inter-word;">
			<td></td>
			<td>User can fill the information in any number of iterations. On the first save the reference number for the petition under filing process will be generated. For future modifications of the petition under process, before submission the user can open it with the generated reference number.</td>
			<td></td>
		</tr>
		<tr style="text-align: justify;text-justify: inter-word;">
			<td></td>
			<td>Petition filling fee is subject to change, hence fee should be calculated on the same day when submitting the draft petition.</td>
			<td></td>
		</tr>
		<!-- <tr>
			<td></td>
			<td>On any screen click of the submit button will take to "Summary"" tab and "File Petition" button is available at the bottom of the page.</td>
			<td></td>
		</tr> -->
		<tr style="text-align: justify;text-justify: inter-word;">
			<td></td>
			<td>To file a new petition user needs to click on E-file Petition(New) under Petition menu on the screen.</td>
			<td></td>
		</tr>
		
		<tr style="text-align: justify;text-justify: inter-word;">
			<td></td>
			<td>User can modify the draft petition by clicking on the reference number or by searching the same through reference number search</td>
			<td></td>
		</tr>
		<tr style="text-align: justify;text-justify: inter-word;">
			<td></td>
			<td>Once the petition is filed a Diary Number is generated for future reference and petition cannot be modified after that.</td>
			<td></td>
		</tr>
		<!-- <tr style="text-align: justify;text-justify: inter-word;">
			<td></td>
			<td>Court fee has to be paid in advance before e-filing the case.</td>
			<td></td>
		</tr> -->
		<tr style="text-align: justify;text-justify: inter-word;">
			<td></td>
			<td style="color:red">Note: Please ensure to save current form data before leaving the page, otherwise the changes made will be lost.</td>
			<td></td>
		</tr>
		<tr>
			<td colspan="3" align="right">
				<input type="submit" id="savebutton"  name="savebutton" value="Proceed" class="formbutton" />
			</td>			
		</tr>
<s:token/>
</table>
</s:form>


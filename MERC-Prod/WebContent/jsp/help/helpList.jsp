<%@ page import="com.nic.cerc.pojo.registration.RefCity" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<div class="message"><s:actionerror/></div>
<s:form theme="simple" name="helpList" id="helpList" method="post">
	<table border = "0">

		<tr><th colspan="7" class="mainheading">Online Help</th></tr>
		<tr class="colored_td">
			<td width="10%"></td>
			<td colspan="2">Manuals</td>
			<td colspan="2">Presentations</td>
			<td colspan="2">Videos</td>
		</tr>
		<tr class="colored_td">
			<td colspan="7">e-Filing Instructions</td>
		</tr>	
		<tr class="white_td">
			<td width="10%">1.1</td>
			<td colspan="3"><s:a href="openUploadedFile?documentId=1">e-Filing Instructions</s:a> (120 KB)</td>
			<td colspan="3"></td>
		</tr>
		<tr class="colored_td">
			<td colspan="7">e-Registration</td>
		</tr>	
		<tr class="white_td">
			<td width="10%">2.1</td>
			<td colspan="2"><s:a href="openUploadedFile?documentId=2" >e-Registration Manual</s:a>(3.76 MB)</td>
			<td colspan="2"><s:a href="openUploadedFile?documentId=3" >e-Registration Presentation</s:a>(3.73 MB)</td>
			<td colspan="2">
				<s:a href="openUploadedFile?documentId=4" >e-Registration (Organisation) Video Tutorial</s:a>(1.84 MB)<br/>
<%-- 				<s:a href="openUploadedFile?documentId=5" >e-Registration (Advocate) Video Tutorial</s:a>(75.6 MB)<br/> --%>
				<s:a href="openUploadedFile?documentId=6" >e-Registration (Individual) Video Tutorial</s:a>(1.60 MB)<br/>
				<s:a href="openUploadedFile?documentId=7" >e-Registration (Employee) Video Tutorial</s:a>(1.93 MB)
			</td>
		</tr>
		<tr class="colored_td">
			<td colspan="7">e-Filing</td>
		</tr>
		<tr class="white_td">
			<td width="10%">3.1</td>
			<td colspan="2"><s:a href="openUploadedFile?documentId=8" >e-Filing Manual</s:a>(3.63 MB)</td>
			<td colspan="2"><s:a href="openUploadedFile?documentId=9" >e-Filing Presentation</s:a>(3.59 MB)</td>
			<td colspan="2"><s:a href="openUploadedFile?documentId=10" >e-Filing Video Tutorial</s:a>(13.3 MB)</td>
		</tr>
		<tr class="colored_td">
			<td colspan="7">e-Pleadings</td>
		</tr>
		<tr class="white_td">
			<td width="10%">4.1</td>
			<td colspan="2"><s:a href="openUploadedFile?documentId=11">e-Pleading Manual</s:a>(1.21 MB)</td>
			<td colspan="2"><!-- e-Pleading Manual --></td>
			<td colspan="2">
				<s:a href="openUploadedFile?documentId=12" >e-Pleading (Comment) Manual Video Tutorial</s:a>(1.37 MB)<br/>
				<s:a href="openUploadedFile?documentId=13" >e-Pleading (Reply) Manual Video Tutorial</s:a>(1.29 MB)<br/>
				<s:a href="openUploadedFile?documentId=14" >e-Pleading (Rejoinder) Manual Video Tutorial</s:a>(1.05 MB)<br/>
				<s:a href="openUploadedFile?documentId=15" >e-Pleading (Response) Manual Video Tutorial</s:a>(1 MB)<br/>
				<s:a href="openUploadedFile?documentId=16" >e-Pleading (Additional Information) Manual Video Tutorial</s:a>(0.97 MB)<br/>
				<s:a href="openUploadedFile?documentId=17" >e-Pleading (Submission) Manual Video Tutorial</s:a>(983 KB)			
			</td>
		</tr>
		<tr class="colored_td">
			<td colspan="7">Others</td>
		</tr>
<!-- 		<tr class="white_td"> -->
<!-- 			<td width="10%">5.1</td> -->
<!-- 			<td colspan="3"><a href="/cerc/pdf/Workshop_241214.pdf" target="_blank" download>Workshop 24 December 2014</a>(1.47 MB)</td> -->
<!-- 			<td colspan="3"></td> -->
<!-- 		</tr> -->
<!-- 		<tr class="white_td"> -->
<!-- 			<td width="10%">5.2</td> -->
<!-- 			<td colspan="3"><a href="/cerc/pdf/Workshop_291015.pdf" target="_blank" download>Workshop 29 October 2015</a>(197 KB)</td> -->
<!-- 			<td colspan="3"></td> -->
<!-- 		</tr> -->
		<tr class="white_td">
			<td width="10%">5.1</td>
			<td colspan="3"><s:a href="openUploadedFile?documentId=18" >Definitions</s:a>(459 KB)</td>
			<td colspan="3"></td>
		</tr>
		<tr class="white_td">
			<td width="10%">5.2</td>
			<td colspan="3"><s:a href="openUploadedFile?documentId=19" >Masters & Codes</s:a>(164 KB)</td>
			<td colspan="3"></td>
		</tr>
		
		
		<tr class="white_td">
			<td width="10%">5.3</td>
			<td colspan="3"><s:a href="openUploadedFile?documentId=20" >FAQ</s:a>(596 KB)</td>
			<td colspan="3"></td>
		</tr>
		
		<!-- <tr class="colored_td">
			<td width="10%">4. </td>
			<td colspan="3">e-Viewing Manual</td>
			<td colspan="3">e-Registration Video Tutorial</td>
		</tr>
		<tr class="white_td">
			<td width="10%">5. </td>
			<td colspan="3">e-Videos</td>
			<td colspan="3">e-Registration Video Tutorial</td>
		</tr> -->
	</table>
	<s:token/>
</s:form>
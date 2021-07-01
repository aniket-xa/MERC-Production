<%@ taglib uri="/struts-tags" prefix="s"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.owasp.esapi.*"%>

<%@page import="com.nic.cerc.common.CercRandom"%>
    <script type="text/javascript">
        
    
<%
		String SALTCHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		 StringBuffer salt = new StringBuffer();
		 java.util.Random rnd = new java.util.Random();
		 // build a random 9 chars salt 
		 while (salt.length() < 16)
		 {
		   int index = (int) (rnd.nextFloat() * SALTCHARS.length());
		   salt.append(SALTCHARS.substring(index, index+1));
		 }
		 String saltStr=salt.toString();
		 session.setAttribute("phash",saltStr);
		 String sessionid = request.getSession().getId();
		// be careful overwriting: JSESSIONID may have been set with other flags
		response.setHeader("SET-COOKIE", "JSESSIONID=" + sessionid + "; HttpOnly");
		%>   

	$(document).ready(function() {

	window.setTimeout(submitPage(), 10000);		
		 
	 });
 
            function submitPage(){
// 					document.payutrsuccess.action="welcome";
// 					document.payutrsuccess.action="gatwayutrMasterList?struts.token.name=token&token=<s:property value="token"/>";
		if(document.getElementById("encryptedPushResponse").value != null){
		if(document.getElementById("filingBeanId").value!=""){
					document.payutrsuccess.action="filingFeeDetails?struts.token.name=token&token=<s:property value="token"/>";
        		document.payutrsuccess.submit();
				}
		else if(document.getElementById("filingBeanId").value == "")
		{
	
		document.payutrsuccess.action="gatwayutrMasterList?struts.token.name=token&token=<s:property value="token"/>";
			document.payutrsuccess.submit();

    	}
		}
		else{
			document.payutrsuccess.action="gatwayutrMasterList?struts.token.name=token&token=<s:property value="token"/>";
			document.payutrsuccess.submit();
		}
}
        </script>




<s:form id="payutrsuccess" name="payutrsuccess"  action="payutrsuccess" >
<s:hidden name="filingBeanId" id="filingBeanId"/>
<%-- <s:hidden name="cercPetition.refPetitionTypeId.petitionTypeCode" id="petitionTypeCode"/> --%>

<s:hidden name="encryptedPushResponse" id="encryptedPushResponse"/>

<!-- <li><a href="/merc/"> Login </a></li> -->
<br>
<br>
<br>
<br>
<s:if test="encryptedPushResponse != null ">

<h3>Transaction Status :<s:property value = "paymentResponce.transaction_status" /></h3>
<h3>Transaction amount :<s:property value = "paymentResponce.amount" /></h3>
<h3>Transaction paymode:<s:property value = "paymentResponce.paymode" /></h3>

<%-- <s:property value = "filingBeanId" /> --%>
</s:if>
<s:else>
 <h2>RE-Login And check Status of Transaction in Admin-->payment gatway master </h2>
</s:else>

<s:div>
  
  
  </s:div>




	<s:token/>
</s:form>
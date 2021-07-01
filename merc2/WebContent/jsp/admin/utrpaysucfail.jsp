<%@ taglib uri="/struts-tags" prefix="s"%>
<%@page import="com.nic.cerc.pay.TrasactionReq"%>
<%@page import="com.nic.cerc.payaes.EncryptTransGenration"%>

 <script type="text/javascript">
 
 $(document).ready(function() {

	 submitPage();
	 
	 
 });
 
            function submitPage(){

        		document.ecom.submit();
            }
        </script>
        
       

<%-- <s:form name="ecom" method="post" action="https://test.sbiepay.com/secure/AggregatorHostedListener"> --%>
<!-- <form id="ecom" name="ecom" method="post"  action="yutube"> -->
<form id="ecom" name="ecom" method="post"  action="<s:url value="https://test.sbiepay.sbi/secure/AggregatorHostedListener" />">
<%-- <s:hidden name="filingBeanId"/> --%>
<input type="hidden" name="EncryptTrans" value="<s:property value = "EncryptTrans" />">

<input type="hidden" name="merchIdVal" value ="1000112"/> 

<!-- <input type="submit" name="submit" value="Submit"> -->
<h1>Loading....</h1>
	<s:token/>
</form>
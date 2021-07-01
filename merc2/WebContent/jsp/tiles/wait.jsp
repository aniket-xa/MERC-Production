<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="2;url=<s:url includeParams="all" />"/>
<%--
<meta http-equiv="refresh" content="2"/>"/>
Above refresh meta will also work as long as browser supports cookie, 
by including params above we are making sure that it will work even when cookies are disabled
 --%>
<title>Processing intermediate page</title>
</head>
<body>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<div align="center">
<h3>Your request is getting processed</h3>
<img alt="processing" src="images/ajax-loader.gif" align="middle">
<s:token/>
</div>
</body>
</html>
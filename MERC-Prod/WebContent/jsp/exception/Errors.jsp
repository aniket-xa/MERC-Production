<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Validation Errors</title>
</head>
<body>
<h3>Sorry an error occured!</h3>
        <ul><li><p>Messages: <br/>
        <s:fielderror/><br/>
        <s:actionerror /><br/>
        <s:actionmessage/></p></li></ul>
 <br>
</body>
</html>
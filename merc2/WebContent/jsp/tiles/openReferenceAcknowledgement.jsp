<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/tlds/birt.tld" prefix="birt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" href="images/cercLogo2.png" type="image/gif" sizes="30x40">
<title>MERC : E-filing</title>

</head>
<body>
<birt:viewer id="birtViewer" reportDesign='<%=request.getAttribute("reportName").toString()%>' pattern="run" height="600" width="1000" format="pdf">
					<birt:param name="pleadingType" value='<%=request.getAttribute("pleadingType")%>'></birt:param>
					<birt:param name="pleadingId" value='<%=request.getAttribute("pleadingId")%>'></birt:param>
					<birt:param name="petitionId" value='<%=request.getAttribute("petitionId")%>'></birt:param>
				</birt:viewer>
</body>
</html>
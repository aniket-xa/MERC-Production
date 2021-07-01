<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
		<link rel="icon" href="images/cercLogo2.png" type="image/gif" sizes="30x40">
		<title>MERC : E-filing</title>
		
		<link rel="stylesheet" href="css/styles.css" type="text/css" />
		<link rel="stylesheet" type="text/css" href="js/calendar/tcal.css" />
	        
		<script type="text/javascript" src="js/slider.js"></script>
		<script type="text/javascript" src="js/superfish.js"></script>
		<script type="text/javascript" src="js/custom.js"></script>
		<script type="text/javascript" src="js/calendar/tcal.js"></script> 
		<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
		<script type="text/javascript" src="js/cerc.js"></script>
		<script type="text/javascript">
		window.history.forward();
            function noBack() { 
                 window.history.forward(); 
            }
        </script>
	<s:head/>	
	</head>

	<body class="noheader"  onload="startTime();noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
		<div id="container" style="min-height: 560px;">
			<tiles:insertAttribute name="header"/>
			<div id="nav"  style="margin-top:-114pt">
    			<ul class="sf-menu dropdown">
        			<tiles:insertAttribute name="mainmenu"/>	
        		</ul>
    		</div> 
			   
    	<div id="body" style="margin-top:54pt;">
    		<div id="content">
       			<div class="box">
                	<tiles:insertAttribute name="body"/>	
            </div>
        </div>
        <div class="sidebar" style="padding-top:10pt">
        	<tiles:insertAttribute name="sidebar"/>
        </div>
        <div class="clear"></div>
    </div>
</div>
  <div id="footer">
 	<tiles:insertAttribute name="footer"/>
</div>

</body>
</html>

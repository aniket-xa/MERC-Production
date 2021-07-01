<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.owasp.esapi.*"%>

<%@page import="com.nic.cerc.common.CercRandom"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<link rel="icon" href="images/cercLogo2.png" type="image/gif" sizes="30x40">
<title>MERC : E-filing</title>
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<script type="text/javascript" src="js/superfish.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
<script type="text/javascript" src="js/sha.js"></script>

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
<script type='text/javascript'
	src='//cdn.jsdelivr.net/jquery.marquee/1.3.1/jquery.marquee.min.js'></script>
<script type="text/javascript">
function startTime() {
    var today=new Date();
    var h=today.getHours();
    var m=today.getMinutes();
    var s=today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById("clock").innerHTML = h+":"+m+":"+s;
    var t = setTimeout(function(){startTime()},500);
}

function checkTime(i) {
    if (i<10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}

$(document).ready(function() {
	
// 	<!-- 	04-14-2020 start AK -->
	if(sessionStorage.length>=0){
// 		alert("Submittedalert"+sessionStorage.length);
		sessionStorage.clear();
	}
// 	startTime();
	
});



			function loginFunction(form){
				var ps = form.password.value;
				var hashObj = new jsSHA("SHA-1","TEXT",{numRounds:parseInt(1,10)});
				var salt = '<%=session.getAttribute("phash").toString()%>';
				hashObj.update(ps);
				var saltedPassword = hashObj.getHash("B64");
				var hashObj1 = new jsSHA("SHA-1","TEXT",{numRounds:parseInt(1,10)});
				hashObj1.update(saltedPassword+salt);
				var tmp = hashObj1.getHash("B64");
				document.login.password.value = tmp;
				//document.login.action="login";
				//document.login.submit();
				return;
			}
            
			window.history.forward();
            function noBack() { 
            	
            	
            	 window.history.forward();
            }
            $(document).ready (function() {
            	for (i=0; i<document.forms.length; i++) {
                    document.forms[i].setAttribute("AutoComplete","off");
            }
            	
            	$(".marquee").marquee({
                //speed in milliseconds of the marquee
                duration: 8000,
                //gap in pixels between the tickers
                gap: 50,
                //time in milliseconds before the marquee will start animating
                delayBeforeStart: 0,
                //'left' or 'right'
                direction: 'left',
                //true or false - should the marquee be duplicated to show an effect of continues flow
                duplicated: false
            });
            	 $("input[name='loginButton']").click(function(){	
            		var filterLoginId = /^([0-9a-zA-Z]+)$/;
            		if(filterLoginId.test($('#userName').val())==false)
    				{					
    					alert("Wrong login id or password.");
    					$('#userName').focus();
    					return false;
    				}	
            	}); 
            });
       </script>
<style type="text/css">
.marquee {
	width: 800px;
	overflow: hidden;
	color: white;
}
</style>
</head>

<body class="noheaderindex" onload="noBack();"
	onpageshow="if (event.persisted) noBack();" onunload="">
	<div id="container" style="height: 480pt;">
		<div id="header">
			<div style="position: relative; float: left; padding-top: 16pt; padding-bottom: 6pt">
				<img src="images/logo.png" width="125px" height="130px" />
			</div>
			<div style="position: relative; float: right; padding-top: 16pt">
				<img src="images/emblem.png" width="76px" height="130px" />
			</div>
			<!-- <div style="position:relative; float:right; padding-top: 26pt"><img src="images/digitalIndiaLogo.png" width="175px" height="95px"/></div> -->
			<div
				style="position: relative; float: left; padding-top: 50px; padding-left: 110px">
				<img src="images/cerc_title.png" width="500px" height="71px" />
			</div>
			<!-- <h1><a href="/"><font color="#B2904A" style="margin-top:80px">CERC</font></a></h1>
    			<h2><font color="#000000" style="margin-top:80px"> Maharashtra Electricity Regulatory Commission</font></h2> -->
			<div class="clear">
				<div class="marquee">Welcome to E-Filing portal (Beta Version) of Maharashtra Electricity Regulatory Commission w.e.f 1st May 2021
<!-- 					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 					Welcome to E-Filing portal of Maharashtra Electricity Regulatory Commission -->
<!-- 					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 					Welcome to E-Filing portal of Maharashtra Electricity Regulatory Commission -->
					</div>
				<!-- <marquee behavior="alternate" style="color:white" scrolldelay="200" scrollamount="10">
    			Trial Version w.e.f 29 Oct 2015&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trial Version w.e.f 29 Oct 2015
    			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trial Version w.e.f 29 Oct 2015
    			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trial Version w.e.f 29 Oct 2015
    			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trial Version w.e.f 29 Oct 2015
    			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trial Version w.e.f 29 Oct 2015
    			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trial Version w.e.f 29 Oct 2015
    			</marquee> -->
			</div>
		</div>
		<div id="nav"></div>

		<div id="slides-container">
			<div class="controls">
				<span class="jFlowNext"><span>Next</span></span><span
					class="jFlowPrev"><span>Prev</span></span>
			</div>
			<div id="myController" class="hidden">
				<span class="jFlowControl">Slide 1</span><span class="jFlowControl">Slide
					1</span><span class="jFlowControl">Slide 1</span>
			</div>
		</div>

		<div id="body" style="margin-top: -74pt">
			<noscript>
				<font size="2pt" color="red"><b>JavaScript is turned off
						in your web browser. Turn it on to take full advantage of this
						site, then refresh the page.</b></font>
			</noscript>
			<div id="content">
					<%
	    				DateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
	    				String formattedDate = df.format(new Date());    					
	    			%>
				<div 
					style="text-align: center; color: red; text-transform: uppercase; font-weight: bold;">
					&nbsp;
<!-- 					please Login to e-file and view petition status -->

<%-- 							<font color="#00000000"><%=ESAPI.encoder().encodeForHTML(formattedDate)%>&nbsp;&nbsp;<span id="clock"></span></font> --%>

				</div>
				<div class="box" style="margin-top: 10pt">

					<s:form name="login" theme="simple" method="POST"
						autocomplete="off" action="login">
						<table border="0">
							
							<tr>
								<th colspan="3" class="mainheading">User Login</th>
							</tr>
							<tr>
								<td width="13%">Login ID</td>
								<td width="2%">:</td>
								<td width="85%"><s:hidden name="loginAttempt"
										value="%{'1'}" /> <s:textfield name="userName" id="userName"
										size="26" /></td>
							</tr>
							<tr>
								<td>Password</td>
								<td>:</td>
								<td><s:password type="password" name="password"
										id="password" size="26" /></td>
							</tr>
							<tr>
								<td colspan="3" style="height: 56px"></td>
							</tr>
							<tr>
								<td colspan="3" align="right"><s:submit type="submit"
										name="loginButton" id="loginButton" value="Login"
										class="formbutton" onclick="return loginFunction(this.form);" />&nbsp;&nbsp;
									<input type="reset" name="resetButton" id="resetButton"
									value="Reset" class="formbutton" />&nbsp;&nbsp;</td>
							</tr>
						</table>
						<s:token />
						<%if(request.getAttribute("sessionTimeOut")!=null)
       {
    	   Integer exit=(Integer)request.getAttribute("sessionTimeOut"); 
    	   if(exit==1)
    	   {%>
						<font size="4pt" color="red" style="list-style-type: none;"><b>Session
								has been expired.<br /> Please login again<br />
							<br />
						</b></font>
						<%}
       }%>
						<font size="2pt" color="red"><b>Please do not use:</b>
							<ul>
								<li>Back button to submit form again</li>
								<li>Double click on button/link</li>
								<li>"Reload/Refresh" Option in browser</li>
							</ul> <!-- <b>will cause session expires.</b> --> </font>
						<div class="message"></div>
						<font size="4pt" color="red"><b> <s:fielderror
									cssStyle="list-style-type: none;align:right" /> <s:actionerror
									cssStyle="list-style-type: none;align:right" /> <s:actionmessage
									cssStyle="list-style-type: none;align:right" /></b></font>
						<font size="1pt" color="blue">If you are having trouble
							viewing this site, it may be because you are using a slightly
							older browser. The site is fully compatible with the following
							browsers: Internet Explorer 9 and later, Firefox, Safari, Opera
							and Chrome. If you are using a different browser, you may wish to
							update Internet Explorer <strong><a
								href="http://windows.microsoft.com/en-gb/windows/downloads"
								target="_blank">here</a></strong> or download <strong><a
								href="https://www.google.co.uk/intl/en_uk/chrome/browser/?platform=win"
								target="_blank">Chrome</a></strong> or <strong><a
								href="http://www.mozilla.org/en-GB/firefox/new/" target="_blank">Firefox</a></strong>
						</font>
					</s:form>


				</div>
			</div>

			<div class="sidebar" style="padding-top: 22pt">
				<ul>
					<li>
						<h4>
							<span>Other Links</span>
						</h4>
						<ul class="blocklist">

							<li><a href="https://www.merc.gov.in/faces/merc/common/outputClient.xhtml"
								target="_blank">Home</a></li>
							<li><a
								href="aboutUs?struts.token.name=token&token=<s:property value="token"/>">e-Filing
									Instructions</a></li>
							<li><a
								href="newRegistration?struts.token.name=token&token=<s:property value="token"/>">e-Registration
									(new user)</a></li>
							<li><a
								href="forgetPasswordPage?struts.token.name=token&token=<s:property value="token"/>">Forget
									Password</a></li>
							<%-- <li><a href="guestLoginPage?struts.token.name=token&token=<s:property value="token"/>">Suggestion / Comments</a></li> --%>
							<li><a
								href="stakeholderFeedback.action?struts.token.name=token&token=<s:property value="token"/>">Feedback
									/ Contact</a></li>
							<li><s:a action="helpList">Online Help</s:a></li>
							<li><a
								href="cercSiteMap.action?struts.token.name=token&token=<s:property value="token"/>">Site
									Map</a></li>
							<!-- <li><a href="birtStruts">BIRT REPORT</a></li> -->
							<li><div
									style="position: relative; float: right; padding-top: 10pt">
									<img src="images/digitalIndiaLogo.png" width="250px"
										height="137px" />
								</div></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div id="footer" >
		<div class="footer-content">

			<!--<div class="footer-box">
            <h4>Home</h4>
        </div>
        <div class="footer-box">
            <h4>About Us</h4>
        </div>
        <div class="footer-box">
            <h4>Registration</h4>
            <ul>
              <li><a href="#" action="newRegistration">New Registration</a></li>
			</ul>           	
        </div>
        <div class="footer-box">
            <h4>Forget Password</h4>            	
        </div>
        <div class="footer-box end-footer-box">
            <h4>Contact Us</h4>            	
        </div>
        <div class="clear"></div> 
    -->
		</div>
		<div id="footer-links" style = "vertical-align:bottom;">
			<p>
				&copy; MERC 2020 <a href="https://www.merc.gov.in/faces/merc/common/outputClient.xhtml" target = "_blank">Maharashtra Electricity
					Regulatory Commission</a>
			</p>
		</div>
	</div>
</body>
</html>

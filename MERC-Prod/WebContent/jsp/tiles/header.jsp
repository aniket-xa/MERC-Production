<%@ page language="java" import="java.util.*"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<meta http-equiv="Cache-control" content="private,no-cache,no-store,pre-check=0,post-check=0,must-revalidate">
<meta http-equiv="pragma" content="no-cache">
<script>
		if(!navigator.onLine){
			window.location="/";	
		}
		</script>
<script type="text/javascript">
/* $(document).ready(function(e) {
    $('.faq').click(function(e) {
        e.preventDefault();
    });
}); */
$(document).ready (function() {
	for (i=0; i<document.forms.length; i++) {
        document.forms[i].setAttribute("AutoComplete","off");
}
});
</script>
<style type="text/css">
.faq {
	position:relative; 
	float:right;                             
	padding-top:70px;
	color: red;
	z-index:1000;
}
</style>
<div id="header">
	<div style="position:relative; float:left; padding-top:2px"><img src="images/cercLogo.png" width="65px" height="80px"/></div>
	<!-- <div style="position:relative; float:right; padding-top:14px"><img src="images/emblem.png" width="38px" height="65px"/></div> -->
	<div style="position:relative; float:right; padding-top:14px"><img src="images/digitalIndiaLogo.png" width="100px" height="54px"/></div>
	<div style="position:relative; float:left; padding-top:1px; padding-left:150px"><img src="images/cerc_title.png" width="500px" height="71px"/></div>
	<!-- <h1><a href="/"><font color="#B2904A" style="margin-top:80px">CERC</font></a></h1> -->
    <!-- <h2><font color="#000000" style="margin-top:80px"> Maharashtra Electricity Regulatory Commission</font></h2> -->
    <div class="faq">
    	&nbsp;&nbsp;&nbsp;&nbsp;<!-- <a href="#" target="_blank" download>FAQ</a> -->
    	&nbsp;&nbsp;&nbsp;&nbsp;<s:a action="helpList">Online Help</s:a></div>
    <div class="clear"></div>
</div>
<div id="nav"></div>
  
<div id="slides-container">
	<div class="controls"><span class="jFlowNext"><span>Next</span></span><span class="jFlowPrev"><span>Prev</span></span></div>        
    <div id="myController" class="hidden"><span class="jFlowControl">Slide 1</span><span class="jFlowControl">Slide 1</span><span class="jFlowControl">Slide 1</span></div>
</div>


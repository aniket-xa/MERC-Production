<%@ taglib uri="/struts-tags" prefix="s"%>

<html>
<head>
  <title>EasyTabs Demo</title>
  <script src="../js/vendor/jquery-1.7.1.min.js" type="text/javascript"></script> 
  <script src="../js/vendor/jquery.hashchange.min.js" type="text/javascript"></script>
  <script src="../js/lib/jquery.easytabs.min.js" type="text/javascript"></script>

  <style>
    /* Example Styles for Demo */
    .etabs { margin: 0; padding: 0;}
    .tab { display: inline-block; zoom:1; *display:inline;  background: #B2904A; border: solid 1px #ffffff; border-bottom: none; -moz-border-radius: 4px 4px 0 0; -webkit-border-radius: 4px 4px 0 0; }
    .tab a { font-size: 14px; line-height: 2em; display: block; padding: 0 10px; outline: none; }
    .tab a:hover { text-decoration: underline; }
    .tab.active { background: #fff; padding-top: 6px; position: relative; top: 1px; border-color: #666; }
    .tab a.active { font-weight: bold; }
    .tab-container .panel-container { background: #fff; border: solid #666 1px; padding: 10px; -moz-border-radius: 0 4px 4px 4px; -webkit-border-radius: 0 4px 4px 4px; }
    .panel-container { margin-bottom: 10px; }
  </style>

  <script type="text/javascript">
    $(document).ready( function() {
      $('#tab-container').easytabs();
    });
  </script>
</head>
<div class="message"><s:fielderror/><s:actionerror/><s:actionmessage/></div>
	<div id="tab-container" class='tab-container' style="padding-top: 6pt" >
	<!-- <ul class='etabs' style="margin-left:20pt;">
   	</ul> -->
	<ul class='etabs'>
		<s:if test = "#session.CERC_USER.refOrganisationId.id==1 and (cercPetition.deficienciesNotificationDate==null or (cercPetition.deficienciesNotificationDate!=null and cercPetition.refilingDate==null))">
		<s:if test="#session.ACTIVE_TAB=='Add Deficiencies'">
	   		<li class='tab' style="background-color: #000000;">
	   			<s:a action="deficiencyPetitionDetails">
		   			<s:param name="struts.token.name" value="%{'token'}"/>
	       			<s:param name="token" value="token"/>
	       			pleadingBeanId=<s:property value="cercPetition.id"/>&noDeficiencies=false">
	       			<font style="color:#B2904A;font-weight: bolder;" >Add Deficiencies</font>
       			</s:a>
	   		</li>
	   	</s:if>
	   	<s:else>
	   		<li class='tab'>
				<s:a action="deficiencyPetitionDetails">
					<s:param name="struts.token.name" value="%{'token'}"/>
       				<s:param name="token" value="token"/>
       				<s:param name="pleadingBeanId"><s:property value="cercPetition.id"/></s:param>
       				<s:param name="noDeficiencies" value="false"/>
       					Add Deficiencies
       			</s:a>
			</li>
   		</s:else>
   		</s:if>
 	</ul>
 </div>
</body>
</html>

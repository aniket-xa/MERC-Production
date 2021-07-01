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

<div id="tab-container" class='tab-container' style="padding-top: 6pt" >
	<ul class='etabs' style="margin-left:20pt;">
   		<s:if test='((#session.CERC_USER.refOrganisationId.id==1 and #session.CERC_USER.refRoleId.roleCode=="AD") or (#session.CERC_USER.refDivisionId.divisionCode.trim()!=null and (#session.CERC_USER.refDivisionId.divisionCode.trim()=="8" or #session.CERC_USER.refDivisionId.divisionCode.trim()=="12")))'>
			<s:if test="#session.ACTIVE_TAB=='CERC Communication'">
				<li class='tab' style="background-color: #000000;">
		   			<s:a action="cercCommunication">
		   				<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
		   				<s:param name="pleadingBeanId" value="pleadingBeanId"/>
		   				<!-- 			04-07-2020 start AK -->
		   				<font style="color:#B2904A;font-weight: bolder;" >MERC Communication</font>
		   				<!-- 			04-07-2020 end AK -->
		   			</s:a>
		   		</li>
			</s:if>
			<s:else>
				<li class='tab'>
		   			<s:a action="cercCommunication">
		   				<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
		   				<s:param name="pleadingBeanId" value="pleadingBeanId"/>
		   				MERC Communication
		   			</s:a>
		   		</li>
			</s:else>
		</s:if>		
   			
   		
 	</ul>
	<ul class='etabs'>	
		<s:if test='((cercPetitionPartyDetails!=null && (cercPetitionPartyDetails.partyType.trim()=="R" or cercPetitionPartyDetails.partyType.trim()=="OR")) or ((#session.CERC_USER.refOrganisationId.id==1 and #session.CERC_USER.refRoleId.roleCode=="AD") or (#session.CERC_USER.refDivisionId.divisionCode.trim()!=null and (#session.CERC_USER.refDivisionId.divisionCode.trim()=="8" or #session.CERC_USER.refDivisionId.divisionCode.trim()=="12"))))'>
	   		<s:if test="#session.ACTIVE_TAB=='Add Reply'">
	   			<li class='tab' style="background-color: #000000;">
	   				<s:a action="pleadingReplyCommentsDetails">
	   					<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
	   					<s:param name="pleadingBeanId" value="pleadingBeanId"/>
	   					<s:param name="isReplyOrComment" value="%{'R'}"/>
	   					<font style="color:#B2904A;font-weight: bolder;" >Add Reply</font>
	   				</s:a>
	   			</li>
	   		</s:if>
	   		<s:else>
	   			<li class='tab'>
					<s:a action="pleadingReplyCommentsDetails">
						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						<s:param name="pleadingBeanId" value="pleadingBeanId"/>
						<s:param name="isReplyOrComment" value="%{'R'}"/>Add Reply
					</s:a>
				</li>
   			</s:else>
   		</s:if> 
   		
   		<s:if test='(cercPetitionPartyDetails!=null or ((#session.CERC_USER.refOrganisationId.id==1 and #session.CERC_USER.refRoleId.roleCode=="AD") or (#session.CERC_USER.refDivisionId.divisionCode.trim()!=null and (#session.CERC_USER.refDivisionId.divisionCode.trim()=="8" or #session.CERC_USER.refDivisionId.divisionCode.trim()=="12"))))'>
   			<s:if test="#session.ACTIVE_TAB=='Add Written / Other Submission'">
   				<li class='tab' style="background-color: #000000;">
					<s:a action="pleadingSubmissionDetails">
						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						<s:param name="pleadingBeanId" value="pleadingBeanId"/>
						<font style="color:#B2904A;font-weight: bolder;" >Add Written / Other Submission</font>
					</s:a>
				</li>
			</s:if>
			<s:else>
				<li class='tab'>
					<s:a action="pleadingSubmissionDetails">
						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						<s:param name="pleadingBeanId" value="pleadingBeanId"/>
						Add Written / Other Submission
					</s:a>
				</li>
			</s:else>
			
			<s:if test="#session.ACTIVE_TAB=='Add Additional Information Document'">	
				<li class='tab' style="background-color: #000000;">
					<s:a action="pleadingAdditionalInformationDetails">
						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						<s:param name="pleadingBeanId" value="pleadingBeanId"/>
						<font style="color:#B2904A;font-weight: bolder;" >Add Additional Information Document</font>
					</s:a>
				</li>	
			</s:if>
			<s:else>
				<li class='tab'>
					<s:a action="pleadingAdditionalInformationDetails">
						<s:param name="struts.token.name" value="%{'token'}"/>
						<s:param name="token" value="token"/>
						<s:param name="pleadingBeanId" value="pleadingBeanId"/>
						Add Additional Information Document
					</s:a>
				</li>
			</s:else>  			
		</s:if>
		
		<s:if test="#session.ACTIVE_TAB=='Add Comment / Objections'">
			<li class='tab' style="background-color: #000000;">
				<s:a action="pleadingReplyCommentsDetails">
					<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="pleadingBeanId" value="pleadingBeanId"/>
					<s:param name="isReplyOrComment" value="%{'C'}"/>
					<font style="color:#B2904A;font-weight: bolder;" >Add Comment / Objections / Others</font>
				</s:a>
			</li>	
		</s:if>
		<s:else>
			<li class='tab'>
				<s:a action="pleadingReplyCommentsDetails">
					<s:param name="struts.token.name" value="%{'token'}"/>
					<s:param name="token" value="token"/>
					<s:param name="pleadingBeanId" value="pleadingBeanId"/>
					<s:param name="isReplyOrComment" value="%{'C'}"/>Add Comment / Objections / Others
				</s:a>
			</li>
		</s:else>
		
		
		
 	</ul>
 </div>
</body>
</html>

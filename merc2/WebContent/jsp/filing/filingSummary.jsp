<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
	$(document)
	.ready(
	function() {
	$("#cercUserrId").hide();

	$('select[name="level"]')
	.change(
	function() {
	var deptId = $(this).val();
	if (deptId == '-1') {
	$("#cercUserrId").hide();
	} else {
	$("#cercUserrId").get(0).options.length = 0;
	$("#cercUserrId").get(0).options[0] = new Option("- Select -", "");

	// 				var deptId = null;
	$.ajax({
	url : "loadcercuser",
	data : {
	deptId : deptId,
	cercUserList : "",
	},
	dataType : "json",
		type : 'POST',
	success : function(
																	cercUserList) {

																$
																		.each(
																				cercUserList,
																				function(
																						id,
																						cercUser) {
																					$
																							.each(
																									cercUser,
																									function(
																											id,
																											lastName) {
																										// 		            			console.log(lastName.id,lastName.lastName+''+lastName.firstName);
																										$(
																												"#cercUserrId")
																												.get(
																														0).options[$(
																												"#cercUserrId")
																												.get(
																														0).options.length] = new Option(
																												lastName.firstName
																														+ '  '
																														+ lastName.lastName,
																												lastName.id);
																									});
																				});

																$(
																		'#cercUserrId')
																		.show();
																$(
																		'#cercUserrId')
																		.focus();
															},
															error : function() {
																alert("Failed to load Employee");
															}
														});
											}
										});

					});

	function verifyPetition() {
		if ($('#rejectedRemarks').val() == "") {
			alert("Please Enter Remark");
			// 		$("#rejectedRemarksstar").show();
			$('#rejectedRemarks').focus();

			return false;
		} else if ($('#cercUserrId').val() == "") {
			var x = confirm('Petition is ready for registration ? if no then Select next level & Employee');
			if (x) {
				document.filingSummary.action = "authorizePetition";
				document.filingSummary.submit()
				return true;
			} else {
				// 		    	$(this).attr("disabled", false);
				$('#level').focus();
				return false;
			}

		} else {

			var x = confirm('Kindly Confirm Before approve ');
			if (x) {	
				document.filingSummary.action = "authorizePetition";
				document.filingSummary.submit()
				return true;
			} else {
				//		    	$(this).attr("disabled", false);
				// 	    	$('#level').focus();
				return false;
			}
		}
	}
	
	
	function rejectPetition() {

		if ($('#rejectedRemarks').val() == "") {
			alert("Please Enter Remark");
			// 		$("#rejectedRemarksstar").show();
			$('#rejectedRemarks').focus();

			return false;
		} else {
			var x = confirm('Kindly Confirm Before Reject ');
			if (x) {
				document.filingSummary.action = "verificationLevelRejectPetition";
				document.filingSummary.submit();
				return true;
			} else {
				//	    	$(this).attr("disabled", false);
				//	    	$('#level').focus();
				return false;
			}

		}
	}
	
	
		

	$(document)
			.ready(
					function() {
						/* var element = $(".blink");
						var shown = true;
						setInterval(toggle, 500);

						function toggle() {
						    if(shown) {
						        element.hide();
						        shown = false;
						    } else {
						        element.show();
						        shown = true;
						    }
						} */
						// 		$("#rejectedRemarksstar").hide();
						$(".selectedIntimation").hide();

						$('input[name="intimationToCheck"]').change(function() {
							if ($(this).val() == "S") {
								$(".selectedIntimation").show();
							} else {
								$(".selectedIntimation").hide();
							}
						});

						var noresp = '<s:property value = "filingBean.noRespondents" />';

						$('input[name="filePetitionbutton"]')
								.click(
										function() {

											//var name = $("#filePetitionbutton").attr("name");
											//alert(name);
											//if(name=='filePetitionbutton'){
											$(this).attr("disabled", true);
											var cercRespondentList = '<s:property value="cercRespondentList.size()"/>';
											var cercPetitionDocumentsList = '<s:property value="cercPetitionDocumentsList.size()"/>';
											var isAdvocateAddedinPetition = $(
													'input[name="isAdvocateAddedinPetition"]')
													.val();
											var vakalatnamaUploaded = $(
													'input[name="vakalatnamaUploaded"]')
													.val();
											/* alert("isAdvocateAddedinPetition:"+isAdvocateAddedinPetition+":");
											alert("vakalatnamaUploaded:"+vakalatnamaUploaded+":"); */
											//alert("test:"+cercRespondentList.length);
											if ($(
													'input[name="intimationToCheck"]:checked')
													.val() == "") {
												alert("Please select Intimation to");
												$(this).attr("disabled", false);
												return false;
											} else if ($(
													'input[name="intimationToCheck"]:checked')
													.val() == "S") {
												if ($('input[name="intimationTo"]:checked').length == 0) {
													alert("Please check Any one to intimate");
													$(this).attr("disabled",
															false);
													return false;
												}
											} else if ($('#disclaimer').prop(
													'checked') == false) {
												alert("Please check disclaimer");
												$(this).attr("disabled", false);
												return false;
											} else if (cercRespondentList == 0
													&& noresp == false) {
												alert("Respondent missing");
												$(this).attr("disabled", false);
												return false;
											} else if (cercPetitionDocumentsList == 0) {
												alert("Attachement missing");
												$(this).attr("disabled", false);
												return false;
											}

											if (isAdvocateAddedinPetition == 'true'
													&& (vakalatnamaUploaded == undefined || vakalatnamaUploaded == 'false')) {
												alert("Please upload Advocate's Vakalatnama");
												$(this).attr("disabled", false);
												return false;
											}
											/* else if(cercPetitionDocumentsList.length<3 ){
												
											} */
											else {
												deleteConfirmation();

											}
											//return true;
											//}
										});

						$("#reportWindow")
								.click(
										function(event) {
											event.preventDefault();
											event.stopPropagation();
											winddd = window
													.open(
															this.href,
															"report",
															'width=635px,directories=0, resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no, titlebar=no');
										});

						/* $('a').each(function() {
							   var a = new RegExp('/' + window.location.host + '/');
							   var ctx = "${pageContext.request.contextPath}";
							   alert(ctx);
							   if(!a.test(this.href)) {
							       $(this).click(function(event) {
							    	   alert("");
							           event.preventDefault();
							           event.stopPropagation();
							           window.open(this.href, '_blank');
							       });
							   }
							}); */
					});

	function deleteConfirmation() {
		var x = confirm('Diary number will be generated and you shall not be able to edit the details ?');
		if (x) {
			document.filingSummary.action = "filingSummarySave?struts.token.name=token&token=<s:property value="token"/>";
			document.filingSummary.submit()
			return true;
		} else {
			$(this).attr("disabled", false);
			return false;
		}

	}

	function filingCheckList() {
		document.filingSummary.action = "filingCheckList?struts.token.name=token&token=<s:property value="token"/>";
		document.filingSummary.submit();
	}
	function openReportWindow(url) {
		subwin = window
				.open(
						encodeURIComponent(url),
						"report",
						'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no');
	}
</script>
<s:if test="secret == null">
<s:include value="/jsp/tiles/tabs.jsp"></s:include>
</s:if>
<s:form theme="simple" name="filingSummary">
	<s:hidden name="filingBeanId" />
	<%-- <s:hidden name="cercPetition.refPetitionTypeId.petitionTypeCode" id="petitionTypeCode"/> --%>
	<table border="0">
		<tr>
			<th colspan="7" class="mainheading">Filing - Summary <s:if
					test="cercPetition.isMigrated == true">
					<font color="red"><b>(MIGRATED PETITION)</b></font>
				</s:if></th>
		</tr>
		<s:if test="cercPetition.referenceNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Petition Summary</td>
			</tr>
			<s:hidden name="referenceNumber" />
			<s:hidden name="referenceYear" />
			<s:hidden name="referenceNumberDisplay" />
			<s:hidden name="diaryNumber" />
			<s:hidden name="diaryYear" />
			<s:hidden name="diaryNumberDisplay" />
			<s:hidden name="registrationNumber" />
			<s:hidden name="registrationYear" />
			<s:hidden name="registrationNumberDisplay" />

		</s:if>
		<s:if test="hasActionMessages()">
			<tr align="left">
				<td colspan="7"><font color="red" size="3pt"><s:actionmessage /></font></td>
			</tr>
		</s:if>

		<tr>
			<td colspan="7">
				<table border="1" cellspacing="0" cellpadding="0">
					<tr valign="top">
						<td width="20%">Reference No.</td>
						<td width="30%"><s:property
								value="cercPetition.referenceNumberDisplay" /></td>
						<td width="35%">Reference No. Generation Date</td>
						<td width="15%"><s:date
								name="cercPetition.referenceNumberGeneratedOn"
								format="dd/MM/yyyy" /></td>
					</tr>
					<tr valign="top">
						<td>Diary No.</td>
						<td><s:property value="cercPetition.diaryNumber" />/<s:property
								value="cercPetition.diaryYear" /></td>
						<td>Diary No. Generation Date</td>
						<td><s:date name="cercPetition.filedOn" format="dd/MM/yyyy" /></td>
					</tr>
					<tr valign="top">
						<td>Petition No.</td>
						<td><s:property
								value="cercPetition.registrationNumberDisplay" /></td>
						<td>Petition No. Generation Date</td>
						<td><s:date name="cercPetition.registeredOn"
								format="dd/MM/yyyy" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width="15%">Petition Type</td>
			<td width="1%">:</td>
			<td width="*" colspan="5"><s:property
					value="cercPetition.refPetitionTypeId.petitionType" /> - <s:property
					value="cercPetition.refPetitionSubtypeId.petitionSubType" /></td>
		</tr>
		<!-- 		<tr> -->
		<!-- 		<td width="15%">Region</td> -->
		<!-- 		<td width="1%">:</td> -->
		<%-- 		<td width="*" colspan="5"><s:property value="cercPetition.refRegionId.region"/> </td> --%>
		<!-- 		</tr> -->
		<s:if test="cercPetitionLicenceDetails!=null">
			<tr>
				<td width="15%">License Details</td>
				<td width="1%">:</td>
				<td width="*" colspan="5"><s:property
						value="cercPetitionLicenceDetails.licenceNumber" />, Valid from <s:date
						name="cercPetitionLicenceDetails.licenceDate" format="dd/MM/yyyy" /></td>
			</tr>
		</s:if>
		<tr>
			<td width="15%">Subject</td>
			<td width="1%">:</td>
			<td width="*" colspan="5"><s:property
					value="cercPetition.subject" /></td>
		</tr>
		<s:if test="cercPetition.briefOfPetition!=null">
			<tr>
				<td width="15%">Brief</td>
				<td width="1%">:</td>
				<td width="*" colspan="5"><s:property
						value="cercPetition.briefOfPetition" /></td>
			</tr>
		</s:if>
		<tr>
			<td width="15%">Petition Status</td>
			<td width="1%">:</td>
			<td width="*" colspan="5"><div class="blink" style="color: red;">
					<s:property
						value="#session.CERC_USER.refOrganisationId.id == 1?cercPetition.refStatusId.statusName:cercPetition.refStatusId.refStatusPublicDomainId.statusName" />
					<s:if test="cercPetition.refStatusId.isDivisionConcat==true">
						<s:if test="cercPetitionStatusDivisionList.size()>0">
							<s:iterator value="cercPetitionStatusDivisionList"
								status="rowstatus">
								<s:if
									test='refDivisionId.divisionCode==6 or refDivisionId.divisionCode==7'>
									<s:if
										test='cercPetitionStatusDivisionList.size()>1 and #rowstatus.count<cercPetitionStatusDivisionList.size()'>
										<s:property value="refDivisionId.divisionName" /> and 
			 </s:if>
									<s:else>
										<s:property value="refDivisionId.divisionName" />
									</s:else>
								</s:if>
							</s:iterator>
						</s:if>
					</s:if>
				</div></td>
		</tr>
		<s:if test="cercPetition.refStatusId.refStatusPublicDomainId.Id==4">
			<tr>
				<td width="15%">Referred Back Reason</td>
				<td width="1%">:</td>
				<td><s:property value="cercPetition.remarks" /></td>
			</tr>
			<%-- <tr><td width="15%"> Referred Back Amount If Any</td>
		<td width="1%">:</td>
		<td>&#8377;<s:property value="getText('{0,number,# ##0}',{cercPetitionFee.feePaid})"/></td></tr>  --%>

		</s:if>


		<tr>
			<td colspan="7">
				<table border="1" cellspacing="0" cellpadding="0">
					<tr valign="top">
						<td width="5%">S.No.</td>
						<td width="20%">Section</td>
						<td width="*">Sub Section</td>
					</tr>
					<s:iterator value="cercSectionList" status="rowstatus">
						<tr>
							<td><s:property value="#rowstatus.count" /></td>
							<td><s:property value="section" /></td>
							<%-- 					<td><s:property value="refSectionId.sectionCode"/></td> --%>
							<td><s:property value="sectionRemarks" /></td>
						</tr>
					</s:iterator>
				</table>
			</td>
		</tr>

		<s:if test="cercKeywordList.size()>0">
			<tr valign="top" class="subheading">
				<td colspan="7">Keyword Details</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="4%">S.No.</td>
							<td width="50%">Keyword</td>
							<s:iterator value="cercKeywordList" status="rowstatus">
							<s:if test="refKeywordId.id==6 and cercKeywordList.size()<=1">
							<td width="*">Other Keyword</td>
							</s:if>
							</s:iterator>
						</tr>

						<s:iterator value="cercKeywordList" status="rowstatus">
							<tr>
								<td><s:property value="#rowstatus.count" /></td>
								<td><s:property value="refKeywordId.keywordDescription" /></td>
									<s:if test="refKeywordId.id==6 and cercKeywordList.size()<=1">
								<td><s:property value="cercPetition.otherKeyword" /></td>
							</s:if>							
							</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
		</s:if>

		<s:if test="cercRegulationList.size()>0">
			<tr valign="top" class="subheading">
				<td colspan="7">Regulation Details</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="4%">S.No.</td>
							<td width="96%">Regulation</td>
						</tr>

						<s:iterator value="cercRegulationList" status="rowstatus">
							<tr>
								<td><s:property value="#rowstatus.count" /></td>
								<td><s:property
										value="refRegulationId.regulationDescription" /></td>
							</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
		</s:if>

		<s:if test="cercAssetDetailsViewList.size()>0">
			<tr valign="top" class="subheading">
				<td colspan="7">Asset Details</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="0">
						<tr class="subheading">
							<td width="6%">S. No.</td>
							<td width="34%">Asset Details</td>
							<td width="20%">Refered As</td>
							<td width="20%">Anticipated Doco Date</td>
							<td width="20%">Actual Doco Date</td>

						</tr>
						<s:iterator value="cercAssetDetailsViewList" status="rowstatus">
							<tr
								class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
								<td><s:property value="#rowstatus.count" /></td>
								<td><s:property value="refAssetsId.assetDetails" /></td>
								<td><s:property value="assetName" /></td>
								<td><s:date name="anticipatedDocoDate" format="dd/MM/yyyy" /></td>
								<td><s:date name="actualDocoDate" format="dd/MM/yyyy" /></td>

							</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
		</s:if>

		<tr valign="top" class="subheading">
			<td colspan="7">Petitioner Details</td>
		</tr>
		<tr>
			<td colspan="7"><s:if
					test="cercPetition.cercUserAdvocateId!=null">
					<s:hidden name="isAdvocateAddedinPetition" value="%{'true'}"
						id="isAdvocateAddedinPetition" />
				</s:if> <s:else>
					<s:hidden name="isAdvocateAddedinPetition" value="%{'false'}"
						id="isAdvocateAddedinPetition" />
				</s:else>
				<table border="1" cellspacing="0" cellpadding="0">
					<tr valign="top">
						<td width="5%">S.No.</td>
						<td width="*">Name</td>
						<td width="20%">Mobile</td>
						<td width="30%">E-Mail</td>
						<!-- 					<td width="20%">Advocate</td> -->
					</tr>
					<tr>
						<td>1.</td>
						<td><s:property
								value="cercPetition.cercUserPetitionerId.userName" /></td>
						<td><s:property
								value="cercPetition.cercUserPetitionerId.mobile" /></td>
						<td><s:property
								value="cercPetition.cercUserPetitionerId.email" /></td>
						<%-- 					<td><s:property value="cercPetition.cercUserAdvocateId.userName"/></td> --%>
					</tr>
				</table></td>
		</tr>

		<!-- 		04-05-2020 start SH -->

		<s:if test="cercPetition.additionalPetitionerName != null">
			<tr valign="top" class="subheading">
				<td colspan="7">Additional Petitioner Details</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr valign="top">
							<td width="5%">S.No.</td>
							<td width="20%">Name</td>
						</tr>
						<tr>
							<td>1.</td>
							<td><s:property
									value="cercPetition.additionalPetitionerName" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</s:if>

		<!-- 		04-05-2020 end SH -->

		<s:if test="cercPetition.totalNumberOfRespondents!=0">
			<tr valign="top" class="subheading">
				<td colspan="7">Respondent Details</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr valign="top">
							<td width="5%">S.No.</td>
							<td width="*">Name</td>
							<td width="20%">Mobile</td>
							<td width="30%">E-Mail</td>
							<td width="">Added On</td>
							<!-- 					<td width="20%">Advocate</td> -->
						</tr>
						<s:iterator value="cercRespondentList" status="rowstatus">
							<tr>
								<td><s:property value="#rowstatus.count" /></td>
								<s:if test="cercUserId!=null">
									<td><s:property value="cercUserId.userName" /></td>
									<td><s:property value="cercUserId.mobile" /></td>
									<td><s:property value="cercUserId.email" /></td>
									<td><s:date name="updatedOn" format="dd/MM/yyy" /></td>
								</s:if>
								<s:else>
									<td><s:property value="partyName" /></td>
									<td><s:property value="mobile" /></td>
									<td><s:property value="email" /></td>
									<td><s:date name="updatedOn" format="dd/MM/yyy" /></td>
								</s:else>
								<!-- 					<td></td> -->
							</tr>
						</s:iterator>
						<%-- <s:iterator value="cercOtherRespondentList" status="rowstatus">
				<tr>
					<td><s:property value="%{cercRespondentList.size()+#rowstatus.count}"/></td>
					<td><s:property value="respondentName"/></td>
					<td><s:property value="mobile"/></td>
					<td><s:property value="email"/></td>
					<td></td>
				</tr>
				</s:iterator> --%>
					</table>
				</td>
			</tr>
			<s:if test="cercPetition.totalNumberOfRespondents!=null">

				<tr>
					<td width="15%">Total No Of Respondents</td>
					<td width="1%">:</td>
					<td width="*" colspan="5"><s:property
							value="cercPetition.totalNumberOfRespondents" /></td>
				</tr>
			</s:if>

		</s:if>
		<s:if test="cercCourtDetailsList.size()>0">
			<tr valign="top" class="subheading">
				<td colspan="7">Court Details</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="0">
						<tr class="subheading">
							<td width="4%">S.No.</td>
							<td width="10%">Type</td>
							<td width="26%">Name</td>
							<td width="20%">Case Number</td>
							<td width="20%">Order Date</td>
							<td width="20%">Interim / Final</td>
						</tr>
						<s:iterator value="cercCourtDetailsList" status="rowstatus">
							<tr>
								<td><s:property value="#rowstatus.count" /></td>
								<td><s:property value="agencyType" /></td>
								<s:if test="authorityName!=null and authorityName!=''">
									<td><s:property value="authorityName" /></td>
								</s:if>
								<s:else>
									<td><s:property value="refAgencyNameId.agencyName" /></td>
								</s:else>
								<td><s:property value="caseType" />/<s:property
										value="caseNumber" />/<s:property value="caseYear" /></td>
								<td><s:date name="orderDate" format="dd/MM/yyyy" /></td>
								<td><s:property value="orderType" /></td>
							</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
		</s:if>
		<s:if test="cercRelatedPetitionList.size()>0">
			<tr valign="top" class="subheading">
				<td colspan="7">Related Petition Details</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="4%">S.No.</td>
							<td width="20%">Petition/Diary Number</td>
							<td width="20%">Hearing Date</td>
							<td width="56%">Petition Staus</td>
						</tr>

						<s:iterator var="related" value="cercRelatedPetitionList"
							status="rowstatus">
							<tr>
								<td><s:property value="#rowstatus.count" /></td>
								<td><s:url var="url" action="filingSummary">
										<s:param name="struts.token.name">token</s:param>
										<s:param name="token" value="token" />
										<s:param name="filingBeanId"
											value="%{cercRelatedPetitionId.id}" />
									</s:url> <s:a href="%{url}">
										<s:if
											test="cercRelatedPetitionId.registrationNumberDisplay==null">
											<s:property value="cercRelatedPetitionId.diaryNumberDisplay" />
										</s:if>
										<s:else>
											<s:property
												value="cercRelatedPetitionId.registrationNumberDisplay" />
										</s:else>
									</s:a></td>
								<td><s:iterator var="listing"
										value="cercPetitionListingDetailsList">
										<s:if
											test="%{#related.cercRelatedPetitionId.id==#listing.cercPetitionId.id}">
											<s:date name="hearingDate" format="dd/MM/yyyy" />
										</s:if>
									</s:iterator></td>
								<td><s:property
										value="cercRelatedPetitionId.refStatusId.refStatusPublicDomainId.statusName" />
									<s:if
										test="cercRelatedPetitionId.refStatusId.isDivisionConcat==true">
										<s:if
											test="cercRelatedPetitionId.cercPetitionStatusDivisionList.size()>0">
											<s:iterator
												value="cercRelatedPetitionId.cercPetitionStatusDivisionList">
												<s:if
													test='refDivisionId.divisionCode==6 or refDivisionId.divisionCode==7'>
													<s:if
														test="cercRelatedPetitionId.cercPetitionStatusDivisionList.size()>1">
														<s:property value="refDivisionId.divisionName" /> and 
			 								</s:if>
													<s:else>
														<s:property value="refDivisionId.divisionName" />
													</s:else>
												</s:if>
											</s:iterator>
										</s:if>
									</s:if></td>
							</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
		</s:if>
		<s:if test="cercIdenticalPetitionList.size()>0">
			<tr valign="top" class="subheading">
				<td colspan="7">Identical Petition Details</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="4%">S.No.</td>
							<td width="96%">Petition Number</td>
						</tr>

						<s:iterator value="cercIdenticalPetitionList" status="rowstatus">
							<tr>
								<td><s:property value="#rowstatus.count" /></td>
								<td><s:property
										value="cercIdenticalPetitionId.registrationNumberDisplay" /></td>
							</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
		</s:if>

		<s:if test="cercPrayerList.size()>0">
			<tr valign="top" class="subheading">
				<td colspan="7">Prayer Details</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="4%">S.No.</td>
							<td width="80%">Description</td>
							<td width="16%">Updated On</td>
						</tr>
						<s:iterator value="cercPrayerList" status="rowstatus">
							<tr>
								<td><s:property value="#rowstatus.count" /></td>
								<!-- 			04-07-2020 start AK -->
								<td><s:property value="description" escapeHtml="UTF-8" /></td>
								<!-- 			04-07-2020 end AK -->
								<td><s:date name="updatedOn" format="dd/MM/yyyy" /></td>
							</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
		</s:if>
		<s:if test="cercAssetsList.size()>0">
			<tr valign="top" class="subheading">
				<td colspan="7">Fee Details</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="0">
						<s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='GT'">
							<tr class="subheading" align="center">
								<td width="2%">S.No.</td>
								<td width="16%">Unit Name</td>
								<td width="10%">Type</td>
								<td width="10%">Capacity</td>
								<td width="16%">Anti. DOCO Date</td>
								<td width="18%">Actual DOCO Date</td>
								<td width="*%">Fees</td>
								<td width="10%">From</td>
								<td width="10%">To</td>
								<!-- <td width="8%" align="right">Delete</td> -->
							</tr>
						</s:if>
						<s:elseif
							test="cercPetition.refPetitionTypeId.petitionTypeCode=='MY'">
							<tr class="subheading" align="center">
								<td width="2%">S.No.</td>
								<td width="16%">Asset Name</td>
								<td width="10%">Type</td>
								<td width="10%">ATC</td>
								<td width="16%">Anti. DOCO Date</td>
								<td width="18%">Actual DOCO Date</td>
								<td width="*%">Fees</td>
								<td width="10%">From</td>
								<td width="10%">To</td>
								<!-- <td width="8%" align="right">Select</td> -->
							</tr>
						</s:elseif>
						<s:elseif
							test="cercPetition.refPetitionTypeId.petitionTypeCode=='TL'">
							<tr class="subheading" align="center">
								<td width="2%">S.No.</td>
								<td width="16%">Line Name</td>
								<td width="10%">Type</td>
								<td width="10%">ATC</td>
								<td width="16%">Anti. DOCO Date</td>
								<td width="18%">Actual DOCO Date</td>
								<td width="*%">Fees</td>
								<td width="10%">From</td>
								<td width="10%">To</td>
								<!-- <td width="8%" align="right">Select</td> -->
							</tr>
						</s:elseif>
						<s:elseif
							test="cercPetition.refPetitionTypeId.petitionTypeCode=='TD'">
							<tr class="subheading" align="center">
								<td width="2%">S.No.</td>
								<td width="40%">Category</td>
								<td width="20%">From</td>
								<td width="20%">To</td>
								<td width="18%" align="right">Select</td>
							</tr>
						</s:elseif>
						<s:iterator value="cercAssetsList" status="rowstatus">
							<tr valign="top"
								class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
								<td><s:property value="#rowstatus.count" /></td>
								<td><s:property value="assetName" /></td>
								<td><s:if test='assetType=="E"'>Existing</s:if>
									<s:else>New</s:else></td>
								<td align="right"><s:property
										value="getText('{0,number,#,##0.##}',{capacity})" /></td>
								<td align="center"><s:date name="anticipatedDocoDate"
										format="dd/MM/yyyy" /></td>
								<td align="center"><s:date name="actualDocoDate"
										format="dd/MM/yyyy" /></td>
								<td align="right"><s:property
										value="getText('{0,number,#,##0}',{feeCalculated})" /></td>
								<td align="center"><s:property value="feePeriodFrom" /></td>
								<td align="center"><s:property value="feePeriodTo" /></td>
								<%-- <td align="right"><s:if test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'"><s:a href="#" onClick="return deleteConfirmation();">Delete</s:a></s:if></td> --%>
							</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
		</s:if>
		<s:if test="cercPetitionFeeList.size()>0">
			<tr valign="top" class="subheading">
				<td colspan="7">Total Fee</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="0">
						<tr class="subheading" align="center">
							<td width="20%">Calculated</td>
							<td width="15%">Surcharge</td>
							<td width="20%">Total Fee</td>
							<td width="20%">Fee Paid</td>
							<td width="15%">Balance</td>
							<!-- <td width="30%">UTR Number</td>
						<td width="20%">UTR Date</td> -->
						</tr>
						<s:iterator value="cercPetitionFeeList">
							<%-- <s:if test="cercPetitionUtrList.size()>0"> --%>
							<%-- <s:iterator value="cercPetitionUtrList" status="rowstatus"> --%>
							<tr align="center">
								<td>&#8377; <s:property value="feeCalculated" /></td>
								<td>&#8377; <s:property value="surcharge" /></td>
								<td>&#8377; <s:property value="totalFee" /></td>
								<td>&#8377; <s:property value="feePaid" /></td>
								<s:if test="cercPetition.isApplicableForWaiver">
									<td colspan="3">Fee Applicable For Waiver</td>
								</s:if>
								<s:else>
									<td>&#8377; <s:property value="balanceFee" /></td>
									<%-- <td><s:property value="refUtrId.utrNumber"/><br/>[<s:property value="refUtrId.refStatusId.statusName"/>]</td>
					<td><s:property value="refUtrId.depositDate"/></td> --%>
								</s:else>
							</tr>
							<%-- </s:iterator> --%>
							<%-- </s:if> --%>
							<s:else>
								<tr align="center">
									<td>&#8377; <s:property value="feeCalculated" /></td>
									<td>&#8377; <s:property value="surcharge" /></td>
									<td>&#8377; <s:property value="totalFee" /></td>
									<td>&#8377; <s:property value="feePaid" /></td>
									<s:if test="cercPetition.isApplicableForWaiver">
										<td colspan="3">Fee Applicable For Waiver</td>
									</s:if>
									<s:else>
										<td>&#8377; <s:property value="balanceFee" /></td>
										<td><s:property value="refUtrId.utrNumber" /><br />[<s:property
												value="refUtrId.refStatusId.statusName" />]</td>
										<td><s:property value="refUtrId.depositDate" /></td>
									</s:else>
								</tr>
							</s:else>
							<s:if test='remarks!=null and remarks!=""'>
								<tr>
									<td colspan="7" align="left"><hr /></td>
								</tr>
								<tr>
									<td colspan="7" align="left"><b>Fee Remarks:</b>&nbsp;<s:property
											value="remarks" /></td>
								</tr>
							</s:if>
							<s:if test='cercPetition.refWaiverGroundsId!=null'>
								<tr>
									<td colspan="7" align="left"><hr /></td>
								</tr>
								<tr>
									<td colspan="7" align="left"><b>Reason For applying
											fee waiver:</b>&nbsp;<s:property
											value="cercPetition.refWaiverGroundsId.description" /></td>
								</tr>
							</s:if>
						</s:iterator>

					</table>
				</td>
			</tr>
		</s:if>
		<s:if test="cercPetitionUtrList.size()>0">
			<tr valign="top" class="subheading">
				<td colspan="7">Details of the UTR.</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="0">
						<tr class="subheading" align="center">
							<td width="20%">UTR Date</td>
							<td width="30%">UTR Number</td>
							<td width="20%">Fee Paid</td>
						</tr>
						<s:if test="cercPetitionUtrList.size()>0">
							<s:iterator value="cercPetitionUtrList" status="rowstatus">
								<tr align="center">
									<td><s:property value="refUtrId.depositDate" /></td>
									<td><s:property value="refUtrId.utrNumber" /><br />[<s:property
											value="refUtrId.refStatusId.statusName" />]</td>
									<td>&#8377; <s:property
											value="getText('{0,number,##0}',{amountPaidFromUtr})" /></td>
								</tr>
							</s:iterator>
						</s:if>
					</table>
				</td>
			</tr>
		</s:if>

		<s:if test="cercPetitionAnnualFeeList.size>0">
			<tr valign="top" class="subheading">
				<td colspan="7">Annual Fee Details</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="0">
						<tr class="subheading">
							<td width="5%">S.No.</td>
							<td width="15%">Tariff Period</td>
							<td width="10%">From Year</td>
							<td width="10%">To Year</td>
							<td width="15%">Fee Paid</td>
							<td width="30%">Paid By</td>
							<td width="15%">Paid On</td>
						</tr>
						<s:iterator value="cercPetitionAnnualFeeList" status="rowstatus">
							<tr>
								<td><s:property value="%{#rowstatus.count}" /></td>
								<td><s:property value="refTariffPeriodId.periodDisplay" /></td>
								<td><s:property value="feePeriodFrom" /></td>
								<td><s:property value="feePeriodTo" /></td>
								<td><s:property value="feePaid" /></td>
								<td><s:property value="updatedBy.firstName" /></td>
								<td><s:date name="updatedOn" format="dd/MM/yyyy" /></td>
							</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
		</s:if>
		<s:if test="cercPetitionUtrList1.size()>0">

			<tr valign="top" class="subheading">
				<td colspan="7">Details of the UTR. In Annual Fees</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="0">
						<tr class="subheading" align="center">
							<td width="20%">UTR Date</td>
							<td width="30%">UTR Number</td>
							<td width="20%">Fee Paid</td>
						</tr>

						<s:if test="cercPetitionUtrList1.size()>0">

							<s:iterator value="cercPetitionUtrList1" status="rowstatus">
								<tr align="center">
									<td><s:property value="refUtrId.depositDate" /></td>
									<td><s:property value="refUtrId.utrNumber" /><br />[<s:property
											value="refUtrId.refStatusId.statusName" />]</td>
									<td>&#8377; <s:property
											value="getText('{0,number,##0}',{amountPaidFromUtr})" /></td>
								</tr>
							</s:iterator>
						</s:if>
					</table>
				</td>
			</tr>
		</s:if>

		<s:if test="filingFeeAdjustmentDetailsList.size>0">
			<tr valign="top" class="subheading">
				<td colspan="7">Truing Up Details</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr class="subheading" valign="middle" align="center">
							<td width="9%" rowspan="2">Financial Year</td>
							<td width="9%" rowspan="2">Petition Number</td>
							<td width="9%" rowspan="2">Assets Name</td>
							<td width="9%">Filing fees already paid</td>
							<td width="9%">Revised Tariff</td>
							<td width="9%">Revised Rate</td>
							<td width="9%">Revised Filing fees</td>
							<td width="9%">Round off</td>
							<td width="9%">Net fee Payable</td>
							<td width="9%" rowspan="2">Total fee Adjusted</td>
							<td width="9%" rowspan="2">UTR Number</td>
						</tr>
						<tr class="subheading" valign="middle" align="center">
							<td width="10%">A</td>
							<td width="10%">B</td>
							<td width="10%">C</td>
							<td width="10%">B x C</td>
							<td width="10%">D</td>
							<td width="10%">D - A</td>
						</tr>
						<s:iterator value="filingFeeAdjustmentDetailsList"
							status="rowstatus">
							<tr align="center">
								<td><s:property value="yearFrom" />-<s:property
										value="yearTo" /></td>
								<td><s:property value="petitionName" /></td>
								<td><s:property value="assetName" /></td>
								<td><s:property value="feeAlreadyPaid" /></td>
								<td><s:property value="revisedTariff" /></td>
								<td align="right"><s:property value="revisedRate" /></td>
								<td><s:property value="revisedFee" /></td>
								<td><s:property value="roundedOffFee" /></td>
								<td><s:property value="netFeePayable" /></td>
								<td><s:property value="totalFeeAdjusted" /></td>
								<td><s:property value="refUtrId.utrNumber" /></td>
							</tr>
						</s:iterator>
						<%-- <tr valign="middle" align="left">
						<td colspan="3">Total</td>
						<td><s:textfield name="totalFeeAlreadyPaid" id="totalFeeAlreadyPaid" size="10" readonly="true"/></td>
						<td><s:textfield name="totalRevisedTariff" id="totalRevisedTariff" size="10" readonly="true"/></td>
						<td></td>
						<td><s:textfield name="totalRevisedFee" id="totalRevisedFee" size="10" readonly="true"/></td>
						<td><s:textfield name="totalRoundedOffFee" id="totalRoundedOffFee" size="10" readonly="true"/></td>
						<td><s:textfield name="totalAdjustmentAmount" id="totalAdjustmentAmount" size="10" readonly="true"/></td>
					</tr> --%>
					</table>
				</td>
			</tr>
		</s:if>

		<s:if test="cercPetitionDocumentsList.size()>0">

			<tr valign="top" class="subheading">
				<td colspan="7">Attachment Details</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="4%">S.No.</td>
							<td width="40%">Document Type</td>
							<td width="40%">Document Name</td>
							<td width="16%">Uploaded On</td>
						</tr>
						<s:iterator value="cercPetitionDocumentsList" status="rowstatus">
							<tr>
								<s:url action="openUploadedFile" var="openPdfFile"
									escapeAmp="false">
									<s:param name="struts.token.name">token</s:param>
									<s:param name="token" value="token" />
									<s:param name="openUploadedFileName">
										<s:property value="fileName" />
									</s:param>
									<s:param name="openUploadedFileNameDisplay">
										<s:property value="fileNameDisplay" />
									</s:param>
									<s:param name="filingBeanId" value="filingBeanId" />
								</s:url>
								<td><s:property value="#rowstatus.count" /></td>
								<td><s:property value="refDocumentId.documentName" /></td>
								<td><s:a href="%{openPdfFile}" title="Click to Open">
										<s:property value="fileNameDisplay" />
									</s:a></td>
								<td><s:date name="updatedOn" format="dd/MM/yyyy hh:mm a" />
									<s:if test="refDocumentId.id==8">
										<s:hidden name="vakalatnamaUploaded" value="%{'true'}" />
									</s:if></td>
							</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
		</s:if>
		<s:if test="cercChecklistList.size()>0">
			<tr valign="top" class="subheading">
				<td colspan="7">Checklist</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="5%">S.No.</td>
							<td width="80%">Particulars</td>
							<td width="15%" align="right">Status</td>
						</tr>

						<s:iterator value="cercChecklistList" status="rowstatus">
							<tr valign="top">
								<td><s:if
										test="#rowstatus.count != 3 and #rowstatus.count != 4 and #rowstatus.count != 5 and #rowstatus.count != 6">
										<s:property
											value="#rowstatus.count == 1 or #rowstatus.count == 2 ? #rowstatus.count : (#rowstatus.count - 4)" />
									</s:if></td>
								<td><s:property value="refChecklistId.description" /></td>
								<td align="right"><s:if test="#rowstatus.count != 2">
										<s:if test='%{checkStatus=="N"}'>Yes</s:if>
										<s:elseif test='%{checkStatus=="Y"}'>No</s:elseif>
										<s:else>N/A</s:else>
										<%-- <s:radio list="#{'Y':'Yes','N':'No','A':'NA'}" name="cercChecklistList[%{#rowstatus.index}].checkStatus" id="checkStatus" theme="simple" /> --%>
									</s:if></td>
							</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
		</s:if>
		<s:if test="cercPetitionDeficiencies.size()>0">
			<tr valign="top" class="subheading">
				<td colspan="7">Deficiencies</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="5%">S.No.</td>
							<td width="39%">Deficiencies</td>
							<td width="12%">Notification Date</td>
							<td width="15%">Notified By</td>
							<td width="12%">Cured Date</td>
							<td width="15%">Cured By</td>
						</tr>

						<s:iterator value="cercPetitionDeficiencies" status="rowstatus">
							<tr valign="top">
								<td><s:property value="#rowstatus.count" /></td>
								<td><s:property value="description" /></td>
								<td><s:date name="notificationDate" format="dd/MM/yyyy" /></td>
								<td><s:property value="notifiedBy.userName" /></td>
								<td><s:date name="cureDate" format="dd/MM/yyyy" /></td>
								<td><s:property value="curedBy.userName" /></td>
							</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
		</s:if>


		<!--    Start        add checkList of existing -->

		<s:if test="cercPetitionDeficiencies.size()>0">
			<tr class="subheading">
				<td colspan="7">Deficiency List</td>
			</tr>
			<tr>
				<td colspan="7">
					<table>
						<tr class="subheading" align="center">
							<td width="5%">S. No.</td>
							<!-- 							<td width="10%">Name</td> -->
							<td width="61%">Deficiency Description</td>
							<td width="12%">Notification Date</td>
							<td width="12%">Deficiency still Exists<s:property
									value="%{cercPetitionDeficiencies[#outstatus.index].cercPetitionDeficienciesList.size()}" />
							</td>
						</tr>
						<s:set var="counter" value="%{0}" />
						<s:iterator value="cercPetitionDeficiencies" status="outstatus">
							<s:iterator value="cercPetitionDeficienciesList"
								status="rowstatus">
								<tr valign="top"
									class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
									<s:set var="counter" value="%{#counter+1}" />
									<td><s:property value="#counter" /></td>
									<%-- 										<td><s:property value="refChecklistId.checklistName"/></td> --%>
									<td><s:property value="refChecklistId.description" /></td>
									<td><s:date name="notificationDate"
											format="dd/MM/yyyy kk:mm" /></td>
									<td><s:if
											test='%{cercPetitionDeficiencies[#outstatus.index].cercPetitionDeficienciesList[#rowstatus.index].status=="Y"}'>
												Yes</s:if>
										<s:else>No</s:else></td>
								</tr>

							</s:iterator>
						</s:iterator>
					</table>
				</td>
			</tr>
		</s:if>

		<%-- <s:if test="notifiedSummaryList.size()>0">
			<tr class="subheading">
				<td colspan="7">Deficiency List</td>
			</tr>
			<tr>
				<td colspan="7">
					<table>
						<tr class="subheading" align="center">
							<td width="5%">S. No.</td>
							<td width="10%">Name</td>
							<td width="61%">Deficiency Description</td>
							<td width="12%">Notification Date</td>
							<td width="12%">Deficiency still Exists<s:property value="notifiedSummaryList.cercPetitionDeficienciesList.size()"/> </td>
						</tr>
						<s:iterator value="notifiedSummaryList" status="outstatus">
							<s:iterator value="cercPetitionDeficienciesList" status="rowstatus">
								<s:if test='status=="Y"'>
									<tr valign="top" class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
										<td><s:property value="#rowstatus.count"/></td>
										<td><s:property value="refChecklistId.checklistName"/></td>
										<td><s:property value="refChecklistId.description"/></td>
										<td><s:date name="notificationDate" format="dd/MM/yyyy kk:mm"/></td>
										<s:if test="cercPetition.cercUserPetitionerId.refOrganisationId.id!=1 and cureDate==null">
											<td>
												<s:if test='%{cercPetitionDeficiencies[#outstatus.index].cercPetitionDeficienciesList[#rowstatus.index].status=="Y"}'>
												Yes</s:if><s:else>No</s:else> 
											</td>
										</s:if>
										<s:else>
											<td>
												<s:if test='%{cercPetitionDeficiencies[#outstatus.index].cercPetitionDeficienciesList[#rowstatus.index].status=="Y"}'>
												Yes</s:if><s:else>No</s:else> 
											</td>
										</s:else>
									</tr>
								</s:if>
							</s:iterator>
						</s:iterator>
					</table>
				</td>
			</tr>
			</s:if> --%>


		<!--    Start        add checkList of existing -->


		<s:if test="cercPetitionDeficienciesDocumentsList.size()>0">

			<tr valign="top" class="subheading">
				<td colspan="7">Deficiency Documents</td>
			</tr>
			<tr>
				<td colspan="7">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="4%">S.No.</td>
							<td width="38%">Document Type</td>
							<td width="38%">Document Name</td>
							<td width="20%">Uploaded On</td>
						</tr>
						<s:iterator value="cercPetitionDeficienciesDocumentsList"
							status="rowstatus">
							<tr>
								<s:url action="openUploadedFile" var="openPdfFile"
									escapeAmp="false">
									<s:param name="struts.token.name">token</s:param>
									<s:param name="token" value="token" />
									<s:param name="openUploadedFileName">
										<s:property value="fileNameDisplay" />
									</s:param>
									<s:param name="openUploadedFileNameDisplay">
										<s:property value="fileNameDisplay" />
									</s:param>
									<s:param name="filingBeanId" value="filingBeanId" />
									<s:param name="constantName" value="%{'cercPleadingDocuments'}" />
								</s:url>
								<td><s:property value="#rowstatus.count" /></td>
								<td><s:property value="refDocumentId.documentName" /></td>
								<td><s:a href="%{openPdfFile}" title="Click to Open">
										<s:property value="fileName" />
									</s:a></td>
								<td><s:date name="updatedOn" format="dd/MM/yyyy hh:mm a" />
								</td>
							</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
		</s:if>
		<s:if test="cercPetition.diaryNumber==null">
			<tr class="subheading">
				<td colspan="7">Intimation Details</td>
			</tr>
			<tr>
				<td>Intimation to</td>
				<td>:</td>
				<td colspan="5"><s:radio list="#{'A':'All'}"
						name="intimationToCheck" id="intimationTo" value="'A'" /></td>
			</tr>
			<tr class="selectedIntimation">
				<td>&nbsp;</td>
				<td>:</td>
				<td colspan="5">
					<%-- 			<s:checkboxlist list="#{'PI':'Petitioners','RE':'Respondents','PA':'Petitioner Advocates','RA':'Respondent Advocates'}" name="intimationTo" id="intimationTo" value="'A'"/> --%>

					<s:if test="filingBean.noRespondents">
						<s:checkboxlist list="#{'PI':'Petitioners'}" name="intimationTo"
							id="intimationTo" value="'A'" />
					</s:if> <s:else>
						<s:checkboxlist list="#{'PI':'Petitioners','RE':'Respondents'}"
							name="intimationTo" id="intimationTo" value="'A'" />
					</s:else>
				</td>
			</tr>

			<tr class="subheading">
				<td colspan="7">Declaration</td>
			</tr>
			<tr>
				<td colspan="7">
					<div style="text-align: justify; text-justify: inter-word;">
						<input type="checkbox" name="disclaimer" id="disclaimer" />
						<s:property value="disclaimer" />
					</div>
				</td>
			</tr>
		</s:if>
		<!-- <tr><td colspan="7">
		<jc:image height="300" width="300"/></td></tr> -->
		<tr>
			<td colspan="7" align="right"><s:if
					test="#session.CERC_USER.refOrganisationId.id == 1 and #session.CERC_USER.userType == 'E' and secret== 'secret'">
				Choose Level & officer :-
				<s:select
						list="#{'1':'Legal Officer','2':'Deputy Director','3':'Director','4':'Executive Director','5':'Secretary','6':'Member1','7':'Member2','8':'Chairperson'}"
						name="level" id="level" theme="simple" headerValue="- Select -"
						headerKey="-1" cssStyle="width:150pt" />
					<s:select list="cercUserList" listKey="id"
						listValue="lastName+'  '+firstName" name="cercUserrId.id"
						id="cercUserrId" theme="simple" headerValue="- Select -"
						headerKey="" cssStyle="width:150pt" />
					<br>
					<br>
					<input type="button" id="approveButton" name="approveButton"
						value="Accept" class="formbutton" onclick="verifyPetition()" />&nbsp;&nbsp;
					
					<input type="button" id="resetbutton" name="resetbutton"
						value="Reject" class="formbutton" onclick="rejectPetition()" />&nbsp;&nbsp;
					remarks
					<span id="rejectedRemarksstar" name="rejectedRemarksstar"
						class="required">*</span> 
					: &nbsp;&nbsp; <textarea name="rejectedRemarks"
						id="rejectedRemarks"></textarea>&nbsp;&nbsp;
				</s:if> <s:if test="#session.ACTIVE_MENU=='Draft Petition'">
					<input type="button" id="previousbutton" name="previousbutton"
						value=" &lt;&lt; Previous" class="formbutton"
						onClick="filingCheckList()" />&nbsp;&nbsp;
				</s:if> <s:if
					test="#session.ACTIVE_MENU=='Draft Petition' or #session.ACTIVE_MENU=='e-File Petition'">
					<input type="submit" id="filePetitionbutton"
						name="filePetitionbutton" value="File Petition" class="formbutton" />&nbsp;&nbsp;
					<input type="reset" id="resetbutton" name="resetbutton"
						value="Reset" class="formbutton" />&nbsp;&nbsp;
				</s:if> <s:url action="downloadFullPleading" var="downloadFullPleading"
					escapeAmp="false">
					<s:param name="struts.token.name">token</s:param>
					<s:param name="token" value="token" />
					<s:param name="filingBeanId" value="filingBeanId" />
				</s:url> <%-- <s:if test = "cercPetition.diaryNumber != null">
        			<s:a href="%{downloadFullPleading}" title="Click to Open">
        				<input type="button" id="downloadbutton" name="downloadbutton" value="Download Full Pleading" class="formbutton"/>
        			</s:a> 
					</s:if> --%> <s:hidden name="reportName"
					value="petitionSummary.rptdesign" /> <s:submit id="printbutton"
					name="printbutton" value="Print" class="formbutton"
					action="openSummaryReport" /> <s:if
					test="#session.CERC_USER.refOrganisationId.id == 1 and #session.CERC_USER.userType == 'E'">
					<s:submit type="cancelbutton" name="submitbutton" value="Cancel"
						class="formbutton" action="viewNodalOfficerVerificationPetitions" />
				</s:if> <s:else>
					<s:submit id="cancelbutton" name="cancelbutton" value="Cancel"
						class="formbutton" action="welcome" />
				</s:else></td>
		</tr>
	</table>
	<s:token />
</s:form>

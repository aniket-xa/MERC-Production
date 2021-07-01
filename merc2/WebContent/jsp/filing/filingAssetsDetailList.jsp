<%@ taglib uri="/struts-tags" prefix="s"%>

<script type="text/javascript">
function chkValidationList(lisize){
	var chkFlag=false;
	//alert(chkFlag);
	for (var i = 0; i < lisize; i++) 
	{
		//alert(chkFlag+" : "+i);
		if(document.getElementById("cercAssetsBeanList["+i+"].isSelected").checked)
		{
			//alert("Inside if "+chkFlag);
			//alert(document.getElementById("cercAssetsBeanList["+i+"].feePeriodFrom").value + " " + document.getElementById("cercAssetsBeanList["+i+"].feePeriodTo").value)
			chkFlag=true;
			var pFrom=document.getElementById("cercAssetsBeanList["+i+"].feePeriodFrom").value;
			var pTo=document.getElementById("cercAssetsBeanList["+i+"].feePeriodTo").value;
			
			if(pFrom=="" || pTo=="")
			{
				alert("Please select period.");
				return false;
			}
			else
			{
				var pFromInt=parseInt(pFrom);
				var pToInt=parseInt(pTo);
				if (pFromInt > pToInt){
					alert("Period From should be less than Period To.");
					return false;
				}
			}
			
		}
		else if(chkFlag==false && i==lisize-1)
		{
			//alert("Inside else "+chkFlag);
			alert("Please check at least one Unit.");
			return false;
		}
		
	} 
		
	
	document.filingAssetsDetails.action="filingAssetsDetailListSave";
	document.filingAssetsDetails.submit();
	
}
	function filingAssetsDisplayList(){
		if($('#refGenerationTransmissionId').val()=="")
		{
			alert("Please select generation station.");
			return false;
		}
		else if($('#tariffPeriodId').val()=="")
		{
			alert("Please select tariff period.");
			return false;
		}
		else
		{
			document.filingAssetsDetails.action="filingAssetsDetailList";
			document.filingAssetsDetails.submit();
		}
	}
	
	
</script>

<s:include value="/jsp/tiles/tabs.jsp"></s:include>
<s:form theme="simple" name="filingAssetsDetails" action="filingAssetsDetailListSave">
<s:hidden name="filingBeanId"/>
	<table border = "0">
		<tr>
			<th colspan="7" class="mainheading">Assets / Units 	Details</th>
		</tr>
		<s:if test="registrationNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Petition No. : <s:property value="registrationNumberDisplay"/></td>
			</tr>
			<tr>
				<td colspan="3" align="left">Diary No. : <s:property value="diaryNumberDisplay"/></td>
				<td colspan="1" align="center"></td>
				<td colspan="3" align="right">Reference No. : <s:property value="referenceNumberDisplay"/></td>									
			</tr>
		</s:if>
		<s:elseif test="diaryNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Diary No. : <s:property value="diaryNumberDisplay"/></td>													
			</tr>
			<tr>
				<td colspan="3" align="left"></td>
				<td colspan="1" align="center"></td>
				<td colspan="3" align="right">Reference No. : <s:property value="referenceNumberDisplay"/></td>									
			</tr>
		</s:elseif>
		<s:elseif test="referenceNumber!=null">
			<tr class="subheading">
				<td colspan="7" align="center">Reference No. : <s:property value="referenceNumberDisplay"/></td>									
			</tr>
		</s:elseif>
		<s:hidden name="referenceNumber"/>
		<s:hidden name="referenceYear"/>
		<s:hidden name="referenceNumberDisplay"/>
		<s:hidden name="diaryNumber"/>
		<s:hidden name="diaryYear"/>
		<s:hidden name="diaryNumberDisplay"/>
		<s:hidden name="registrationNumber"/>
		<s:hidden name="registrationYear"/>
		<s:hidden name="registrationNumberDisplay"/>
		
		
		<tr>
			<td width="20%">
						<s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='MT'">
				Generation Station
				</s:if>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TT'">
				Project Name
				</s:elseif>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TL'">
				Project Name
				</s:elseif>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TD'">
				Category
				</s:elseif>
				<span class="required">*</span></td>
			<td width="1%">:</td>
			<td width="28%">
			<s:if test="refGenerationTransmissionList.size>0">
			<s:select list="refGenerationTransmissionList" name="refGenTrans" id="refGenerationTransmissionId" listKey="id" listValue="generationTransmissionName" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/>
			</s:if>
			<s:else>
			<s:select list="refLicensingCategoryList" name="refGenTrans" id="refGenerationTransmissionId" listKey="id" listValue="licensingCategoryDescription" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/>
			</s:else>
			</td>
			<td width="2%"></td>
			<td width="20%"></td>
			<td width="1%"></td>
			<td width="28%"></td>
		</tr>		
		<tr>
			<td>Tariff Period</td>
			<td>:</td>
			<td colspan="5">
			<s:select list="refTariffPeriodList" name="tariffPeriod" id="tariffPeriodId" listKey="id" listValue="periodDisplay" headerKey="" headerValue="-- Select --" cssStyle="width:142pt"/>
			&nbsp;&nbsp;
			<s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='MT'">
				<input type="submit" id="searchbutton" value="Get Units" class="formbutton" onclick="return filingAssetsDisplayList()"/>
				</s:if>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TT'">
				<input type="submit" id="searchbutton" value="Get Assets" class="formbutton" onclick="return filingAssetsDisplayList()"/>
				</s:elseif>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TL'">
				<input type="submit" id="searchbutton" value="Get Assets" class="formbutton" onclick="return filingAssetsDisplayList()"/>
				</s:elseif>
			</td>
		</tr>
		<s:if test="cercAssetsBeanList.size>0">
		<tr>
			<td colspan="7">
				<table border="0">
				<s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='MT'">
					<tr class="subheading" align="center">
						<td width="2%">#</td>
						<td width="16%">Unit Name</td>
						<td width="10%">Unit Type</td>
						<td width="10%">Capacity</td>
						<td width="16%">Anti. DOCO Date</td>
						<td width="18%">Actual DOCO Date</td>
						<td width="10%">From</td>
						<td width="10%">To</td>
						<td width="8%" align="right">Select</td>
					</tr>
				</s:if>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TT'">
					<tr class="subheading" align="center">
						<td width="2%">#</td>
						<td width="16%">Asset Name</td>
						<td width="10%">Asset Type</td>
						<td width="10%">ATC (Rs)</td>
						<td width="16%">Anti. DOCO Date</td>
						<td width="18%">Actual DOCO Date</td>
						<td width="10%">From</td>
						<td width="10%">To</td>
						<td width="8%" align="right">Select</td>
					</tr>
				</s:elseif>
				<s:elseif test="cercPetition.refPetitionTypeId.petitionTypeCode=='TL'">
					<tr class="subheading" align="center">
						<td width="2%">#</td>
						<td width="16%">Line Name</td>
						<td width="10%">Asset Type</td>
						<td width="10%">ATC (Rs)</td>
						<td width="16%">Anti. DOCO Date</td>
						<td width="18%">Actual DOCO Date</td>
						<td width="10%">From</td>
						<td width="10%">To</td>
						<td width="8%" align="right">Select</td>
					</tr>
				</s:elseif>
					<s:iterator value="cercAssetsBeanList" status="rowstatus">
					<tr valign="top"  class='<s:if test="#rowstatus.even">colored_td</s:if><s:else>white_td</s:else>'>
						<td><s:property value="#rowstatus.count"/> </td>
						<td><s:property value="assetName"/></td>
						<td>
						<s:hidden name="cercAssetsBeanList[%{#rowstatus.index}].assetsId"/>
						<s:hidden name="cercAssetsBeanList[%{#rowstatus.index}].assetName"/>
						<s:hidden name="cercAssetsBeanList[%{#rowstatus.index}].assetType"/>
						<%-- <s:hidden name="cercAssetsBeanList[%{#rowstatus.index}].capacity"/> --%>
						<s:hidden name="cercAssetsBeanList[%{#rowstatus.index}].anticipatedDocoDate"/>
						<s:hidden name="cercAssetsBeanList[%{#rowstatus.index}].actualDocoDate"/>
						
						<%-- <s:if test="cercAssetsBeanList[%{#rowstatus.index}].assetType=='N'">Existing</s:if>
						<s:elseif test="cercAssetsBeanList[%{#rowstatus.index}].assetType=='E'">New</s:elseif>
						<s:elseif test="cercAssetsBeanList[%{#rowstatus.index}].assetType=='O'">Operational</s:elseif>
						<s:elseif test="cercAssetsBeanList[%{#rowstatus.index}].assetType=='P'">Non Operational</s:elseif> --%>
						<s:property value="assetType"/>
						</td>
						<td><s:textfield name="cercAssetsBeanList[%{#rowstatus.index}].capacity" value="%{getText('{0,number,###0}',{capacity})}"/></td>
						<%-- <td><s:property value="getText('{0,number,#,##0}',{capacity})"/></td> --%>
						<td><s:date name="anticipatedDocoDate" format="dd/MM/yyyy"/></td>
						<td><s:date name="actualDocoDate" format="dd/MM/yyyy"/></td>
						<td align="right">
						<s:select list="feePeriodList" name="cercAssetsBeanList[%{#rowstatus.index}].feePeriodFrom" id="cercAssetsBeanList[%{#rowstatus.index}].feePeriodFrom" headerKey="" headerValue="-- Select --" cssStyle="width:70pt"/>
						</td>
						<td align="right">
						<s:select list="feePeriodList" name="cercAssetsBeanList[%{#rowstatus.index}].feePeriodTo" id="cercAssetsBeanList[%{#rowstatus.index}].feePeriodTo" headerKey="" headerValue="-- Select --" cssStyle="width:70pt"/>
						</td>
						<td align="right"><s:checkbox name="cercAssetsBeanList[%{#rowstatus.index}].isSelected" id="cercAssetsBeanList[%{#rowstatus.index}].isSelected"/></td>
					</tr>
					</s:iterator>
				</table>
			</td>
		</tr>	
		<tr>
			<td align="right" colspan="7">
			<input type="submit" id="savebutton" value="Save" class="formbutton" onclick="return chkValidationList(<s:property value="cercAssetsBeanList.size"/>);"/>&nbsp;&nbsp;
			<input type="reset" id="searchbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
			<s:submit type="submit" id="searchbutton" value="Cancel" class="formbutton" action="filingFeeDetails"/></td>
		</tr>
		</s:if>
		<s:if test="cercPetition.refPetitionTypeId.petitionTypeCode=='TD'">
		<tr>
			<td align="right" colspan="7">
			<input type="submit" id="savebutton" value="Save" class="formbutton" />&nbsp;&nbsp;
			<input type="reset" id="resetbutton" value="Reset" class="formbutton" />&nbsp;&nbsp;
			<s:submit type="submit" id="cancelbutton" value="Cancel" class="formbutton" action="filingFeeDetails"/></td>
		</tr>
		</s:if>
	</table>
	<s:token/>
</s:form>	
            	
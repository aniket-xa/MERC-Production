<%@ taglib uri="/struts-tags" prefix="s"%>
<script>
$(document).ready(function() {
$("input[name='savebutton']").click(function(){
	$.ajax({
	    url: "dataMigrationStart",
        dataType: "json",
        beforeSend: function (xhr){
            //xhr.setRequestHeader('Authorization', base64);
            $('#loadingmessage').show();
        },
        success: function(data)
        {
        	 alert("Data have been migrated successfully");
        	 document.getElementById("generated").value=true;
        	 //document.getElementById("savebutton").disabled=true;
        	 //document.getElementById("njrs").disabled=false;
        	 $('#loadingmessage').hide();
        },
        error: function(xhr, status, error)
        {
        	 $('#loadingmessage').hide();
        	 alert("There is some problem with migration Utility");
            	//alert(xhr.statusText);
        	
        }
    });
});
});
</script>
<body>

<h2>Data Migration Utility</h2>
<br/>
<s:form>
<input type="hidden" id="generated" name="generated"/>
<input name="savebutton" type="button" value="Migrate Data" class="formbutton" />&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="refConfiguration.description"/>&nbsp;<s:property value="refConfiguration.displayName"/>
<!-- <input name="savebutton" type="button" value="Generate" onclick="migrateData()"/> -->
   <div id='loadingmessage' style='display:none'>
       <img src='/cerc/images/ajax-loader.gif'/>
</div>
</s:form>

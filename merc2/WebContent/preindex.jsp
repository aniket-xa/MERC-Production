<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
    <head>
        <script type="text/javascript">
            function submitPage(){
            	document.indexpage.action="index";
        		document.indexpage.submit();
            }
        </script>
    </head>
    <body onload="submitPage()">
        <s:form theme="simple" name="indexpage" namespace="/cerc">
         <s:token/>   
        </s:form>
    </body>
</html>
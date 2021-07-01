<%@ taglib uri="/struts-tags" prefix="s"%>

<s:form theme="simple" name="respondentMapping" action="siteMap">

	<table border="0">
		<tr>
			<th colspan="7" class="mainheading" align="left">MERC E-FILLING SITEMAP</th>
		</tr>
	</table>
	<table border="0">
		<li><a
			href="login.action?struts.token.name=token&token=<s:property value="token"/>">Home</a></li>
		<!-- ADMIN -->
		<li class=''><a href="#">Admin</a>
			<ul class="dropdown-menu">
				<li><a
					href="login.action?struts.token.name=token&token=<s:property value="token"/>">Change
						Password</a></li>
				<li><a
					href="login.action?struts.token.name=token&token=<s:property value="token"/>">Document
						Athorisation</a></li>

				<li><a class="has_submenu" href="#">Master</a>
					<ul class="dropdown-menu">
						<li><a
							href="login.action?struts.token.name=token&token=<s:property value="token"/>">Asset
								Master</a></li>
						<li><a
							href="login.action?struts.token.name=token&token=<s:property value="token"/>">Project
								Master</a></li>
						<li><a
							href="login.action?struts.token.name=token&token=<s:property value="token"/>">Respondent
								Mapping</a></li>
						<li><a
							href="login.action?struts.token.name=token&token=<s:property value="token"/>">UTR
								Master</a></li>
					</ul>
				<li><a
					href="login.action?struts.token.name=token&token=<s:property value="token"/>">Registered
						User List</a></li>
				<li><a
					href="login.action?struts.token.name=token&token=<s:property value="token"/>">Alerts</a></li>
			</ul></li>
		</ul>
		<!-- Petition -->
		<li><a href="#">Petitions</a>
			<ul>
				<li><a
					href="login.action?struts.token.name=token&token=<s:property value="token"/>">E-File
						Petition (New)</a></li>
				<li><a
					href="login.action?struts.token.name=token&token=<s:property value="token"/>">Draft
						Petitions</a></li>
				<li><a
					href="login.action?struts.token.name=token&token=<s:property value="token"/>">Petitions
						under Scrutiny</a></li>
				<li><a
					href="login.action?struts.token.name=token&token=<s:property value="token"/>">Petition
						Registration</a></li>
				<li><a
					href="login.action?struts.token.name=token&token=<s:property value="token"/>">Current
						Petitions</a></li>
				<li><a
					href="login.action?struts.token.name=token&token=<s:property value="token"/>">DDisposed
						Petitions</a></li>
				<li><a
					href="login.action?struts.token.name=token&token=<s:property value="token"/>">Rejected
						Petitions</a></li>

			</ul></li>

		<li><a href="#">Deficiencies</a>
			<ul>
				<li><a
					href="login.action?struts.token.name=token&token=<s:property value="token"/>">Preliminary
						Scrutiny</a></li>
				<li><a
					href="login.action?struts.token.name=token&token==<s:property value="token"/>">Deficiency
						Removal</a></li>

			</ul></li>
		<!-- Petition -->

		<li><a href="#">Pleadings</a>
			<ul>
				<li><a
					href="login.action?struts.token.name=token&token=<s:property value="token"/>">Pleadings</a></li>

			</ul></li>

		<li><a href="#">MISC</a>
			<ul class="dropdown-menu">
				<li><a class="has_submenu" href="#">Reports</a>
					<ul class="dropdown-menu">
						<li><a
							href="login.action?struts.token.name=token&token=<s:property value="token"/>">Registration
								Reports</a></li>
						<li><a
							href="login.action?struts.token.name=token&token=<s:property value="token"/>">Petition
								Reports</a></li></li>
			</ul>
		<li><a class="has_submenu"
			href="login.action?struts.token.name=token&token=<s:property value="token"/>">Search</a></li>
			<ul class="dropdown-menu">
						<li><a
							href="login.action?struts.token.name=token&token=<s:property value="token"/>">Petition Search</a></li>
						<li><a
							href="login.action?struts.token.name=token&token=<s:property value="token"/>">ROP/ORDER Search</a></li>
							<li><a
							href="login.action?struts.token.name=token&token=<s:property value="token"/>">ASSET MASTER Search</a></li>
							<li><a
							href="login.action?struts.token.name=token&token=<s:property value="token"/>">UTR MASTER Search</a></li>
							
								</li>
			</ul>
			
		</li>
		</ul>

	</table>
</s:form>

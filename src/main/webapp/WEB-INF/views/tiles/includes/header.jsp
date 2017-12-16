<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- Header Navigation Right -->
<ul class="nav-header pull-right">
	<li>
		<div class="block-options-simple btn-group">
			<a class="btn btn-default" href="<c:url value="/locale?lang=en"/>" data-toggle="tooltip" data-placement="left" title="English" data-original-title="English"><img src="assets/img/icon-flag-en.png" alt="English"></a>
			<a class="btn btn-default" href="<c:url value="/locale?lang=vi"/>" data-toggle="tooltip" data-placement="right" title="Vietnam" data-original-title="Vietnam"><img	src="assets/img/icon-flag-vn.png" alt="Vietnam"></a>
			<a class="btn btn-default" href="<c:url value="/loginpage"/>">
				<span class="btn btn-xs btn-default btn-rounded btn-warning"><i class="si si-login"></i> <spring:message code="login.submit" /></span>
			</a>
			<div class="btn-group">
				<button class="btn btn-default btn-image dropdown-toggle" data-toggle="dropdown" type="button" style="line-height: 1.438571;">
					<img src="assets/img/avatar.png" alt="Avatar"> <span>${not empty msg ? msg : ''}</span> <span class="caret"></span>
				</button>
				<ul class="dropdown-menu dropdown-menu-right">
					<li class="dropdown-header">Profile</li>
					<li><a tabindex="-1" href="#"> <i class="si si-envelope-open pull-right"></i> <span
							class="badge badge-primary pull-right">3</span>Inbox
					</a></li>
					<li><a tabindex="-1" href="#"> <i class="si si-user pull-right"></i> <span
							class="badge badge-success pull-right">1</span>Profile
					</a></li>
					<li><a tabindex="-1" href="<c:url value="/"/>"> <i class="si si-settings pull-right"></i>Settings
					</a></li>
					<li class="divider"></li>
					<li class="dropdown-header">Actions</li>
					<li><a tabindex="-1" href="<c:url value="/logout"/>"><i class="si si-logout pull-right"></i>Log out </a></li>
				</ul>
			</div>
		</div>
	</li>
</ul>
<ul class="nav-header pull-left">
	<li class="hidden-md hidden-lg">
		<button class="btn btn-default" data-toggle="layout" data-action="sidebar_toggle" type="button">
			<i class="fa fa-navicon"></i>
		</button>
	</li>
	<li class="hidden-xs hidden-sm">
		<button class="btn btn-default" data-toggle="layout" data-action="sidebar_mini_toggle" type="button">
			<i class="fa fa-ellipsis-v"></i>
		</button>
	</li>
	<li class="visible-xs">
		<button class="btn btn-default" data-toggle="class-toggle" data-target=".js-header-search"
			data-class="header-search-xs-visible" type="button">
			<i class="fa fa-search"></i>
		</button>
	</li>
	<li class="js-header-search header-search">
		<form class="form-horizontal" action="base_pages_search.php" method="post">
			<div class="form-material form-material-primary input-group remove-margin-t remove-margin-b">
				<input class="form-control" type="text" id="base-material-text" name="base-material-text" placeholder="Search..">
				<span class="input-group-addon"><i class="si si-magnifier"></i></span>
			</div>
		</form>
	</li>
</ul>
<!-- END Header Navigation Left -->
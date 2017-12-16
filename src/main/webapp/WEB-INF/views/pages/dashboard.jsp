<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="bg-image overflow-hidden push" style="background-image: url('assets/img/photos/top1.jpg');">
	<div class="bg-black-op">
		<div class="content content-full text-center">
			<h1 class="h1 font-w700 text-white animated fadeInDown push-50-t push-5">Dashboard</h1>
			<h2 class="h3 font-w600 text-white-op animated fadeInDown">Welcome to your personal space.</h2>
			<h3>${not empty message ? message : 'N/A'}</h3>
			<h4><spring:message code="welcome.greeting" arguments="${startMeeting}" /></h4>
			<h5 style="color: red;">${pageContext.response.locale}/ ${not empty locale ? locale : 'N/A'}</h5>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xs-6 col-lg-3">
		<a class="block block-link-hover1" href="javascript:void(0)">
			<div class="block-content block-content-full clearfix">
				<div class="pull-right push-15-t push-15">
					<i class="fa fa-users fa-2x text-primary"></i>
				</div>
				<div class="h2 text-primary" data-toggle="countTo" data-to="36300">36300</div>
				<div class="text-uppercase font-w600 font-s12 text-muted">Users</div>
			</div>
		</a>
	</div>
	<div class="col-xs-6 col-lg-3">
		<a class="block block-link-hover1" href="javascript:void(0)">
			<div class="block-content block-content-full clearfix">
				<div class="pull-right push-15-t push-15">
					<i class="fa fa-briefcase fa-2x text-smooth"></i>
				</div>
				<div class="h2 text-smooth" data-toggle="countTo" data-to="360">360</div>
				<div class="text-uppercase font-w600 font-s12 text-muted">Projects</div>
			</div>
		</a>
	</div>
	<div class="col-xs-6 col-lg-3">
		<a class="block block-link-hover1" href="javascript:void(0)">
			<div class="block-content block-content-full clearfix">
				<div class="pull-right push-15-t push-15">
					<i class="fa fa-line-chart fa-2x text-success"></i>
				</div>
				<div class="h2 text-success" data-toggle="countTo" data-to="760" data-before="$">$760</div>
				<div class="text-uppercase font-w600 font-s12 text-muted">Earnings</div>
			</div>
		</a>
	</div>
	<div class="col-xs-6 col-lg-3">
		<a class="block block-link-hover1" href="javascript:void(0)">
			<div class="block-content block-content-full clearfix">
				<div class="pull-right push-15-t push-15">
					<i class="fa fa-bar-chart-o fa-2x text-amethyst"></i>
				</div>
				<div class="h2 text-amethyst" data-toggle="countTo" data-to="48">48</div>
				<div class="text-uppercase font-w600 font-s12 text-muted">Sales</div>
			</div>
		</a>
	</div>
</div>
<div class="row">
	<div class="col-md-6">
		<div class="block block-rounded block-opt-refresh-icon8">
			<div class="block-header bg-gray-lighter">
				<ul class="block-options">
					<li>
						<button type="button" data-toggle="block-option" data-action="refresh_toggle" data-action-mode="demo">
							<i class="si si-refresh"></i>
						</button>
					</li>
				</ul>
				<h3 class="block-title">Earnings in $</h3>
			</div>
			<div class="block-content block-content-full text-center">
				<div class="pull-r-l pull-t pull-b">
					<div class="chartjs-size-monitor"
						style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
						<div class="chartjs-size-monitor-expand"
							style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
							<div style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
						</div>
						<div class="chartjs-size-monitor-shrink"
							style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
							<div style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
						</div>
					</div>
					<canvas class="js-dashv3-chartjs-earnings chartjs-render-monitor" width="530" height="265"
						style="display: block; height: 295px; width: 590px;"></canvas>
				</div>
			</div>
			<div class="block-content text-center bg-gray-lighter">
				<div class="row items-push-2x text-center push-20-t">
					<div class="col-xs-6 col-lg-3">
						<div class="push-15">
							<i class="fa fa-bank fa-2x text-flat"></i>
						</div>
						<div class="h5 text-muted">$56,000</div>
					</div>
					<div class="col-xs-6 col-lg-3">
						<div class="push-15">
							<i class="fa fa-angle-double-up fa-2x text-flat"></i>
						</div>
						<div class="h5 text-muted">+15% Earnings</div>
					</div>
					<div class="col-xs-6 col-lg-3">
						<div class="push-15">
							<i class="fa fa-headphones fa-2x text-flat"></i>
						</div>
						<div class="h5 text-muted">+2% Tickets</div>
					</div>
					<div class="col-xs-6 col-lg-3">
						<div class="push-15">
							<i class="fa fa-users fa-2x text-flat"></i>
						</div>
						<div class="h5 text-muted">+14% Clients</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="block block-rounded block-opt-refresh-icon8">
			<div class="block-header bg-gray-lighter">
				<ul class="block-options">
					<li>
						<button type="button" data-toggle="block-option" data-action="refresh_toggle" data-action-mode="demo">
							<i class="si si-refresh"></i>
						</button>
					</li>
				</ul>
				<h3 class="block-title">Sales</h3>
			</div>
			<div class="block-content block-content-full text-center">
				<div class="pull-r-l pull-t pull-b">
					<div class="chartjs-size-monitor"
						style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
						<div class="chartjs-size-monitor-expand"
							style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
							<div style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
						</div>
						<div class="chartjs-size-monitor-shrink"
							style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
							<div style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
						</div>
					</div>
					<canvas class="js-dashv3-chartjs-sales chartjs-render-monitor" width="530" height="265"
						style="display: block; height: 295px; width: 590px;"></canvas>
				</div>
			</div>
			<div class="block-content text-center bg-gray-lighter">
				<div class="row items-push-2x text-center push-20-t">
					<div class="col-xs-6 col-lg-3">
						<div class="push-15">
							<i class="fa fa-wordpress fa-2x text-amethyst"></i>
						</div>
						<div class="h5 text-muted">+68% Themes</div>
					</div>
					<div class="col-xs-6 col-lg-3">
						<div class="push-15">
							<i class="fa fa-font fa-2x text-amethyst"></i>
						</div>
						<div class="h5 text-muted">+36% Fonts</div>
					</div>
					<div class="col-xs-6 col-lg-3">
						<div class="push-15">
							<i class="fa fa-archive fa-2x text-amethyst"></i>
						</div>
						<div class="h5 text-muted">-8% Icons</div>
					</div>
					<div class="col-xs-6 col-lg-3">
						<div class="push-15">
							<i class="fa fa-paint-brush fa-2x text-amethyst"></i>
						</div>
						<div class="h5 text-muted">+16% Graphics</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-6">
		<div class="block block-opt-refresh-icon4">
			<div class="block-header bg-gray-lighter">
				<ul class="block-options">
					<li>
						<button type="button" data-toggle="block-option" data-action="refresh_toggle" data-action-mode="demo">
							<i class="si si-refresh"></i>
						</button>
					</li>
				</ul>
				<h3 class="block-title">Top Products</h3>
			</div>
			<div class="block-content">
				<table class="table table-borderless table-striped table-vcenter">
					<tbody>
						<tr>
							<td class="text-center" style="width: 100px;"><a href="base_pages_ecom_product_edit.php"><strong>PID.965</strong></a></td>
							<td><a href="base_pages_ecom_product_edit.php">Destiny: The Taken King</a></td>
							<td class="hidden-xs text-center">
								<div class="text-warning">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_product_edit.php"><strong>PID.154</strong></a></td>
							<td><a href="base_pages_ecom_product_edit.php">Call of Duty: Black Ops III</a></td>
							<td class="hidden-xs text-center">
								<div class="text-warning">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_product_edit.php"><strong>PID.523</strong></a></td>
							<td><a href="base_pages_ecom_product_edit.php">Minecraft: Story Mode</a></td>
							<td class="hidden-xs text-center">
								<div class="text-warning">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_product_edit.php"><strong>PID.423</strong></a></td>
							<td><a href="base_pages_ecom_product_edit.php">Super Mario Maker</a></td>
							<td class="hidden-xs text-center">
								<div class="text-warning">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_product_edit.php"><strong>PID.391</strong></a></td>
							<td><a href="base_pages_ecom_product_edit.php">Fallout 4</a></td>
							<td class="hidden-xs text-center">
								<div class="text-warning">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_product_edit.php"><strong>PID.218</strong></a></td>
							<td><a href="base_pages_ecom_product_edit.php">NBA 2K16</a></td>
							<td class="hidden-xs text-center">
								<div class="text-warning">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_product_edit.php"><strong>PID.995</strong></a></td>
							<td><a href="base_pages_ecom_product_edit.php">Forza Motorsport 6</a></td>
							<td class="hidden-xs text-center">
								<div class="text-warning">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_product_edit.php"><strong>PID.761</strong></a></td>
							<td><a href="base_pages_ecom_product_edit.php">Minecraft</a></td>
							<td class="hidden-xs text-center">
								<div class="text-warning">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_product_edit.php"><strong>PID.860</strong></a></td>
							<td><a href="base_pages_ecom_product_edit.php">Super Smash Bros</a></td>
							<td class="hidden-xs text-center">
								<div class="text-warning">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_product_edit.php"><strong>PID.952</strong></a></td>
							<td><a href="base_pages_ecom_product_edit.php">Halo 5: Guardians</a></td>
							<td class="hidden-xs text-center">
								<div class="text-warning">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="col-lg-6">
		<div class="block block-opt-refresh-icon4">
			<div class="block-header bg-gray-lighter">
				<ul class="block-options">
					<li>
						<button type="button" data-toggle="block-option" data-action="refresh_toggle" data-action-mode="demo">
							<i class="si si-refresh"></i>
						</button>
					</li>
				</ul>
				<h3 class="block-title">Latest Orders</h3>
			</div>
			<div class="block-content">
				<table class="table table-borderless table-striped table-vcenter">
					<tbody>
						<tr>
							<td class="text-center" style="width: 100px;"><a href="base_pages_ecom_order.php"><strong>ORD.7116</strong></a></td>
							<td class="hidden-xs"><a href="base_pages_ecom_customer.php">Ashley Welch</a></td>
							<td><span class="label label-success">Delivered</span></td>
							<td class="text-right"><strong>$834,00</strong></td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_order.php"><strong>ORD.7115</strong></a></td>
							<td class="hidden-xs"><a href="base_pages_ecom_customer.php">Scott Ruiz</a></td>
							<td><span class="label label-danger">Canceled</span></td>
							<td class="text-right"><strong>$857,00</strong></td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_order.php"><strong>ORD.7114</strong></a></td>
							<td class="hidden-xs"><a href="base_pages_ecom_customer.php">Jeremy Fuller</a></td>
							<td><span class="label label-success">Delivered</span></td>
							<td class="text-right"><strong>$866,00</strong></td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_order.php"><strong>ORD.7113</strong></a></td>
							<td class="hidden-xs"><a href="base_pages_ecom_customer.php">Jack Greene</a></td>
							<td><span class="label label-warning">Processing</span></td>
							<td class="text-right"><strong>$559,00</strong></td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_order.php"><strong>ORD.7112</strong></a></td>
							<td class="hidden-xs"><a href="base_pages_ecom_customer.php">Vincent Sims</a></td>
							<td><span class="label label-success">Delivered</span></td>
							<td class="text-right"><strong>$545,00</strong></td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_order.php"><strong>ORD.7111</strong></a></td>
							<td class="hidden-xs"><a href="base_pages_ecom_customer.php">Sara Holland</a></td>
							<td><span class="label label-warning">Processing</span></td>
							<td class="text-right"><strong>$871,00</strong></td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_order.php"><strong>ORD.7110</strong></a></td>
							<td class="hidden-xs"><a href="base_pages_ecom_customer.php">Amanda Powell</a></td>
							<td><span class="label label-success">Delivered</span></td>
							<td class="text-right"><strong>$871,00</strong></td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_order.php"><strong>ORD.7109</strong></a></td>
							<td class="hidden-xs"><a href="base_pages_ecom_customer.php">Amanda Powell</a></td>
							<td><span class="label label-warning">Processing</span></td>
							<td class="text-right"><strong>$790,00</strong></td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_order.php"><strong>ORD.7108</strong></a></td>
							<td class="hidden-xs"><a href="base_pages_ecom_customer.php">Eugene Burke</a></td>
							<td><span class="label label-success">Delivered</span></td>
							<td class="text-right"><strong>$550,00</strong></td>
						</tr>
						<tr>
							<td class="text-center"><a href="base_pages_ecom_order.php"><strong>ORD.7107</strong></a></td>
							<td class="hidden-xs"><a href="base_pages_ecom_customer.php">Roger Hart</a></td>
							<td><span class="label label-danger">Canceled</span></td>
							<td class="text-right"><strong>$805,00</strong></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
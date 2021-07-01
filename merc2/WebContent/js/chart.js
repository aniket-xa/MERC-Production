//<!-- 			05-05-2020 start AK -->
const xlables = [];
//const ydata = [ 24, 91, 40, 61, 38, ];
//const zdata = [ 41, 20, 30, 81, 28, ];
//const adata = [ 54, 41, 20, 21, 18, ];

//const xlables = [];
const ydata = [];
const zdata = [];
const adata = [];

function call() {

	// alert();
	var ctx = document.getElementById('myChart').getContext('2d');

	$
			.ajax({
				url : "loadchartxList",
				type : 'POST',
				data : {},
				dataType : "json",
				success : function(x) {
					// alert("1x"+x.chartxList);
					var chartDatax = x.chartxList;

					$
							.ajax({
								url : "loadchartyList",
								type : 'POST',
								data : {},
								dataType : "json",
								success : function(y) {
									// alert("1y"+y.chartyList);
									var chartDatay = y.chartyList;
									// alert("aniket"+chartDatay.length)

									$
											.ajax({
												url : "loadRegisteredPetitionsCount",
												type : 'POST',
												data : {},
												dataType : "json",
												success : function(z) {
													// alert("1z"+z.chartzList);
													var chartDataz = z.chartzList;
													// alert("aniket1"+chartDataz)
													// ;
													// console.log(z.chartzList);

													$
															.ajax({
																url : "loaddisposedpetitionsCount",
																type : 'POST',
																data : {},
																dataType : "json",
																success : function(
																		a) {
																	// alert("1z"+a.chartaList);
																	var chartDataa = a.chartaList;
																	// alert("aniket1"+chartDataz)
																	// ;
																	// console.log(a.chartaList);

																	for (var i = 0; i < chartDatay.length; i++) {
																		// console.log(chartDatay[i]);
																		xlables
																				.push(chartDatay[i]);
//																				.push(2025);
																		// console.log(chartDatax[i]);
																		ydata
																				.push(chartDatax[i]);
																		// console.log(chartDataz[i]);
																		zdata
																				.push(chartDataz[i]);
																		// console.log(chartDataa[i]);
																		adata
																				.push(chartDataa[i]);
																	}
																	chartit();
																	function chartit() {
																		var chart = new Chart(
																				ctx,
																				{
																					// The
																					// type
																					// of
																					// chart
																					// we
																					// want
																					// to
																					// create
																					type : 'bar',

																					// The
																					// data
																					// for
																					// our
																					// dataset
																					data : {
																						labels : xlables,
																						datasets : [
																								{

																									label : 'Pending',
																									backgroundColor : 'rgba(0, 255, 0,1)',
																									borderColor : 'rgb(0, 255, 0)',
																									barPercentage : 0.5,
																									barThickness : 0.18,
																									maxBarThickness : 3,
																									minBarLength : 2,
																									data : ydata

																								},
																								{

																									label : 'Filed',
																									backgroundColor : 'rgba(0, 0, 255,1)',
																									borderColor : 'rgb(0, 0, 255)',
																									barPercentage : 0.5,
																									barThickness : 0.18,
																									maxBarThickness : 3,
																									minBarLength : 2,
																									data : zdata

																								},
																								{

																									label : 'Disposed',
																									backgroundColor : 'rgba(255, 0, 0, 1)',
																									borderColor : 'rgb(255, 0, 0)',
																									barPercentage : 0.5,
																									barThickness : 0.18,
																									maxBarThickness : 3,
																									minBarLength : 2,
																									data : adata

																								}

																						]
																					},
																					// Configuration
																					// options
																					// go
																					// here
																					options : {

																					}
																				});
																		chart
																				.render();
																	}

																},
																error : function() {
																	alert("Failed to load disposedpetitionsCountchart");
																}
															});

												},
												error : function() {
													alert("Failed to load RegisteredPetitionsCountchart");
												}
											});
								},
								error : function() {
									alert("Failed to load yaxis");
								}
							});
				},
				error : function() {
					alert("Failed to load xaxis");
				}
			});
}
// <!-- 05-05-2020 end AK -->

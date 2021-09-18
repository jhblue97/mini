<script src="/js/socket.io-1.3.5.js"></script>

<script type="text/javascript" src="/js/charting_library/charting_library.min.js"></script>

<script type="text/javascript" src="/js/datafeeds/udf/dist/polyfills.js"></script>

<script type="text/javascript" src="/js/datafeeds/udf/dist/bundle.js"></script>

<script type="text/javascript">

	var socket_chart = io.connect(호스트, { transports: ['websocket'] });

	var chart_realtime_callback = null;

	socket_chart.on('recv', function(arg){ //내가 만든 차트 소켓서버와 연결

		//console.log(arg[0]);

 

		if(chart_realtime_callback != null) //콜백함수가 지정완료되면 연결된 소켓으로 데이터 실시간 수신후 차트에 반영

		{

			var info = arg[0];

			chart_realtime_callback({

				time	: new Date(info['trade_time']).getTime(),

				close	: info['end_price'],

				open	: info['start_price'],

				low		: info['low_price'],

				high	: info['high_price']

			});

		}

	});

 

	//https://github.com/tradingview/charting_library/wiki/JS-Api

	//https://www.tradingview.com/wiki/Widget:TradingView_Widget


 
	var Datafeed = new Datafeeds.UDFCompatibleDatafeed("api/trading_view");

 

 

	var supportedResolutions_ = {

		"1": "1분 투자",

	};

	var supportedResolutions = Object.keys(supportedResolutions_);

	var config = {

		supported_resolutions: supportedResolutions

	};

 

	function initOnReady()

	{

		//console.log('chart start');

		var widget = new TradingView.widget({

			fullscreen: false,

			width : '100%',

			height : '<?=$chart_height?>',

			symbol: '<?=$name?>',

 

			//interval : ["1", "15", "240", "D", "6M"] will give you "1 minute, 15 minutes, 4 hours, 1 day, 6 months" in resolution widget.

			//interval : "5",

 

			container_id: "tv_chart_container",

			//datafeed: Datafeed,

			library_path: "plugin/charting_library-master/charting_library/",

			locale: "ko",

 

			timezone : "Asia/Seoul",

 

			//https://github.com/mmmy/css3demos/wiki/Featuresets

			disabled_features: ["header_symbol_search","header_resolutions","header_compare"],

 

			//preset: "mobile",

 

			//https://github.com/mmmy/css3demos/wiki/Overrides

			overrides: {

				"mainSeriesProperties.candleStyle.wickUpColor": 'red',

				"mainSeriesProperties.candleStyle.wickDownColor": 'blue',

				"mainSeriesProperties.candleStyle.upColor": 'red',

				"mainSeriesProperties.candleStyle.downColor": 'blue',

				"mainSeriesProperties.candleStyle.borderColor": "#378658",


 
				"mainSeriesProperties.candleStyle.borderUpColor": "red",


 
				"mainSeriesProperties.candleStyle.borderDownColor": "blue",

			},

			time_frames: [],

			datafeed: {

				onReady: function (cb) {

					//console.log(cb);

					setTimeout(function () {

						cb(config);

					}, 0);

				},

				searchSymbols: function (userInput, exchange, symbolType, onResultReadyCallback) {

					console.log('1');

				},

				resolveSymbol: function (symbolName, onSymbolResolvedCallback, onResolveErrorCallback){

					//console.log('2');

					var symbol_stub = {

						name: '<?=$name?>',

						description: "",

						type: "<?=$name?>",

						session: "24x7",

						timezone: "Asia/Seoul",

						ticker: '<?=$name?>',

						minmov: 1,

						pricescale: 100,

						has_intraday: true,

						//intraday_multipliers: ["1"], //Object.keys(supportedResolutions_),

						//supported_resolution: supportedResolutions,

						supported_resolutions: [60],

						//volume_precision: 4,

						data_status: "streaming"

					};

 

					setTimeout(function () {

						onSymbolResolvedCallback(symbol_stub);

					}, 0);

				},

				getBars: function (symbolInfo, resolution, from, to, onHistoryCallback, Callback, firstDataRequest) {

					//console.log('3');

					var arg = {};

					arg['from'] = from;

					arg['to'] = to;

					$.get("/trading_view/history/getBars.php?chart_limit=100", arg, function(bars){

						onHistoryCallback(bars, {

							noData: bars.length <= 0

						});

					}, "json");

				},

				subscribeBars: function (symbolInfo, resolution, onRealtimeCallback, subscribeUID, onResetCacheNeededCallback) {

					chart_realtime_callback = onRealtimeCallback; //여기에 차트 콜백함수 부여

				},

				unsubscribeBars: function (subscriberUID) {

					//console.log('5');

				},

				calculateHistoryDepth: function (resolution, resolutionBack, intervalBack) {

					//console.log('resolution = ' + resolution);

					return resolution < 60

						? {resolutionBack: "D", intervalBack: "1"}

						: undefined;

				},

				getMarks: function (symbolInfo, startDate, endDate, onDataCallback, resolution) {

					console.log('7');

				},

				getTimeScaleMarks: function (symbolInfo, startDate, endDate, onDataCallback, resolution) {

					console.log('8');

				},

				getServerTime: function (cb) {

					//console.log(cb);

				}

			}

		});

	};

 

	$(document).ready(function(){

		initOnReady();

	});

</script>
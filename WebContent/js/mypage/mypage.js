(function($){	//author:毛海文
	var opts = null;
	var methods={
	init:function(options){
		var defaults={
			limit:null,	//限制条件，全局变量
			url:"",		//请求路径
			totalcount:1,	//总条数
			curpage:1,	//当前页
			pages:1,	//总页数
			perpagecount:10,	//每页条目数
			click:function(){return false}	//回调函数，获取数据
		};
	opts = $.extend(defaults, options);     
	return this.each(function(){
		var that = this;
		function initdiv(){		//页面初始化，写入分页的div
			var msg = "<div id='mypage_div'>"+
					  "<a href='javascript:void(0)' id='firstpage'>first</a>"+
					  "<a href='javascript:void(0)' id='lastpage'>prev</a>"+
					  "<a href='javascript:void(0)' id='nextpage'>next</a>"+
					  "<a href='javascript:void(0)' id='finalpage'>last</a>"+
					  "<span id='span_curpage' style='color:#8B2500'>"+opts.curpage+"</span>"+"/"+
					  "<span id='span_pages'>"+"</span> page"+
					  " <input type='text' id='mypage_text' class='text_page'/>"+
					  "<a href='javascript:void(0)' id='go'>"+"go</a>"+
					"</div>";
				$(that).html(msg);
			}
			initdiv();
			if(opts.limit != null){
				methods.submit(opts.limit);
			}else{
				methods.submit();
			}
			methods.getdata();	//控制点击按钮的函数
		});
	},
	submit:function(options){
		if(opts.limit!=options){	//控制查询，如果查询条件变化，将当前页码置为1
			opts.curpage = 1;
			$("#span_curpage").html(opts.curpage);
		}
		var params = new Object();
		params.curpage = opts.curpage;	//分页必备条件
		params.perpagecount = opts.perpagecount;	//同上
		if(options!=undefined){	//调用查询方法时，传入一个json数组
			opts.limit = options;	//数组放入全局变量
		}
		if(opts.limit!=null){	//如果定义了条件，遍历它的key和value，传到后台,用户从上下文中获取即可
			var limit = opts.limit;
			for(var i=0;i<limit.length;i++){
				var json = limit[i];
				for (var key in json)
			    {
					params[key] = json[key];
			    }
			}
		}
		$.ajax({	//提交
				url:opts.url,
				type:"post",
				data:params,
				dataType:"json",
				success:function(data){
				//下面的如（data.dataMap.data）是我在后台传回的page对象中的数据，按照需要修改即可）
					opts.click(data);
					opts.totalcount = data.totalcount;
					opts.pages = data.pagecount;
					$("#span_totalpage").html(opts.totalcount);
					$("#span_pages").html(opts.pages);
				},
				error:function(){
						alert("请求失败");
				}
			});
	},
	getdata:function(){
		$("#span_pages").html(opts.pages);
		$("#firstpage").click(function(){	//页码不变，中断查询
			if(opts.curpage == 1){
				return;
			}
			opts.curpage = 1;
			$("#span_curpage").html(opts.curpage);
			methods.submit(opts.limit);
		});
		$("#lastpage").click(function(){
			if(opts.curpage>1){
				opts.curpage = opts.curpage - 1;
				$("#span_curpage").html(opts.curpage);
				methods.submit(opts.limit);
			}
		});
		$("#nextpage").click(function(){
			if(opts.curpage<opts.pages){
				opts.curpage = opts.curpage + 1;
				$("#span_curpage").html(opts.curpage);
				methods.submit(opts.limit);
			}
			
		});
		$("#finalpage").click(function(){
			if(opts.curpage == opts.pages){
				return;
			}
			opts.curpage = opts.pages;
			$("#span_curpage").html(opts.curpage);
			methods.submit(opts.limit);
		});	
		$("#mypage_text").keypress(function(e){	//控制跳转的输入框只能输入数字，以及范围
            var k = window.event ? e.keyCode : e.which;
            if (((k >= 48) && (k <= 57)) || k == 8 || k == 0 || k==46) {
            } else {
                if (window.event) {
                    window.event.returnValue = false;
                }
                else {
                    e.preventDefault(); //for firefox 
                }
            }
		});
		$("#mypage_text").keyup(function(){
            if(parseInt($(this).val())>opts.pages){
            	$("#mypage_text").val(opts.pages);
            }
            if(parseInt($(this).val())<1){
            	$("#mypage_text").val(1);
            }
		});
		$("#go").click(function(){
			if(parseInt($("#mypage_text").val()) == opts.curpage||$("#mypage_text").val() == ""){
				return;
			}
			opts.curpage = parseInt($("#mypage_text").val());
			$("#span_curpage").html(opts.curpage);
			methods.submit(opts.limit);
		});
	}
	};
	
		$.fn.mypage = function() {         
			var method = arguments[0];             
			if(methods[method]) {              
				method = methods[method];               
				arguments = Array.prototype.slice.call(arguments, 1);          
				} 
				else if( typeof(method) == 'object' || !method ) {             
					method = methods.init;          
					} 
					else {             
						$.error( 'Method ' +  method + ' does not exist on jQuery.mao' ); 
							return this;          
						}           
							return method.apply(this, arguments);        
			}
})(jQuery);
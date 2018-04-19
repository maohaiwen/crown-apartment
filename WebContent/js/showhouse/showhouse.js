var showhouse = {
	getPath:function(){
		//获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp  
	    var curWwwPath=window.document.location.href;  
	    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp  
	    var pathName=window.document.location.pathname;  
	    var pos=curWwwPath.indexOf(pathName);  
	    //获取主机地址，如： http://localhost:8083  
	    var localhostPaht=curWwwPath.substring(0,pos);  
	    //获取带"/"的项目名，如：/uimcardprj  
	    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);  
	    return(localhostPaht+projectName); 
	},
	show:function(where,data){
		var str = showhouse.getInit(data,showhouse.getPath() + "/upload/img");
		$("#"+where).html(str);
		showhouse.showdetail(where);
	},
	showdetail:function(where){
		$("#"+where).children("div").click(function(){
			var hide = $(this).children("input[type=hidden]");
			var id = $(hide[0]).attr("value");
			window.open("housedetail.jsp?id=" + id);
		});
	},
	getInit:function(data,basePath){
		var str = "";
		for(var i=0;i<data.length;i++){
			var imgs = data[i].imgs;
			str += "<div target='_blank' class='showhouse_div'>";
			str += "<input type = 'hidden' value = " + data[i].id + " />";
			str += "<ul>";
			str += "<li>";
			str += "<img ";
			if(imgs.length>0){
				str += "src=" + basePath + "/" + imgs[0].fileName ;
			}else{
				str += "src=" + showhouse.getPath() + "/images/nophoto.jpg" ;
			}
			str += " class='showhouse_img'>";
			str += "</li>";
			str += "<li class='showhouse_title'>";
			var district = data[i].district;
			var type = data[i].type;
			if(type == 0){
				district += " apartment";
			}
			if(type == 1){
				district += " villas ";			
			}
			if(type == 2){
				district += " lane house";
			}
			if(type == 3){
				district += " high building";
			}
			if(type == 4){
				district += " office"; 
			}
			str += district;
			str += "</li>";
			str += "<li class='showhouse_money'>";
			str += "RMB " + data[i].money ;
			str += "</li>";
			str += "<li>";
			str += data[i].shi + "<img style='width:20px;height:15px;' src=" + showhouse.getPath() + "/images/bedrooms.png  >";
			str += "&nbsp;";
			str += data[i].wei + "<img style='width:20px;height:15px;' src=" + showhouse.getPath() + "/images/bathrooms.png  >";
			str += "&nbsp;";
			str += data[i].size + "sqm";
			str += "</li>";
			str += "</ul>";
			str += "</div>";
		}
		return str;
	}
};
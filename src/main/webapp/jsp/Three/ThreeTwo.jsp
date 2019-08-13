<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
  <script src="${pageContext.request.contextPath}/js/jqueryLibrary.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.imgbox.pack.js"></script>
    
    <script src="${pageContext.request.contextPath}/js/treejs/jquery-3.1.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/Gen/style.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/Gen/modernizr.custom.63321.js"></script>  
    <script src="${pageContext.request.contextPath}/Gen/jquery.catslider.js"></script>
    
 
    <script>
        $(function () {
        
            $('#mi-slider').catslider();
            console.log("${pageContext.request.contextPath}/js/treejs/jquery-3.1.1.min.js");
            
            $('.pimg').click(function () {
            	
                //获取图片路径
                var imgsrc = $(this).attr("src");
                var imgid = $(this).attr("id");
                console.log(imgsrc);
                var opacityBottom = '<div class="opacityBottom" style = "display:none"><img class="bigImg" src="' + imgsrc + '"></div>';
                $(document.body).append(opacityBottom);
                toBigImg(imgid);//变大函数
                //MarkSmallImg(imgid);

            });

            function toBigImg(imgid) {
                $(".opacityBottom").addClass("opacityBottom");//添加遮罩层
                $(".opacityBottom").show();
                $("html,body").addClass("none-scroll");//下层不可滑动
                $(".bigImg").addClass("bigImg");//添加图片样式
                MarkSmallImg(imgid);
                $("div.marker").on('click',function(e){
                	debugger;
                	e.stopPropagation();//不触发父元素的click事件
                	$("div.marker").removeClass("active");//清除所有的选中效果
                	$(this).addClass("active");//为当前点击对象添加已选中效果
                	if($("#notebox")){
                		
                		$("#notebox").remove();
                	}
                	var noteBox = document.createElement("div");
                	noteBox.id = "notebox";
                	noteBox.className = "annotationBox";
                	$(this).after(noteBox);
                	var noteBoxUl = document.createElement("ul");
                	noteBoxUl.id = "noteboxul";
                	$("#notebox").append(noteBoxUl);
                	var arr1 = new Array("风压","振动","倾斜角","应力","温度","应变","湿度");
                	var arr2 = [
        				['1','351','39°','213','27℃','12','82°'],
        				['2','321','49°','113','22℃','12','82°'],
        				['3','351','29°','213','27℃','13','82°'],
        				['4','351','39°','213','23℃','12','82°'],
        				['5','351','49°','203','27℃','22','82°'],
        				['6','331','89°','213','21℃','12','82°'],
        				['7','351','49°','223','27℃','9','82°'],
        				['8','311','19°','213','20℃','12','82°'],
        				['9','301','49°','216','27℃','12','82°']
        			];
                	var m = 0;
                	switch(e.target.id)
                	{
	                	case "picture1_7_10":m=0;break;
	                	case "picture1_7_11":m=1;break;
	                	case "picture1_2_10":m=2;break;
	                	case "picture1_2_11":m=3;break;
	                	case "picture2_R_2":m=4;break;
	                	case "picture2_7_9":m=5;break;
	                	case "picture2_2_9":m=6;break;
	                	default:m=0;break;
                	}
                	for(var i = 0; i <= 6; i++){
                		var noteBoxLi = document.createElement("li");
                		$("#noteboxul").append(noteBoxLi);
                		var noteBoxSpan = document.createElement("span");
                		noteBoxSpan.innerText = arr1[i];
                		var noteBoxStrong = document.createElement("strong");
                		noteBoxStrong.className = "annotationData";
                		noteBoxStrong.innerText = arr2[m][i]; 
                		$("#noteboxul").children("li").eq(i).append(noteBoxSpan,noteBoxStrong);
                	}

                });
                $(".opacityBottom").click(function () {
                	debugger;
                	
                	//点击关闭
                    $("html,body").removeClass("none-scroll");
                    $(".opacityBottom").remove();
                });
            }
            
            
            
        });
        
        function createMarker(x,y,divName,imgid,sensorid){
        	
        	var div = document.createElement('div');
        	div.id = imgid + sensorid;
        	div.className = 'marker';
        	div.style.left = x + 'px';
        	div.style.top = y + 'px';
        	/*div.style.backgroundColor = 'yellow';*/
        	$(".opacityBottom").append(div);
        	
        }
        
        function MarkSmallImg(imgid) {
        	
            /*var myImg = document.querySelector("#picture1");
            var currWidth = myImg.clientWidth;
            var currHeight = myImg.clientHeight;*/
            
            /*var x = 150;
            var y = 232;
            createMarker(x, y, 'opacityBottom');
            createMarker(150,232,'opacityBottom');
            createMarker(458,236,'opacityBottom');
            createMarker(152,461,'opacityBottom');
            createMarker(455,464,'opacityBottom');*/
            switch(imgid)
            {
            	case "picture1":createMarker(150,232,'opacityBottom',imgid,'_7_10');createMarker(458,236,'opacityBottom',imgid,'_7_11');
            	createMarker(152,461,'opacityBottom',imgid,'_2_10');createMarker(455,464,'opacityBottom',imgid,'_2_11');break;
            	case "picture2":createMarker(367,98,'opacityBottom',imgid,'_R_2');createMarker(496,209,'opacityBottom',imgid,'_7_9');createMarker(487,443,'opacityBottom',imgid,'_2_9');break;
            	case "picture3":break;
            	case "picture4":break;
            	case "picture5":break;
            	default:break;
            }
        }
        
    </script>

<style type="text/css">

/*使图片在浏览器中居中显示*/
.bigImg {
    position: absolute;
    top: 50%;
    left: 50%;
 /*图片向左移动自身宽度的50%, 向上移动自身高度的50%。*/
    transform: translate(-50%,-50%);
}
/*遮罩层*/
  .opacityBottom {
        width: 100%;
        height: 100%;
        position: fixed;
        background: rgba(0,0,0,0.8);
        z-index: 1000;
        top: 0;
        left: 0;
    }
    .marker{
    	position:absolute;
    	width:40px;
    	height:20px;
    	/*background:#fff;*/
    	
    	z-index:9999;
    	cursor:pointer;
    }
    /*.marker div{
    	vertical-align: top;
  		color:#FFF;
  		font-size: 14px;
  		background:#68d8fe;
  		opacity:1;
  		cursor:pointer;
  		width: 20px;
  		height:20px;
  		text-align: center;
  		border-radius: 50%;
  		z-index:9999;
    }*/
    .marker.active{
    	/*background:#eed34e!important;*/
    	background:#00ff00!important;
    	opacity:0.5;
    }
    .marker.active:before,.marker.active:after{
    	content:"";
    	position:absolute;
    	left:-20px;
    	top:-30px;
    	width:80px;
    	height:80px;
    	z-index:9999;
    	border-radius:50%;
    	border:3px solid rbga(0,255,0,0);
    	animation:spotShine1 0.5s linear infinite;
    	
    }
    @keyframes spotShine1 {
  from {
    transform:scale(0.5);
    border:3px solid rgba(0,255,0,1);
  }
  to {
    transform:scale(1.5);
    border:3px solid rgba(0,255,0,0);
  }
}
    .marker .active:after{
    	animation-delay: 0.5s;
    }
    
    .annotationBox{
    	position:relative;
    	width:100px;
    	height:160px;
    	background:rgba(2,16,70,0.68);
    	border:1px solid #2d4288;
    	border-radius:20px;
    	color:#fff;
    	font-size:10px;
    }
    .annotationBox:before{
    	content:"";
    	position:absolute;
    	top:0;
    	left:0;
    	width:100px;
    	height:160px;
    	transform:scale(1.01);
    	background: url(${pageContext.request.contextPath}/HomeAssets/images/border.png) no-repeat top left,url(${pageContext.request.contextPath}/HomeAssets/images/border.png) no-repeat top right,
    	url(${pageContext.request.contextPath}/HomeAssets/images/border.png) no-repeat bottom left,url(${pageContext.request.contextPath}/HomeAssets/images/border.png) no-repeat bottom right;
    }
    .annotationBox ul{
    	list-style:none;
    	color:#fff;
    	font-size:15px;
    	overflow:hidden;
    	padding:10px 15px;
    	height:160px;
    }
    .annotationBox ul li{
    	float:left;
    	width:80px;
    }
    .annotationBox ul span{
    	display:inline-block;
    	min-width:40px;
    	text-align:right;
    	padding-right:10px;
    }
    .annotationBox ul .annotationData{
    	color:#00ff00;/*#eed34e;*/
  		font-size: 15px;
  		letter-spacing: -2px;
    }
</style>
</head>

<body style=''>
    <div class="container">
        <header class="clearfix" >
            
        </header>
        <div class="main">
            <div id="mi-slider" class="mi-slider">
                <ul>
                    <li>
                          <img  class="pimg"   src="${pageContext.request.contextPath}/buzhitu/北外立面监测传感器布设图.png" id="picture1">
                            <h4>北外立面监测传感器布设图</h4>
                    </li>

                </ul>

                <ul>
                    <li>
                        <img  class="pimg"    src="${pageContext.request.contextPath}/buzhitu/东外立面监测传感器布设图.png" id="picture2">
                            <h4>东外立面监测传感器布设图</h4>
                       
                    </li>

                </ul>
                
                <ul>
                    <li>
                     
                          <img class="pimg"   src="${pageContext.request.contextPath}/buzhitu/南外立面监测传感器布设图.png" id="picture3">
                            <h4>南外立面监测传感器布设图</h4>
                        
                    </li>

                </ul>
                <ul>
                    <li>
                    
                        <img  class="pimg"   src="${pageContext.request.contextPath}/buzhitu/二层结构内部监测传感器布设图.png" id="picture4">
                            <h4>二层结构内部监测传感器布设图</h4>
                       	
                    </li> 

                </ul>
            
                <ul>
                    <li>
                      
                            <img  class="pimg"   src="${pageContext.request.contextPath}/buzhitu/七层结构内部监测传感器布设图.png" id="picture5">
                            <h4>七层结构内部监测传感器布设图</h4>
                       
                    </li>

                </ul>
                <nav>
                    <a href="#">北外立面</a>
                    <a href="#">东外立面</a>
                    <a href="#">南外立面</a>
                    <a href="#">二层结构</a>
                    <a href="#">七层结构</a>
                </nav>
            </div>
        </div>
    </div>
   
</body>

</html>
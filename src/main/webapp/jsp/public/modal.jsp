<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<link rel="stylesheet" href="css/remodal.css">
	<link rel="stylesheet" href="css/remodal-default-theme.css">

	<style>
	/*modal*/
	.remodal-wrapper {
		padding: 0px;
	}
	
	.modal-page.modal-container {
		position: relative;
		padding: 0;
		margin: 0 auto;
		height: 100%;
		background-color: rgba(0, 0, 0, 0);
		max-width: 900px;
	}
	
	.modal-page[data-remodal-id=page] iframe {
		position: relative;
		width: 100%;
		max-height: 100%;
		padding: 0;
		margin: 0;
		outline: 0;
		border: 0;
	}
	
	.modal-page .modal-close {
		display: none;
		position: absolute;
		height: 20px;
		right: 12px;
		top: 12px;
	}
	
	.modal-page .modal-close>img {
		height: 100%;
	}
	</style>

	<div class="modal-page modal-container" data-remodal-id="page" no=text>
		<iframe id="modal-frame" src="" style></iframe>
	</div>
	
	
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/views/home/homeTB/js/remodal.min.js" charset="utf-8"></script> --%>
	
	<script>
		window.modal_load = window.mload = function(url,callback){
			if(url){
				var ifm = document.getElementById('modal-frame');
					$('>.modal-close',ifm.parentNode).css('display','block');
				ifm.onload = function(){
					ifm.onload = undefined;
					$('>.modal-close',ifm.parentNode).css('display','');
					var h = ifm.contentDocument.body.scrollHeight;
					ifm.style.height = h+'px';
					modal_resize();
					if(callback){
						setTimeout(callback.bind(ifm.contentWindow));
					};
				};
				ifm.src = url;
				$('[data-remodal-id=page]').remodal({
					closeOnEscape:false,
					//closeOnOutsideClick:false,
				}).open();
			};
		};
		window.modal_close = window.mclose = function(){
			var ifm = $('[data-remodal-id=modal] iframe')[0];
			$('[data-remodal-id=page]').remodal().close();
			ifm.src = '';
			ifm.style.height = '';
		};
		// modal - 居中
		var modal_resize = function(){
			var ifm = document.getElementById('modal-frame');
			var hc = ifm.offsetHeight;
			if(hc == 0) return;
			var h = parseInt(ifm.style.height) || 0;
			var c = ifm.parentNode;
			var padding = (c.offsetHeight - hc)/2;
			//console.log(c.offsetHeight , hc)
			
			
			if($('.l_top_bg2', window.parent.parent.document).length==0){
				if(hc == h){
					c.style['padding-top'] = padding + 'px';
					c.style['padding-bottom'] = padding + 'px';
				}else{
					c.style['padding-top'] = 50+'px';
					c.style['padding-bottom'] = '';
				};
			}else{
				$('.modal-container').css({
					'padding-top':$(parent.window).scrollTop()+20
				}); 
			}
		};
		$(window).resize(modal_resize);
	</script>
	
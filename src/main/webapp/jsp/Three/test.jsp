<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- 移动相机的位置-->
		<meta charset="UTF-8">
		<title>WebGL中文网</title>
		<script src="${pageContext.request.contextPath}/ThreeModel/js/Three.js"></script>
        <script src="${pageContext.request.contextPath}/ThreeModel/js/Stats.js"></script>
		<script src="${pageContext.request.contextPath}/ThreeModel/js/tween.min.js"></script>
        <script src="${pageContext.request.contextPath}/ThreeModel/js/loaders/OBJLoader.js"></script>
<%--   <link href="${pageContext.request.contextPath}/HomeAssets/css/Leftstyle.css" rel="stylesheet" type="text/css" /> --%>

		
		<style type="text/css">
			div#canvas-frame {
				border: none;
				cursor: pointer;
				width: 100%;
				height: 600px;
				background-color: #EEEEEE;
			}

		</style>
		<script>
			/*
			* 围绕某个 x,y,z轴测试
			*/
			
			
            var renderer;
            var stats;

            function initThree() {
                width = document.getElementById('canvas-frame').clientWidth;
                height = document.getElementById('canvas-frame').clientHeight;
                renderer = new THREE.WebGLRenderer({
                    antialias : true
                });
                renderer.setSize(width, height);
                document.getElementById('canvas-frame').appendChild(renderer.domElement);
                renderer.setClearColor(0xFFFFFF, 1.0);

                stats = new Stats();
                stats.domElement.style.position = 'absolute';
                stats.domElement.style.left = '0px';
                stats.domElement.style.top = '0px';
                document.getElementById('canvas-frame').appendChild(stats.domElement);
            }

            var camera;
            function initCamera() {
                camera = new THREE.PerspectiveCamera(45, width / height, 1, 10000);
                camera.position.x = 100;
                camera.position.y = 300;
                camera.position.z = 600;
                camera.up.x = 0;
                camera.up.y = 1;
                camera.up.z = 0;
                camera.lookAt({
                    x : 0,
                    y : 0,
                    z : 0
                });
            }

            var scene;
            function initScene() {
                scene = new THREE.Scene();
            }

            var light;
            function initLight() {
                light = new THREE.AmbientLight(0xFF0000);
                light.position.set(100, 100, 200);
                scene.add(light);

            }

            var cube;
			var boxMesh,objMesh = undefined;
            function initObject() {

                var manager = new THREE.LoadingManager();
               
			    var loader = new THREE.OBJLoader( manager );
                loader.load( '${pageContext.request.contextPath}/ThreeModel/13.obj', function ( object ) {

                 
                    objMesh = object;
                    console.log(object);
                    
                    //object.children[0].geometry.computeBoundingBox();
                   // object.position = new THREE.Vector3(0,0,0);
                   // object.rotation.x = THREE.Math.degToRad( 90 );
                   // console.log(- ( object.children[0].geometry.boundingBox.max.x + object.children[0].geometry.boundingBox.min.x ) / 2);
                   // console.log(- ( object.children[0].geometry.boundingBox.max.y + object.children[0].geometry.boundingBox.min.y ) / 2);
                   // console.log(- ( object.children[0].geometry.boundingBox.max.z + object.children[0].geometry.boundingBox.min.z ) / 2);
                   // console.log( object.children[0].geometry.center() );
              
                   
                   object.children[0].geometry.center() ;
                
                    scene.add( object );
                });

                

                // 立方体
                var geometry = new THREE.BoxGeometry( 60, 30, 30 );
                
                for ( var i = 0; i < geometry.faces.length; i += 2 ) {

                    var hex = Math.random() * 0xffffff;
                    geometry.faces[ i ].color.setHex( hex );
                    geometry.faces[ i + 1 ].color.setHex( hex );

                }
                
                var material = new THREE.MeshBasicMaterial( { vertexColors: THREE.FaceColors} );
                boxMesh = new THREE.Mesh( geometry,material);
                boxMesh.position = new THREE.Vector3(0,0,0);
                scene.add(boxMesh);
				
				
            }
			
			function initGrid(){
				var helper = new THREE.GridHelper( 1000, 50 );
				helper.setColors( 0x0000ff, 0x808080 );
				scene.add( helper );
			}
			
            function threeStart() {
                initThree();
                initCamera();
                initScene();
           //     initLight();


                initObject();
				initGrid();
				
                animation();

            }

            // 帧循环、游戏循环
            function animation()
            {
            	debugger;
				//mesh.rotation.y +=0.01;
                boxMesh.rotateY(0.01);
                if(objMesh != undefined){
                    objMesh.rotateY(0.01);
                }
     
                renderer.render(scene, camera);
                requestAnimationFrame(animation);

            }

		</script>
	</head>

	<body onload="threeStart();">
		<div style="margin-left:150px;">
			<p>课前准备，绘制一个立方体和一个网格线</p>
		</div>
		<div id="canvas-frame"></div>
	</body>
</html>
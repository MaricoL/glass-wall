<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>three.js webgl - FBX loader</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
		<style>
			body {
				font-family: Monospace;
				background-color: #000;
				color: #fff;
				margin: 0px;
				overflow: hidden;
			}
			#info {
				color: #fff;
				position: absolute;
				top: 10px;
				width: 100%;
				text-align: center;
				z-index: 100;
				display:block;
			}
			#info a {
				color: #046;
				font-weight: bold;
			}
		</style>
	</head>

	<body>
		<div id="info">
			<a href="http://threejs.org" target="_blank" rel="noopener">three.js</a> - FBXLoader<br />
			Character and animation from <a href="https://www.mixamo.com/" target="_blank" rel="noopener">Mixamo</a>
		</div>
      
      
        <script src="${pageContext.request.contextPath}/ThreeModel/build/three.js"></script>
	    <script src="${pageContext.request.contextPath}/ThreeModel/js2/libs/inflate.min.js"></script>
	 
	   <script src="${pageContext.request.contextPath}/ThreeModel/js2/loaders/FBXLoader.js"></script>

	   <script src="${pageContext.request.contextPath}/ThreeModel/js2/libs/inflate.min.js"></script>
	   <script src="${pageContext.request.contextPath}/ThreeModel/js2/libs/stats.min.js"></script>
	 
	
<!-- 		<script src="../build/three.js"></script> -->

<!-- 		<script src="js/libs/inflate.min.js"></script> -->
<!-- 		<script src="js/loaders/FBXLoader.js"></script> -->

<!-- 		<script src="js/controls/OrbitControls.js"></script> -->

<!-- 		<script src="js/Detector.js"></script> -->
<!-- 		<script src="js/libs/stats.min.js"></script> -->




		<script>

	
			var container, stats, controls;
			var camera, scene, renderer, light;

			var clock = new THREE.Clock();

			var mixers = [];

			init();
			animate();

			function init() {

				container = document.createElement( 'div' );
				document.body.appendChild( container );

				camera = new THREE.PerspectiveCamera( 45, window.innerWidth / window.innerHeight, 1, 2000 );
				camera.position.set( 100, 200, 300 );

			

				scene = new THREE.Scene();
				scene.background = new THREE.Color( 0xa0a0a0 );
				scene.fog = new THREE.Fog( 0xa0a0a0, 200, 1000 );

				light = new THREE.HemisphereLight( 0xffffff, 0x444444 );
				light.position.set( 0, 200, 0 );
				scene.add( light );

				light = new THREE.DirectionalLight( 0xffffff );
				light.position.set( 0, 200, 100 );
				light.castShadow = true;
				light.shadow.camera.top = 180;
				light.shadow.camera.bottom = -100;
				light.shadow.camera.left = -120;
				light.shadow.camera.right = 120;
				scene.add( light );

				// scene.add( new THREE.CameraHelper( light.shadow.camera ) );

				// ground
				var mesh = new THREE.Mesh( new THREE.PlaneGeometry( 2000, 2000 ), new THREE.MeshPhongMaterial( { color: 0x999999, depthWrite: false } ) );
				mesh.rotation.x = - Math.PI / 2;
				mesh.receiveShadow = true;
				scene.add( mesh );

				var grid = new THREE.GridHelper( 2000, 20, 0x000000, 0x000000 );
				grid.material.opacity = 0.2;
				grid.material.transparent = true;
				scene.add( grid );

				// model
				var loader = new THREE.FBXLoader();
				loader.load( '${pageContext.request.contextPath}/ThreeModel/55.fbx', function ( object ) {

					object.mixer = new THREE.AnimationMixer( object );
					mixers.push( object.mixer );

					var action = object.mixer.clipAction( object.animations[ 0 ] );
					action.play();

					object.traverse( function ( child ) {

						if ( child.isMesh ) {

							child.castShadow = true;
							child.receiveShadow = true;

						}

					} );

					scene.add( object );

				} );

				renderer = new THREE.WebGLRenderer();
				renderer.setPixelRatio( window.devicePixelRatio );
				renderer.setSize( window.innerWidth, window.innerHeight );
				renderer.shadowMap.enabled = true;
				container.appendChild( renderer.domElement );

				window.addEventListener( 'resize', onWindowResize, false );

				// stats
				stats = new Stats();
				container.appendChild( stats.dom );

			}

			function onWindowResize() {

				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();

				renderer.setSize( window.innerWidth, window.innerHeight );

			}

			//

			function animate() {

				requestAnimationFrame( animate );

				if ( mixers.length > 0 ) {

					for ( var i = 0; i < mixers.length; i ++ ) {

						mixers[ i ].update( clock.getDelta() );

					}

				}

				renderer.render( scene, camera );

				stats.update();

			}

		</script>

	</body>
</html>

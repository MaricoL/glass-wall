<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>three.js webgl - FBX loader</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
		
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
	   
	     <script src="${pageContext.request.contextPath}/ThreeModel/js/OrbitControls.js"></script>
        <script src="${pageContext.request.contextPath}/ThreeModel/js/dat.gui.js"></script>
	   
		
		
<%--   <script src="${pageContext.request.contextPath}/ThreeModel/build/three.js"></script> --%>
		<script type="module">

			var container, stats, controls;
			var camera, scene, renderer, light;

			var clock = new THREE.Clock();

			var mixer;

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
				light.shadow.camera.bottom = - 100;
				light.shadow.camera.left = - 120;
				light.shadow.camera.right = 120;
				scene.add( light );

				// scene.add( new CameraHelper( light.shadow.camera ) );

				// ground
				var mesh = new THREE.Mesh( new THREE.PlaneBufferGeometry( 2000, 2000 ), new THREE.MeshPhongMaterial( { color: 0x999999, depthWrite: false } ) );
				mesh.rotation.x = - Math.PI / 2;
				mesh.receiveShadow = true;
				scene.add( mesh );

				var grid = new THREE.GridHelper( 2000, 20, 0x000000, 0x000000 );
				grid.material.opacity = 0.2;
				grid.material.transparent = true;
				scene.add( grid );

				// model
				var loader = new FBXLoader();
				loader.load( '${pageContext.request.contextPath}/ThreeModel/fbx/Samba Dancing.fbx', function ( object ) {

					mixer = new THREE.AnimationMixer( object );

					var action = mixer.clipAction( object.animations[ 0 ] );
					action.play();

					object.traverse( function ( child ) {

						if ( child.isMesh ) {

							child.castShadow = true;
							child.receiveShadow = true;

						}

					} );

					scene.add( object );

				} );

				renderer = new THREE.WebGLRenderer( { antialias: true } );
				renderer.setPixelRatio( window.devicePixelRatio );
				renderer.setSize( window.innerWidth, window.innerHeight );
				renderer.shadowMap.enabled = true;
				container.appendChild( renderer.domElement );

				controls = new OrbitControls( camera, renderer.domElement );
				controls.target.set( 0, 100, 0 );
				controls.update();

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

				var delta = clock.getDelta();

				if ( mixer ) mixer.update( delta );

				renderer.render( scene, camera );

				stats.update();

			}

		</script>

	</body>
</html>

<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>three.js webgl - OBJLoader + MTLLoader</title>
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
            display: block;
        }
        
        #info a,
        .button {
            color: #f00;
            font-weight: bold;
            text-decoration: underline;
            cursor: pointer
        }
    </style>
</head>

<body>

    <!--<div id="WebGL-output">-->
    <script src="${pageContext.request.contextPath}/ThreeModel/build/three.js"></script>
    <script src="${pageContext.request.contextPath}/ThreeModel/js2/loaders/OBJLoader.js"></script>
    <script src="${pageContext.request.contextPath}/ThreeModel/js2/loaders/MTLLoader.js"></script>
    <script src="${pageContext.request.contextPath}/ThreeModel/js2/loaders/GLTFLoader.js"></script>
    <script src="${pageContext.request.contextPath}/ThreeModel/js2/loaders/DRACOLoader.js"></script>
    <script src="${pageContext.request.contextPath}/ThreeModel/js2/libs/draco/draco_decoder.js"></script>
    <script>
        var container, stats;
        var camera, scene, renderer, controls, pointLight, obj;

        init();
        animate();

        function init() {
            container = document.createElement('div');
            document.body.appendChild(container);

            camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 1, 2000);
            camera.position.set(150, 150, 150)

            scene = new THREE.Scene();
            var axes = new THREE.AxisHelper(100);
            scene.add(axes);
            var ambientLight = new THREE.AmbientLight(0xcccccc, 0.4);
            scene.add(ambientLight);

            pointLight = new THREE.PointLight(0xffffff, 0.8);
            scene.add(pointLight);
            camera.add(pointLight);
            scene.add(camera);
            camera.lookAt(scene.position);
            loadObj()

            renderer = new THREE.WebGLRenderer();
            renderer.setSize(window.innerWidth, window.innerHeight);
            renderer.setClearColor(new THREE.Color(0xcccccc));
            container.appendChild(renderer.domElement);
            
            
            
        }

        var onProgress = function(xhr) {
            if (xhr.lengthComputable) {
                var percentComplete = xhr.loaded / xhr.total * 100;
                console.log(Math.round(percentComplete, 2) + '% downloaded');
            }
        };

        function loadObj() {
        	   var manager = new THREE.LoadingManager();
               
       	    var loader = new THREE.OBJLoader( manager );
               loader.load( '${pageContext.request.contextPath}/ThreeModel/13.obj', function ( object ) {

                
                   objMesh = object;
                   console.log(object);
                   
                   object.children[0].geometry.center() ;
                   object.position = new THREE.Vector3(0,0,0);
                
                   scene.add( object );
               });
        }

        function loadGltf() {
            var a = new Date().getTime() / 1000
            var gltfloader = new THREE.GLTFLoader()
            gltfloader.setDRACOLoader(new THREE.DRACOLoader());
            gltfloader.load('${pageContext.request.contextPath}/ThreeModel/ff.gltf', function(gltf) {
                var object = gltf.scene
                var objBbox = new THREE.Box3().setFromObject(gltf.scene);
                var bboxCenter = objBbox.getCenter().clone();
                bboxCenter.multiplyScalar(-1);
                object.traverse(function(child) { //转换成threejs对象
                    if (child instanceof THREE.Mesh) {
                        child.geometry.translate(bboxCenter.x, bboxCenter.y, bboxCenter.z);
                    }
                });
                objBbox.setFromObject(object); // Update the bounding box
                obj = object
                obj.rotation.set(5, 0, 3)
                obj.scale.set(0.5, 0.5, 0.5)
                scene.add(object);
                // self.postMessage(JSON.stringify(scene.toJSON()))
                console.log(scene)
                console.log('webwork send scene')
                console.log((new Date().getTime() / 1000) - a + " s")
            }, onProgress);
        }

        function animate() {
            requestAnimationFrame(animate);
            render();
        }

        function render() {

            renderer.render(scene, camera);
        }
    </script>

</body>

</html>
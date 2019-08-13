<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style type="text/css">
        html, body {
            margin: 0;
            height: 100%;
        }
        body {
  font-family: Segoe UI, "microsoft yahei";
  font-size: 22px; 
  background:url(../images/titleBg.png) no-repeat;
  background-position: center 5px;
  background-size:98% 70px;
  height:250%;
  wight:250%;
  color: #fff;
}

        canvas {
            wight:1200px;
        }

    </style>
</head>
<body onload="draw();">

</body>
   <script src="${pageContext.request.contextPath}/ThreeModel/build/three.js"></script>
<%--    		<script src="${pageContext.request.contextPath}/ThreeModel/js/Three.js"></script> --%>
        <script src="${pageContext.request.contextPath}/ThreeModel/js/Stats.js"></script>
        <script src="${pageContext.request.contextPath}/ThreeModel/js/OrbitControls.js"></script>
        <script src="${pageContext.request.contextPath}/ThreeModel/js/dat.gui.js"></script>
          <script src="${pageContext.request.contextPath}/ThreeModel/js/loaders/OBJLoader.js"></script>
    
    <script src="${pageContext.request.contextPath}/ThreeModel/js2/loaders/OBJLoader.js"></script>
    <script src="${pageContext.request.contextPath}/ThreeModel/js2/loaders/MTLLoader.js"></script>
    <script src="${pageContext.request.contextPath}/ThreeModel/js2/loaders/GLTFLoader.js"></script>
    <script src="${pageContext.request.contextPath}/ThreeModel/js2/loaders/DRACOLoader.js"></script>
    <script src="${pageContext.request.contextPath}/ThreeModel/js2/libs/draco/draco_decoder.js"></script>
<script>
    var renderer;
    function initRender() {
//         renderer = new THREE.WebGLRenderer({antialias: true});
//         renderer.setSize(window.innerWidth, window.innerHeight);
//         renderer.setClearColor(new THREE.Color(0xcccccc));
//         renderer.shadowMap.type = THREE.PCFSoftShadowMap; // 默认的是，没有设置的这个清晰 THREE.PCFShadowMap
  
   renderer = new THREE.WebGLRenderer({antialias: true, alpha: true});
        renderer.setSize(window.innerWidth, window.innerHeight);
      //  renderer.setClearAlpha(0.8);
        document.body.appendChild(renderer.domElement);


    }

    var camera;
    function initCamera() {
        camera = new THREE.PerspectiveCamera(52, window.innerWidth / window.innerHeight, 0.1, 1000);
        camera.position.set(0, 40, 100);
        camera.lookAt(new THREE.Vector3(0, 0, 0));
    }

    var scene;
    function initScene() {
        scene = new THREE.Scene();
    }

    //初始化dat.GUI简化试验流程
    var gui;
    function initGui() {
        //声明一个保存需求修改的相关数据的对象
        gui = {
            phi:Math.PI/2,
            theta:0,
            getAngle:function () {
                console.log(`phi:${controls.getPolarAngle()}, theta:${controls.getAzimuthalAngle()}, target:`,controls.target);
            }
        };
        var datGui = new dat.GUI();

        datGui.add(gui, "phi", 0, Math.PI).onChange(function () {
            controls.setAngle(gui.phi, gui.theta);
        });

        datGui.add(gui, "theta", -Math.PI, Math.PI).onChange(function () {
            controls.setAngle(gui.phi, gui.theta);
        });

        datGui.add(gui, "getAngle");
    }

    var ambientLight,spotLight;
    
    //光亮
    function initLight() {
        ambientLight = new THREE.AmbientLight(0xffffff);
        scene.add(ambientLight);

        spotLight = new THREE.PointLight(0xffffff);
        spotLight.position.set(15, 50, 10);

        console.log(spotLight);

  

        scene.add(spotLight);
    }

    var cube,plane;
    function initModel() {

        //辅助工具
        //var helper = new THREE.AxisHelper(10);
       // scene.add(helper);

 
        //scene.add(cube);

        //底部平面
      

       // scene.add(plane);

        
        
        //var manager = new THREE.LoadingManager();
        
// 	    var loader = new THREE.OBJLoader( manager );
//         loader.load( '${pageContext.request.contextPath}/ThreeModel/13.obj', function ( object ) {

         
//             objMesh = object;
//             console.log(object);
            
//             //object.children[0].geometry.computeBoundingBox();
//            // object.position = new THREE.Vector3(0,0,0);
//            // object.rotation.x = THREE.Math.degToRad( 90 );
//            // console.log(- ( object.children[0].geometry.boundingBox.max.x + object.children[0].geometry.boundingBox.min.x ) / 2);
//            // console.log(- ( object.children[0].geometry.boundingBox.max.y + object.children[0].geometry.boundingBox.min.y ) / 2);
//            // console.log(- ( object.children[0].geometry.boundingBox.max.z + object.children[0].geometry.boundingBox.min.z ) / 2);
//            // console.log( object.children[0].geometry.center() );
      
           
         
//             scene.add( object );
//         });


        var gltfloader = new THREE.GLTFLoader()
        gltfloader.setDRACOLoader(new THREE.DRACOLoader());
        gltfloader.load('${pageContext.request.contextPath}/ThreeModel/wkdl11.gltf', function(gltf) {
            var object = gltf.scene
            var objBbox = new THREE.Box3().setFromObject(gltf.scene);
            var bboxCenter = objBbox.getCenter().clone();
            bboxCenter.multiplyScalar(-1);
            object.traverse(function(child) { //转换成threejs对象
                if (child instanceof THREE.Mesh) {
                   child.geometry.translate(bboxCenter.x, bboxCenter.y, bboxCenter.z);
                }
//                 if ( child.isMesh ) {
//                     child.geometry.center(); // center here
//                 }
            
            });
            objBbox.setFromObject(object); // Update the bounding box
            //object.children[0].geometry.computeBoundingBox();
           //object.position = new THREE.Vector3(0,0,0);
         
            obj = object;
            //obj.position.set(0, 0, 100);
    
            
            //obj.rotateX(3);
//             obj.rotateZ(5);
//             obj.rotation.z=32.5;
          //   obj.rotation.y+=500;
          //  obj.rotation.x =;
          
          
            scene.add(obj);
            // self.postMessage(JSON.stringify(scene.toJSON()))
            console.log(scene)
            console.log('webwork send scene')
            console.log((new Date().getTime() / 1000) - a + " s")
            
        });
    }

  
    //初始化性能插件
    var stats;
    function initStats() {
        stats = new Stats();
      //  document.body.appendChild(stats.dom);
        
        
    }

    //用户交互插件 鼠标左键按住旋转，右键按住平移，滚轮缩放
    var controls;
    function initControls() {

        controls = new THREE.OrbitControls(camera, renderer.domElement);

        controls.setAngle = function (phi, theta, distance) {

            var r = distance || controls.object.position.distanceTo(controls.target);

            var x = r * Math.cos(phi - Math.PI / 2) * Math.sin(theta) + controls.target.x;
            var y = r * Math.sin(phi + Math.PI / 2) + controls.target.y;
            var z = r * Math.cos(phi - Math.PI / 2) * Math.cos(theta) + controls.target.z;

            controls.object.position.set(x, y, z);

            controls.object.lookAt(controls.target);

        };

        // 如果使用animate方法时，将此函数删除
        //controls.addEventListener( 'change', render );
        // 使动画循环使用时阻尼或自转 意思是否有惯性
        controls.enableDamping = true;
        //动态阻尼系数 就是鼠标拖拽旋转灵敏度
        //controls.dampingFactor = 0.25;
        //是否可以缩放
        controls.enableZoom = true;
        //是否自动旋转
        controls.autoRotate = true;
        //旋转速度
        controls.autoRotateSpeed =1;
        //设置相机距离原点的最远距离
        controls.minDistance = 50;
        //设置相机距离原点的最远距离
        controls.maxDistance = 200;
        //是否开启右键拖拽
        controls.enablePan = true;
    }

    function render() {
        renderer.render(scene, camera);
    }

    //窗口变动触发的函数
    function onWindowResize() {

        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        render();
        renderer.setSize(window.innerWidth, window.innerHeight);

    }

    function animate() {
        //更新控制器
        render();

        //更新性能插件
        stats.update();

        controls.update();

        requestAnimationFrame(animate);
    }

    function draw() {
       // initGui();
        initRender();
        initScene();
        initCamera();
        initLight();
        initModel();
        initControls();
        initStats();

        animate();
        window.onresize = onWindowResize;
    }
</script>
</html>
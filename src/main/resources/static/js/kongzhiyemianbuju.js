var scale = 1
var isIE = !!window.ActiveXObject || "ActiveXObject" in window
// 整页面缩放 仅针对 pc 模拟移动设备viewpoint标签效果
if (!/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
    // 设计宽度  1920
    var resize_to_width = 1920;
    var doc = document.documentElement;
    doc.style.height = '100%'
    doc.style.width = '100%'
    document.body.style['transform-origin'] = '0 0'
    // 手动计算缩放比例, 使之适应部分缩放范围
    var calc_scale = function () {
        // 清除滚动条
        doc.style.overflow = 'hidden'
        if (doc.offsetWidth > resize_to_width * 2 || doc.offsetWidth < 1024) {
            doc.style.overflow = 'auto'
            return
        }
        scale = doc.offsetWidth / resize_to_width

        var body = document.body;
        body.style.width = resize_to_width + 'px';
        body.style['transform-origin'] = '0 0'
        body.style.transform = 'scale(' + scale + ')'

        // 调整高度 仅当页面为整屏幕设计
        var should_be_height = resize_to_width * (doc.offsetHeight / doc.offsetWidth);
        body.style.height = should_be_height + 'px';

        // 恢复滚动条
        //doc.style.overflow = 'auto'
    }
    window.addEventListener('load', calc_scale);
    window.addEventListener('resize', calc_scale);
    calc_scale()
}
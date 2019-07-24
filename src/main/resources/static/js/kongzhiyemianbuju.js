var scale = 1
var isIE = !!window.ActiveXObject || "ActiveXObject" in window
// ��ҳ������ ����� pc ģ���ƶ��豸viewpoint��ǩЧ��
if (!/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
    // ��ƿ��  1920
    var resize_to_width = 1920;
    var doc = document.documentElement;
    doc.style.height = '100%'
    doc.style.width = '100%'
    document.body.style['transform-origin'] = '0 0'
    // �ֶ��������ű���, ʹ֮��Ӧ�������ŷ�Χ
    var calc_scale = function () {
        // ���������
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

        // �����߶� ����ҳ��Ϊ����Ļ���
        var should_be_height = resize_to_width * (doc.offsetHeight / doc.offsetWidth);
        body.style.height = should_be_height + 'px';

        // �ָ�������
        //doc.style.overflow = 'auto'
    }
    window.addEventListener('load', calc_scale);
    window.addEventListener('resize', calc_scale);
    calc_scale()
}
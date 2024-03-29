function listsScroll(arg) {
    var area = document.getElementById(arg);
    var child = area.getElementsByTagName('li');
    if (child.length < 6) {
        return;
    }
    var iliHeight = 34; //单行滚动的高度
    var speed = 50; //滚动的速度
    var time;
    var delay = 2000;
    area.scrollTop = 0;
    area.innerHTML += area.innerHTML; //克隆一份一样的内容
    function startScroll() {
        time = setInterval(scrollUp, speed);
        area.scrollTop++;
    }

    function scrollUp() {
        if (area.scrollTop % iliHeight == 0) {
            clearInterval(time);
            setTimeout(startScroll, delay);
        } else {
            area.scrollTop++;
            if (area.scrollTop >= area.scrollHeight / 2) {
                area.scrollTop = 0;
            }
        }
    }
    setTimeout(startScroll, delay);
}
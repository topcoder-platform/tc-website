var objPopUp = null;
// called when you popup based on the position of the popper and the window size
function popUp(popper,popupID) {
    objPopUp = document.getElementById(popupID);
    objPopUp.style.display = 'block';
    var popperPos = findPopperPos(popper);
    var winSize = findWinSize();

    // distance from left side of the document to right side of SE placed popup
    var popupAbsWidth = popperPos[0] + popper.offsetWidth + objPopUp.offsetWidth;
    // distance from top side of the document to bottom side of SE placed popup
    var popupAbsHeight = popperPos[1] + popper.offsetHeight + objPopUp.offsetHeight;

    // alert("popupAbsHeight:" + popupAbsHeight + "\nwinSize[1]:" + winSize[1]);

    // place popup in the NW corner
    if ((popupAbsWidth >= winSize[0]) && (popupAbsHeight >= winSize[1])) {
        var x = popperPos[0] - objPopUp.offsetWidth - 6;
        var y = popperPos[1] - objPopUp.offsetHeight - 6;
    }
    // place popup in the NE corner
    else if ((popupAbsWidth < winSize[0]) && (popupAbsHeight >= winSize[1])) {
        var x = popperPos[0] + popper.offsetWidth + 6;
        var y = popperPos[1] - objPopUp.offsetHeight - 6;
    }
    // place popup in the SW corner
    else if ((popupAbsWidth >= winSize[0]) && (popupAbsHeight < winSize[1])) {
        var x = popperPos[0] - objPopUp.offsetWidth - 6;
        var y = popperPos[1] + popper.offsetHeight + 6;
    }
    // place popup in the SE corner
    else {
        var x = popperPos[0] + popper.offsetWidth + 6;
        var y = popperPos[1] + popper.offsetHeight + 6;
    }
    popShow(x,y,popupID);
    //alert(popupAbsHeight+':'+winSize[1]);
}
function findPopperPos(obj) {
    var curLeft = curTop = 0;
    if (obj.offsetParent) {
        // I'm subtracting the offsets of the 2 position:relative div's contentOut and contentIn
        // because they affect the .left and .top of the popups
        curLeft = obj.offsetLeft;
        curTop = obj.offsetTop;
        while (obj = obj.offsetParent) {
            curLeft += obj.offsetLeft;
            curTop += obj.offsetTop;
        }
    }
    return [curLeft,curTop];
}
function findWinSize(){
    if( typeof( window.innerWidth ) == 'number' ) {
        //Non-IE
        winWidth = window.innerWidth + window.pageXOffset;
        winHeight = window.innerHeight + window.pageYOffset;
    } else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
        //IE 6+ in 'standards compliant mode'
        winWidth = document.documentElement.clientWidth + document.documentElement.scrollLeft;
        winHeight = document.documentElement.clientHeight + document.documentElement.scrollTop;
    } else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
        //IE 4 compatible
        winWidth = document.body.clientWidth + document.body.scrollLeft;
        winHeight = document.body.clientHeight + document.body.scrollTop;
    }
    return [winWidth,winHeight]
}
function popShow(posX,posY,popupID) {
    objPopUp.style.left = posX + 'px';
    objPopUp.style.top = posY + 'px';
}
function popHide() {
    objPopUp.style.display = 'none';
    objPopUp = null;
}
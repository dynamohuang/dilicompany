var BDBridgeConfig = (function(){
    var self;
    var CONFIG = {
        BD_BRIDGE_OPEN: 1,
        BD_BRIDGE_ROOT: "http://qiao.baidu.com/v3/",
        VERSION: "3.0.0"
    };
    if (BDBridgeConfig && BDBridgeConfig.VERSION >= CONFIG.VERSION) {
        return BDBridgeConfig;
    }
    if (CONFIG.BD_BRIDGE_OPEN == 1) {
        var script = document.createElement("script");
        script.type="text/javascript";
        script.charset = "UTF-8";
        script.src = CONFIG.BD_BRIDGE_ROOT + "asset/front/bsl.js?t=" + (+ new Date());
        document.getElementsByTagName("head")[0].appendChild(script);
    }
    var timeStart = new Date().getTime();
    return self = {
        TIME_START: timeStart,
        VERSION: CONFIG.VERSION,
        OPEN: CONFIG.BD_BRIDGE_OPEN,
        ROOT: CONFIG.BD_BRIDGE_ROOT,
        RCV_ROOT: "http://r.qiao.baidu.com/",
        BD_BRIDGE_DATA: { mainid: "120564098", SITE_ID: "f4fc0115c810c55a75971648989937bf", siteid: "5329112", userName: '成都勇创金诺科技'},
        OPEN_MODULES: "00000",
        JS_LOADER_URL: CONFIG.BD_BRIDGE_ROOT + 'asset/front/entry/',
        CSS_DEFAULT_URL: 'http://s.qiao.baidu.com/asset/front/css/default/',
        CSS_LOADER_URL: "http://s.qiao.baidu.com/style/98/120564098/",
                BD_BRIDGE_SPECIAL:  [] ,
                BD_BRIDGE_STYLE_ITEM :         [        {
            pageid: "0",
            styleid: "0" - 0,
                        BD_BRIDGE_GROUP:  [] ,
            BD_BRIDGE_ICON : {
                iconlevel: "1" - 0,
                icontype: "1" - 0,
                iconposition: {
                    postype: "1" - 0,
                    position: "1" - 0
                },
                iconskin: {
                    useOfflineimg: "0" - 0
                },
                iconmode: "0" - 0
            },
                        BD_BRIDGE_INVITE: {
                text: "<p style=\"font-size:12px;font-family:宋体;font-color:#000000;\">欢迎您，有什么可以帮助您的么？<\/p>",
                type: '0',
                way:  ("1" * Math.pow(2, 0)) + ("1" * Math.pow(2, 1)) ,
                page: '1' - 0,
                                interval: '30' - 0,
                                                time: '10' - 0
            },
            BD_BRIDGE_WEBIM: {
                webimtype: '0' - 0,
                webimchat: {
                    showtype: '2' - 0,
                    name: ''
                },
                webimposition: '2' - 0,
                webimlitebgcolor: '#d5d5d5'
            },
                        BD_BRIDGE_MESS : {
                messItem: {
                    messItemName: '0' - 0,
                    messItemPhone: '0' - 0,
                    messItemAddress: '0' - 0,
                    messItemEmail: '0' - 0,
                    messItemText: '1' - 0,
                    language: '0' - 0
                },
                messType: {
                    disableMess: '0' - 0
                },
                messShow: { 
                    messFloatType: '0' - 0
                },
                extraMessItems  :  [] 
            }
        }        ]
        
    }
})();

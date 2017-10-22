//请求接口
function getDomain(url){
    var host = location.hostname;
    var reg = /(?:http(?:s)?:\/\/)?(?:www\.)?(.*?)\./;
    var regR = /https?:\/\/(?:[^/]+\.)?([^./]+\.(?:com))(?:$|\/)/;
    var m = host.match(reg);

    var domain = {
        www: location.protocol + '//' + location.hostname + '/php_deposit/website/web/',
        deposit: location.protocol + '//' + location.hostname + '/php_deposit/frontend/web/',
        m: location.protocol + '//' + location.hostname + '/php_deposit/mobile/web/',
        h5: location.protocol + '//' + location.hostname + '/php_deposit/h5/web/'
    };

    if (m !== null) {
        if (m[1] === 'h5') {
          domain = {
            www: location.protocol + '//www.koudailc.com/',
            deposit: location.protocol + '//deposit.koudailc.com/',
            m: location.protocol + '//m.koudailc.com/',
            h5: location.protocol + '//h5.koudailc.com/'
          };
        }

        if (m[1] === 'pre-h5') {
          domain = {
            www: location.protocol + '//pre-www.koudailc.com/',
            deposit: location.protocol + '//pre-deposit.koudailc.com/',
            m: location.protocol + '//pre-m.koudailc.com/',
            h5: location.protocol + '//pre-h5.koudailc.com/'
          };
        }

        if (host == '121.199.1.198' || host == '192.168.8.101') {
          domain = {
            www: location.protocol + '//' + location.hostname + '/koudai_deposit/website/web/',
            deposit: location.protocol + '//' + location.hostname + '/koudai_deposit/frontend/web/',
            m: location.protocol + '//' + location.hostname + '/koudai_deposit/mobile/web/',
            h5: location.protocol + '//' + location.hostname + '/koudai_deposit/h5/web/'
          };
        }
    } 
    var arr = url.match(reg);
    if (domain[arr[1]]) {
        return url.replace(regR, domain[arr[1]]);
    }
    return url.replace(/^https:?/, location.protocol);  
}
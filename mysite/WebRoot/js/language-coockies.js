var name = "somoveLanguage";       
      function  chgLang() {  
         var value = $("#ddlSomoveLanguage").children('option:selected').val();   
        SetCookie(name,value);  
        location.reload();    
           }       
      function  SetCookie(name,value){   
      var Days = 30; //此 cookie 将被保存 30 天  
          var exp = new Date();    //new Date("December 31, 9998");  
          exp.setTime(exp.getTime() + Days*24*60*60*1000);  
          document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();  
       }  
    function getCookie(name)//取cookies函数     
    {  
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));  
     if(arr != null) return unescape(arr[2]); return null;  
    }  
    $(function() {  
        var uulanguage = (navigator.language || navigator.browserLanguage).toLowerCase();  
                if (uulanguage.indexOf("en") > -1) {  
                    $("[data-localize]").localize("text", {pathPrefix: "lang", language: "en"});  
               }else if (uulanguage.indexOf("zh") > -1) {  
                 $("[data-localize]").localize("text", {pathPrefix: "lang", language: "zh"});  
              }else{  
              $("[data-localize]").localize("text", {pathPrefix: "lang", language: "zh_cn"});  
              };          
         if (getCookie(name) != "") {  
             if (getCookie(name) == "zh") {  
                 $("[data-localize]").localize("text", {pathPrefix: "lang", language: "zh"});   
            }  
             if (getCookie(name) == "en") {  
                 $("[data-localize]").localize("text", {pathPrefix: "lang", language: "en"});       
            }  
             if (getCookie(name) == "zh_cn") {  
                 $("[data-localize]").localize("text", {pathPrefix: "lang", language: "zh_cn"});       
            } 
        }  
    });  
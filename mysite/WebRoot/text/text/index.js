


// 禁止alert事件
window.alert = function(){ return false; };

/*定时弹框*/
function mixfirm(obj) {
    var strs = '<h4>'+obj+'</h4>';
    $(".mixfirm").html(strs);
    $(".mixfirm").show();
}





//确认弹出框js
function firm(obj) {
    var str = '<h4>'+obj+'</h4>' +
        '<div class="firbtn">' +
        '<button type="button" class="mui-btn mui-btn-primary" onclick="addsure()">确定</button>' +
        '<button type="button" class="mui-btn mui-btn-primary addcancel">取消</button>' +
        '<div>'
    $(".firm").html(str);
    $(".firm").show();
    $(".addcancel").click(function() {
        $(".firm").hide();
    })
} 

function addsure() { //弹框确认按钮执行事件，适情况而定
    $(".firm").hide();
}  



// 判断用户名密码的js
//数据库一般存储的密码是md5格式，判断密码是否正确时，先将密码转为md5格式，再判断；（转md5格式，先引用md5js，再写hex_md5("2121212") 即可）

$(function() {
　　　　　//根据localStorage中是否有值，判断用户是否登录过
        if(window.localStorage){  //用户登录过
            var name1 = localStorage.getItem("usename"); //获取存储的用户名
            var pwd1 = localStorage.getItem("pwd");        //获取存储的密码
            $("input[name=usename]").val(name1);         //用户名赋值 
            $("input[name=pwd]").val(pwd1);                //密码赋值
        }else{ 
            $("input[name=usename]").val("");
            $("input[name=pwd]").val("");
        }
    })
　　//点击登录按钮
    $('.btnYes').click(function (event) {        
        if($("input[name=usename]").val()=="") {  //用户名为空时
            $(".mixfirm").show();
            mixfirm("用户名不能为空");
            setTimeout(function() {
                $(".mixfirm").hide();
            },1000);
            return false;
        }
        if($("input[name=pwd]").val()=="") {  //密码为空
            $(".mixfirm").show();
            mixfirm("密码不能为空");
            setTimeout(function() {
                $(".mixfirm").hide();
            },1000);
            return false;
        }


        var list1 = $("input[name=usename]").val();   //获取当前输入的用户名，根据用户名查SQL
        sql("select * from Users where usename='"+list1+"'",function(data) {
            if(data!=null) {  //如果用户名存在
                var ps1 = data.pwd;  //获取数据库密码
                var ps2 = hex_md5($("input[name=pwd]").val());   //获取输入的密码，并转成md5格式
                if(ps1 == ps2) {  //如果输入的密码正确，执行loginAfter方法

                    //用ttyu平台获取所有用户的信息的方法，可以在此写SQL直接查数据库
　　　　　　　　　　　　$("#form1").send({ table: "Users", action: "login", backAfter: "loginAfter" });
                }else {  //密码错误，弹框提示
                    $(".mixfirm").show();
                    mixfirm("密码错误");
                    setTimeout(function() {
                        $(".mixfirm").hide();
                    },1000);
                    return false;
                }
            }else{  //用户名不存在
                $(".mixfirm").show();
                mixfirm("该用户不存在");
                setTimeout(function() {
                    $(".mixfirm").hide();
                },1000);
                return false;
            }
        })
    });
    //登录回调函数
    function loginAfter(result) {  //result -- 所有用户信息
        try {
            ttyu.user.saveUser(result);  //当前用户信息
            var names = $("input[name=usename]").val();  //获取输入的用户名
            var pwds = $("input[name=pwd]").val();         //获取输入的密码
            localStorage.setItem("usename",names);       //本地存储
            localStorage.setItem("pwd",pwds); 
           // location = "index.html";                       //跳转到首页面
        } catch (e) { 
            firm(result);
        }
    }
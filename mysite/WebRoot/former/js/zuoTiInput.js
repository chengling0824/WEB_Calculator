$(function(){

	//添加必填标识
	$("form :input.required").each(function(){
            var $required = $("<strong class='high'> *</strong>"); //创建元素
            $(this).parent().append($required); //然后将它追加到文档中
    });

    $('form :input').blur(function(){
             var $parent = $(this).parent();
             $parent.find(".formtips").remove();
             //验证题目数目
             if( $(this).is('#numInfo') ){
                if( this.value=="" || this.value.length > 100 ){
                    var errorMsg = '一次不能贪多哦~.';
                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                }
             }
            //验证算式数值范围
            if( $(this).is('#maxNumInfo') ){
                if( this.value=="" ){
                     errorMsg = '例如100、1000~';
                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                }else{
                    var okMsg = '输入成功啦.';
                    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
                }
             }
            //运算符数目
             if( $(this).is('#numOperators')){
             	if ( this.value=="")  {
             		var okMsg = '随意输入，开心就好(*^_^*).';
                    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
             	}
             }

        }).keyup(function(){
           $(this).triggerHandler("blur");
        }).focus(function(){
             $(this).triggerHandler("blur");
        });//end blur

		//实现即时提醒
    $("form :input").keyup(function(){    
		$(this).triggerHandler("blur");
	});
	$("form :input").focus(function(){
		$(this).triggerHandler("blur");
	})

	$("#send").click(function(){
		$("form :input.required").trigger("blur");
		var numError=$("form .onError").length;
		if(numError){
			alert("请选择你要的题目");
			return false;
		}
		alert("生成题目成功啦！");
	})

    //重置
     $('#res').click(function(){
            $(".formtips").remove(); 
     });
})
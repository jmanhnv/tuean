/*
 *  Document   : base_ui_activity.js
 *  Author     : pixelcave
 */
var BaseUIActivity=function(){var n=function(){jQuery(".js-bar-randomize").on("click",function(){jQuery(this).parents(".block").find(".progress-bar").each(function(){var n=jQuery(this),e=Math.floor(91*Math.random()+10)+"%";n.css("width",e),n.parent().hasClass("progress-mini")||n.html(e)})})},e=function(){jQuery(".js-swal-alert").on("click",function(){swal("Hi, this is a simple alert!")}),jQuery(".js-swal-success").on("click",function(){swal("Success","Everything updated perfectly!","success")}),jQuery(".js-swal-error").on("click",function(){swal("Oops...","Something went wrong!","error")}),jQuery(".js-swal-confirm").on("click",function(){swal({title:"Are you sure?",text:"You will not be able to recover this imaginary file!",type:"warning",showCancelButton:!0,confirmButtonColor:"#d26a5c",confirmButtonText:"Yes, delete it!",html:!1,preConfirm:function(){return new Promise(function(n){setTimeout(function(){n()},50)})}}).then(function(n){swal("Deleted!","Your imaginary file has been deleted.","success")},function(n){})})};return{init:function(){n(),e()}}}();jQuery(function(){BaseUIActivity.init()});
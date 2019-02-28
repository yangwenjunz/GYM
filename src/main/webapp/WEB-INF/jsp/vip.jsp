<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/2/25
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的信息</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <script src="../../layui/layui.js"></script>
    <%--<script>--%>
        <%--layui.use(['layer', 'form'], function(){--%>
            <%--var layer = layui.layer--%>
                <%--,form = layui.form;--%>
                <%--layer.msg("");--%>

        <%--});--%>
    <%--</script>--%>


    <script>
       /* 点击图片触发 文件选择的click事件*/
        function selectfile(){
            document.getElementById("btn_file").click();
        }

        /* 上传*/
        function upload(){
            document.getElementById("upimg").submit();

        }

    </script>
<style>
    h3{
      font-family: 华文行楷;
    }
    tr{
        font-family: 华文行楷;
    }
    span{
        font-family: 华文行楷;
    }
</style>
</head>

<body style="background-color: #9F9F9F">

<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md6">
            <div class="layui-card" style="width: 400px;height: 500px;margin-left: 20%  ">
                <div class="layui-card-body" style="width:auto;height:auto;">
                    <%--****************************************--%>
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                        <legend style="margin-left:35%;color: #eb7350;font-family: 华文行楷">个人资料</legend>
                    </fieldset>
                    <%--头像--%>
                    <form id="upimg" action="${pageContext.request.contextPath}/vip/upload" enctype="multipart/form-data" method="post">
                        <input type="file" id="btn_file" style="display: none" onchange="upload()" name="xxx">
                        <input type="hidden" id="hid" name="hid"value="${vipselectbyhid.hid}">
                        <div class="layui-inline" style="margin-left:35%">
                            <img style="width: 110px;height: 110px" src="http://localhost:8080/img/${vipselectbyhid.img}" class="layui-circle"onclick="selectfile()">
                            <hr class="layui-bg-orange">
                        </div>
                    </form>
                    <%--明细--%>
                    <div style="text-align:center;width:120px;margin-left: 33%;">
                        <h2 style="color: #00F7DE;font-family: 华文行楷">${vipselectbyhid.realname}</h2><br>
                        <h3>${vipselectbyhid.hname}</h3><br>
                        <h3 >${vipselectbyhid.haddress}</h3>
                    </div>
                    <%--橙色分割线--%>
                    <hr class="layui-bg-orange">

                    <div style="margin-top: 8%;">
                        <div style="text-align:center;width: 70px;height: 50px;float: left;">
                            <p >${vipselectbyhid.hage}</p>
                            <h3 >年&nbsp;龄</h3>
                        </div>

                        <div  style="text-align:center;width: 70px;height: 50px;margin-top:0px;float: left;margin-left: 20%;">
                            <p style="font-family: 华文行楷">${vipselectbyhid.hsex}</p>
                            <h3>性&nbsp;别</h3>
                        </div>

                        <div  style="text-align:center;width: 70px;height: 50px;float: left;margin-left: 15%;">
                            <p>&nbsp;&nbsp;${vipselectbyhid.hphone}&nbsp;</p>
                            <h3>&nbsp;联&nbsp;系&nbsp;电&nbsp;话</h3>
                        </div>
                    </div>
                    <%--**********************************************************--%>
                </div>
            </div>
        </div>
        <%--右侧面版--%>
        <div class="layui-col-md6">
            <div class="layui-card" style="margin-left:-20% ">
                <div class="layui-card-body">
                    <%--*****************************************************************--%>
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top:30px;">
                        <legend style="margin-left: 42%"><h3>我的信息</h3></legend>
                    </fieldset>

                    <form class="layui-form" action="/vip/update" lay-filter="example" method="post">
                        <input type="hidden" value="${vipselectbyhid.hid}" name="hid">
                        <div class="layui-form-item">

                            <div class="layui-inline">
                                <label class="layui-form-label"><h3>用&nbsp;户&nbsp;名</h3></label>
                                <div class="layui-input-inline">
                                    <h3><input type="text" name="hname" readonly lay-verify="title" autocomplete="off" placeholder="请输入用户名" class="layui-input"></h3>
                                </div>
                            </div>

                            <div class="layui-inline">
                                <label class="layui-form-label"><h3>真&nbsp;实&nbsp;姓&nbsp;名</h3></label>
                                <div class="layui-input-block">
                                   <h3><input type="text" name="realname"  readonly placeholder="请输入真实姓名" autocomplete="off" class="layui-input"></h3>
                                </div>
                            </div>

                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label"><h3>年&nbsp;龄</h3></label>
                            <div class="layui-input-inline">
                                <input type="text" name="hage" readonly lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label"><h3>密&nbsp;码</h3></label>
                            <div class="layui-input-inline">
                                <input type="password" name="hpwd" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux"><h3>请填写6到12位密码</h3></div>
                        </div>



                        <div class="layui-form-item">
                            <label class="layui-form-label"><h3>性&nbsp;别</h3></label>
                            <div class="layui-input-block">
                                <h3><select name="hsex" lay-filter="aihao" lay-verify="required">
                                    <option value=""></option>
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                                </h3>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label"><h3>联&nbsp;系&nbsp;电&nbsp;话</h3></label>
                                <div class="layui-input-block">
                                    <input type="tel" name="hphone"  placeholder="请输入联系电话" lay-verify="required|phone" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label"><h3>详&nbsp;细&nbsp;地&nbsp;址</h3></label>
                            <div class="layui-input-block">
                                <h3><input type="text" name="haddress"  lay-verify="title" autocomplete="off" placeholder="请输入详细地址" class="layui-input"></h3>
                            </div>
                        </div>

                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label"><h3>个&nbsp;人&nbsp;简&nbsp;介</h3></label>
                            <div class="layui-input-block">
                               <h3><textarea placeholder="请输入内容"  class="layui-textarea" name="remark"></textarea> </h3>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                               <h3><button class="layui-btn layui-btn-warm layui-btn-radius" lay-submit="" lay-filter="demo1" style="margin-left: 35%">更新信息</button></h3>
                            </div>
                        </div>
                    </form>
                    <%--**********************************************************************--%>
                </div>
            </div>
        </div>
        <%--底部面板--%>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <%--************************************************************************--%>
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                        <legend><h3>我的课程</h3></legend>
                    </fieldset>
<%--*******************--%>
                        <table class="layui-hide" id="test"></table>
    <%--*********************--%>



                </div>
            </div>
        </div>
    </div>
</div>



<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });
        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 0){
                    return '用户名不能为空';
                }
            }
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });
        //监听提交
        form.on('submit(demo1)', function(data){
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })
            // return false;
        });
        <%--//表单初始赋值--%>
        form.val('example', {
            "hname": "${vipselectbyhid.hname}"
            ,"realname":"${vipselectbyhid.realname}"
            ,"hpwd": "${vipselectbyhid.hpwd}"
            ,"hage":${vipselectbyhid.hage}
            ,"hsex": "${vipselectbyhid.hsex}"
            ,"hphone":"${vipselectbyhid.hphone}"
            ,"haddress":"${vipselectbyhid.haddress}"
            ,"remark": "${vipselectbyhid.remark}"
        })


    });

    layui.use(['element', 'layer'], function(){
        var element = layui.element;
        var layer = layui.layer;

        //监听折叠
        element.on('collapse(test)', function(data){
            layer.msg('展开状态：'+ data.show);
        });
    });


</script>

<script>
    layui.use('table', function(){
        var table = layui.table;
         var    hid=document.getElementById("hid").value;
        table.render({
            elem: '#test'
            ,url:'/vip/mycum?hid='+hid
            ,cols: [[
                 {field:'cname',  title: '课程名', sort: true}
                ,{field:'cattend',  title: '课程时间'}
                ,{field:'cprice',title: '价格', templet:function (d) {
                        return d.cprice+"￥";
                    }, sort: true}
                ,{field:'jname',  title: '教练'}
            ]]
            ,page: true
        });
    });
</script>



</body>
</html>

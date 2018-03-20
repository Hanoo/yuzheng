<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/style/js/easyui/themes/black/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/js/easyui/themes/icon.css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/echart3/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/easyui/jquery.easyui.min.js"></script>
    <title>监控点配置页面</title>
    <script type="text/javascript">
        function submitForm(){
            $('#form_1').form('submit',{
                success:function (msg) {
                    alert(msg);
//                    clearForm();
                }
            });
        }

        function clearForm() {
            $('#form_1').form('clear');
        }

        $(document).ready(function () {
            $("#addr").combobox({
                onChange:function(n,o){

                    $.ajax({
                        url:'/common/getSelectVal',
                        data:{id:n},
                        success:function (data) {
                            $("#select").combobox('setValue',data.data);
                        }
                    });

                }
            })
        });
    </script>

</head>
<body style="background-color: #666666;margin: 0 auto;">
<div class="easyui-panel" title="监区监控配置" style="width:100%; height: 100%;max-width:800px;padding:30px 60px;">
    <form id="form_1" action="/common/savecfg" class="easyui-form" method="post" data-options="novalidate:true">


        <select class="easyui-combobox" name="addr" id="addr" label="监控点:" labelPosition="top" style="width: 100%;height: 65px;"
                data-options="required:true">
            <option value="1">地点1</option>
            <option value="2">地点2</option>
            <option value="3">地点3</option>
            <option value="4">地点4</option>
            <option value="5">地点5</option>
            <option value="6">地点6</option>
            <option value="7">地点7</option>
            <option value="8">地点8</option>
            <option value="9">地点9</option>
            <option value="10">地点10</option>
            <option value="11">地点11</option>
            <option value="12">地点12</option>
            <option value="13">地点13</option>
            <option value="14">地点14</option>
            <option value="15">地点15</option>
        </select>

        <select class="easyui-combobox" name="select" id="select" multiple="true" multiline="false" label="监区:"
                labelPosition="top" style="width:100%;height:65px;">
            <c:forEach items="${select}" var="item">
                <option value="${item.code}">${item.caption}</option>
            </c:forEach>
        </select>

        <div style="text-align:center;padding:5px 0">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">提交</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">清空</a>
        </div>

    </form>
</div>
</body>
</html>

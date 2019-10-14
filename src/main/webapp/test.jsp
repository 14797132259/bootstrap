<%@page isELIgnored="false" contentType="text/html; utf-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="app" value="${pageContext.request.contextPath}"></c:set>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <%--引入核心css以及js--%>
    <%--引入jqgrid的css--%>
    <%--1.jqgird核心css--%>
    <link rel="stylesheet" href="${app}/jqgrid/css/ui.jqgrid.css">
    <%--2.引入jqgirid的主题css样式--%>
    <link rel="stylesheet" href="${app}/jqgrid/css/css/cupertino/jquery-ui-1.8.16.custom.css">
    <%--引入bootstrap的css--%>
    <link rel="stylesheet" href="${app}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <%--引入jquery的css--%>
    <script src="${app}/bootstrap-3.3.7-dist/js/jquery-3.3.1.min.js"></script>
    <%--引入jqgrid的核心js--%>
    <script src="${app}/jqgrid/js/jquery.jqGrid.src.js"></script>
    <%--引入jqgridg国际化js--%>
    <script src="${app}/jqgrid/js/i18n/grid.locale-cn.js"></script>
    <%--引入bootstrap的js--%>
    <script src="${app}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>

        .aa {

            background-color: red;
        }

        .bb {

            border: solid blue 1px;
        }
    </style>
    <script>
        $(function () {
            //表格初始化  声明相应的属性
            $("#list").jqGrid({
                url: "${app}/json/userpage.json", //请求路径
                datatype: "json", //返回的数据类型  json---->js对象.属性
                colNames: ["编号", "姓名", "密码", "生日", "年龄"], //标题行中每一列的名称
                cellEdit: true,
                autowidth: true,  //将所有列自适应父容器
                pager: "#aa",
                rowNum: "2", //pagesize 每页显示的条数
                rowList: [2, 10, 20, 40],
                viewrecords: true,  //可以看到总记录数
                caption: "员工信息",
                editurl: "${app}/user/edit", //当表格进行编辑的时候会请求的路径  增  删   改
                colModel: [   //数据行中的每一列
                    {
                        name: "id",
                        align: "center",   //居中
                        //classes:"aa bb",  //要的是css的类
                        hidden: true,
                    },
                    {

                        name: "name",    //用来映射当前列的数据
                        editable: true,  //使单元格可编辑要想使editable生效需要在初始化属性中加入celledit
                        edittype: "select", //选择可编辑类型
                        editoptions: {
                            //指定下拉框中的数据
                            value: "1:男;2:女;3:其他",
                            //dataUrl:"下拉框对应的请求路径",  不是返回json而是html标签
                        },
                        width: 300,  //设置当前列的列宽 值只能是像素值
                        fixed: true,  //当前列宽度不可变
                        resizable: false, //是否可以重新分配列宽
                        editable: true,
                    },
                    {
                        name: "password",
                        resizable: false,
                        search: false,   //指当前列不参与搜索
                        sortable: false,  //当前列不参与排序
                        editable: true,
                    },
                    {
                        name: "bir",
                        editable: true,
                    },
                    {
                        name: "age",
                        editable: true,
                        formatter: function (cellvalue, options, rowObject) {
                            //cellvalue 单元格中的值 options当前的表格对象 rowObject 当前行对象
                            //对当前列进行二次渲染
                            console.log(cellvalue);
                            console.log(options);
                            console.log(rowObject);
                            if (cellvalue > 20) {
                                return "老年"
                            }
                            return "青年"
                        }
                    }
                ]
            }).jqGrid("navGrid", "#aa", {edit: true, add: true, del: true, search: true, refresh: true})
        })
    </script>
</head>
<body>

<table id="list"></table>

<div id="aa"></div>

</body>


</html>
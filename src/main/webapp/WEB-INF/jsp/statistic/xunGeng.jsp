<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=request.getContextPath()%>/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
    <meta name="author" content="Coderthemes">

    <link rel="shortcut icon" href="assets/images/favicon_1.ico">

    <title>首页</title>

    <link href="plugins/jquery-circliful/css/jquery.circliful.css" rel="stylesheet" type="text/css" />

    <link href="plugins/switchery/switchery.min.css" rel="stylesheet" />

    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">

    <script src="assets/js/modernizr.min.js"></script>
    <style>
        .card-box {
            padding: 10px;
            border: 1px solid rgba(54, 64, 74, 0.08);
            -webkit-border-radius: 5px;
            border-radius: 5px;
            -moz-border-radius: 5px;
            background-clip: padding-box;
            margin-bottom: 20px;
            background-color: #36404a;
            width: 100%;
        }
        .header-title {
            text-transform: uppercase;
            font-size: 21px;
            font-weight: 700;
            line-height: 16px;
            margin-bottom: 8px;
            margin-top: 0;
        }
        .tborder3 {
            clear: both;
            font-size: 1px;
            height: 3px;
            line-height: 3px;
            background: #fff;
            -moz-opacity: 0.4;
            -khtml-opacity: 0.4;
            opacity: 0.4;
            filter: alpha(opacity=40);
        }
        .tit02 {
            font-size: 21px;
            color: #fff;
            font-weight: bold;
            height: 44px;
            line-height: 44px;
        }
        .greens {
            color: #00ff00;
        }
        .prompt{
            background-color: #2e343c;
            border-radius: 50px 10px 10px 50px;
            padding: 10px;
        }
        .prompt p{
            text-align: left;
            color:#ffffff;
            padding-left: 5px;
            margin-left: 32px;
        }
        .widget-bg-color-icon .bg-icon{
            width: 40px;
            height: 40px;
            line-height: 28px;
            font-size: 1.2em;
            color: #ffffff;
        }
    </style>
</head>


<body class="widescreen fixed-left-void">

<!-- Begin page -->
<div id="wrapper" class="forced enlarged">

    <%@ include file="topBar.jsp" %>

    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <!-- ============================================================== -->
    <div class="content-page">
        <!-- Start content -->
        <div class="content">
            <div class="container-fluid">

                <!-- Page-Title -->
                <div class="row">

                    <div class="col-lg-12" >
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card-box">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="page-title-box" style="box-shadow:none;margin: 0;">
                                                <div class=" row">
                                                    <h4 class="col-2 header-title m-t-0 " style="margin-bottom: 0;padding: 14px 10px 10px 0;">
                                                        实时监区点名汇总
                                                    </h4>
                                                    <label class="col-3 col-form-label text-right" style="line-height: 30px">请输入查询日期：</label>
                                                    <div class="col-3">
                                                        <input class="form-control" type="date" name="date">
                                                    </div>
                                                    <div class=" text-center" style="width: 20px; line-height: 40px">
                                                        至
                                                    </div>
                                                    <div class="col-3">
                                                        <input class="form-control" type="date" name="date">
                                                    </div>
                                                    <button type="submit" class="btn btn-primary waves-effect waves-light btn-md">
                                                        搜索
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <hr style="border-color:#656565;">
                                    <div class="row" id="empTypeHJ2">
                                        <div class="itemwrap01 col-lg-3 text-center">
                                            <div class="tit02">巡更总点数：<b class="greens" id="sdNumAll">46</b></div>
                                        </div>
                                        <div class="itemwrap01 col-lg-5 text-center" >
                                            <div class="tit02">巡更时间段：<b class="greens" id="sdNumAll">15:00</b><b class="greens" id="sdNumAll">－</b><b class="greens" id="sdNumAll">16:00</b></div>
                                        </div>


                                    </div>
                                    <div class="widget-chart text-left">
                                        <div class="row">
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-success pull-left " >
                                                        <span>1</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0 prompt-num">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box fadeInDown animated">
                                                    <div class="bg-icon bg-icon-success pull-left " >
                                                        <span>2</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0 prompt-num">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-danger pull-left" >
                                                        <span>3</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">

                                                    <div class="bg-icon bg-icon-inverse pull-left" >
                                                        <span>4</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-danger pull-left" >
                                                        <span>5</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">

                                                    <div class="bg-icon bg-icon-inverse pull-left" >
                                                        <span>6</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-success pull-left " >
                                                        <span>7</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0 prompt-num">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box fadeInDown animated">
                                                    <div class="bg-icon bg-icon-success pull-left " >
                                                        <span>8</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0 prompt-num">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-danger pull-left" >
                                                        <span>9</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">

                                                    <div class="bg-icon bg-icon-inverse pull-left" >
                                                        <span>10</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-danger pull-left" >
                                                        <span>11</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">

                                                    <div class="bg-icon bg-icon-inverse pull-left" >
                                                        <span>12</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-success pull-left " >
                                                        <span>13</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0 prompt-num">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box fadeInDown animated">
                                                    <div class="bg-icon bg-icon-success pull-left " >
                                                        <span>14</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0 prompt-num">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-danger pull-left" >
                                                        <span>15</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">

                                                    <div class="bg-icon bg-icon-inverse pull-left" >
                                                        <span>16</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-danger pull-left" >
                                                        <span>17</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">

                                                    <div class="bg-icon bg-icon-inverse pull-left" >
                                                        <span>18</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-success pull-left " >
                                                        <span>19</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0 prompt-num">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box fadeInDown animated">
                                                    <div class="bg-icon bg-icon-success pull-left " >
                                                        <span>20</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0 prompt-num">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-danger pull-left" >
                                                        <span>21</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">

                                                    <div class="bg-icon bg-icon-inverse pull-left" >
                                                        <span>22</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-danger pull-left" >
                                                        <span>23</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">

                                                    <div class="bg-icon bg-icon-inverse pull-left" >
                                                        <span>24</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-success pull-left " >
                                                        <span>25</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0 prompt-num">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box fadeInDown animated">
                                                    <div class="bg-icon bg-icon-success pull-left " >
                                                        <span>26</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0 prompt-num">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-danger pull-left" >
                                                        <span>27</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">

                                                    <div class="bg-icon bg-icon-inverse pull-left" >
                                                        <span>28</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-danger pull-left" >
                                                        <span>29</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">

                                                    <div class="bg-icon bg-icon-inverse pull-left" >
                                                        <span>30</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-success pull-left " >
                                                        <span>31</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0 prompt-num">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box fadeInDown animated">
                                                    <div class="bg-icon bg-icon-success pull-left " >
                                                        <span>32</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0 prompt-num">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-danger pull-left" >
                                                        <span>33</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">

                                                    <div class="bg-icon bg-icon-inverse pull-left" >
                                                        <span>34</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-danger pull-left" >
                                                        <span>35</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">

                                                    <div class="bg-icon bg-icon-inverse pull-left" >
                                                        <span>36</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-success pull-left " >
                                                        <span>37</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0 prompt-num">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box fadeInDown animated">
                                                    <div class="bg-icon bg-icon-success pull-left " >
                                                        <span>38</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0 prompt-num">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-danger pull-left" >
                                                        <span>39</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">

                                                    <div class="bg-icon bg-icon-inverse pull-left" >
                                                        <span>40</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-danger pull-left" >
                                                        <span>41</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">

                                                    <div class="bg-icon bg-icon-inverse pull-left" >
                                                        <span>42</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-success pull-left " >
                                                        <span>43</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0 prompt-num">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box fadeInDown animated">
                                                    <div class="bg-icon bg-icon-success pull-left " >
                                                        <span>44</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0 prompt-num">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">
                                                    <div class="bg-icon bg-icon-danger pull-left" >
                                                        <span>45</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                            <div class="col-lg-2 col-md-6">
                                                <div class="widget-bg-color-icon card-box">

                                                    <div class="bg-icon bg-icon-inverse pull-left" >
                                                        <span>46</span>
                                                    </div>
                                                    <div class="text-right prompt">
                                                        <p class="text-muted mb-0">主楼东一层门侧</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- end container -->
    </div>
    <!-- end content -->

</div>
<!-- ============================================================== -->
<!-- End Right content here -->
<!-- ============================================================== -->

</div>
<!-- END wrapper -->


<script>
    var resizefunc = [];
</script>

<!-- Plugins  -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/popper.min.js"></script><!-- Popper for Bootstrap -->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/detect.js"></script>
<script src="assets/js/fastclick.js"></script>
<script src="assets/js/jquery.slimscroll.js"></script>
<script src="assets/js/jquery.blockUI.js"></script>
<script src="assets/js/waves.js"></script>
<script src="assets/js/wow.min.js"></script>
<script src="assets/js/jquery.nicescroll.js"></script>
<script src="assets/js/jquery.scrollTo.min.js"></script>
<script src="plugins/switchery/switchery.min.js"></script>

<!-- EASY PIE CHART JS -->
<script src="plugins/jquery.easy-pie-chart/dist/easypiechart.min.js"></script>
<script src="plugins/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>
<script src="assets/pages/easy-pie-chart.init.js"></script>

<!-- KNOB JS -->
<!--[if IE]>
<script type="text/javascript" src="plugins/jquery-knob/excanvas.js"></script>
<![endif]-->
<script src="plugins/jquery-knob/jquery.knob.js"></script>

<!-- Circliful -->
<script src="plugins/jquery-circliful/js/jquery.circliful.min.js"></script>

<script src="assets/js/jquery.core.js"></script>
<script src="assets/js/jquery.app.js"></script>
<script src="style/js/echart3/echarts.min.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>巡更系统</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/css/main.css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/choose.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/date.js"></script>
    <script type="text/javascript">
        
        function refData() {
            
        }

        function refXunGeng() {
            $.ajax({
                type: 'POST',
                url: '/toXgsj',
                success: function(data){
                    $("#time001").html(data.replace(",","-"));
                },
                error:function () {
                    alert("获取时间段失败");
                }
            });

            $.ajax({
                type: 'POST',
                url: '/toXGaddr',
                success: function(data){
                    var json =  eval(data);

                    $.each(json,function(index,entry){
                        debugger;
                        var addrID = entry["addrID"];
                        var addrName = entry["addrName"];
                        var logDate = entry["logDate"];
                        var lineID =  entry["lineID"]
                        if(lineID == "0"){
                            $("#xga"+addrID).html(addrName);
                            $("#xga"+addrID).removeClass("whites");
                            $("#xga"+addrID).addClass("reds");

                            $("#xgp"+addrID).removeClass("nobgwhite");
                            $("#xgp"+addrID).addClass("nobgred");
                        }else{
                            $("#xga"+addrID).html("巡更正常");
                            $("#xga"+addrID).addClass("greens");
                            $("#xgp"+addrID).addClass("nobggreen");
                        }
                    })
                }
            });
        }
     </script>

</head>
<body class="body01">
<!-----head 开始------>
<jsp:include page="head.jsp"/>
<div class="main">
    <!-----导航 开始------>
    <div class="nav" style="margin-top:30px;">
        <ul>
            <li class="nico01"><a href="###" onclick="choose(1)">首页</a></li>
            <li class="nico02"><a href="###" onclick="choose(2)">警力分布</a></li>
            <li class="nico03"><a href="###" onclick="choose(3)">点名系统</a></li>
            <li class="nico04on" onclick="choose(4)">巡更系统</li>
            <li class="nico05"><a href="###" onclick="choose(6)">数据汇总</a></li>
        </ul>
    </div>
    <!-----导航 结束------>
    <div class="xgwrap" style="margin-left: 160px;" >
        <div class="h10"></div>
        <div class="itemwrap11">
            <div class="tborder3"></div>
            <div class="tcont01">巡更总点数<b class="greens">46</b><i>&nbsp;&nbsp;&nbsp;</i>
                巡更时间段<b class="whites"><span id="time001"></span></b>       </div>
            <div class="tborder3"></div>
        </div>

        <div class="xgcont">
            <div class="xgp01 nobgwhite" id="xgp001">1</div>
            <div class="xgp02 nobgwhite" id="xgp002">2</div>
            <div class="xgp03 nobgwhite" id="xgp003">3</div>
            <div class="xgp04 nobgwhite" id="xgp004">4</div>
            <div class="xgp05 nobgwhite" id="xgp005">5</div>
            <div class="xgp06 nobgwhite" id="xgp006">6</div>
            <div class="xgp07 nobgwhite" id="xgp007">7</div>
            <div class="xgp08 nobgwhite" id="xgp008">8</div>
            <div class="xgp09 nobgwhite" id="xgp009">9</div>
            <div class="xgp10 nobgwhite" id="xgp010">10</div>
            <div class="xgp11 nobgwhite" id="xgp011">11</div>
            <div class="xgp12 nobgwhite" id="xgp012">12</div>
            <div class="xgp13 nobgwhite" id="xgp013">13</div>
            <div class="xgp14 nobgwhite" id="xgp014">14</div>
            <div class="xgp15 nobgwhite" id="xgp015">15</div>
            <div class="xgp16 nobgwhite" id="xgp016">16</div>
            <div class="xgp17 nobgwhite" id="xgp017">17</div>
            <div class="xgp18 nobgwhite" id="xgp018">18</div>
            <div class="xgp19 nobgwhite" id="xgp019">19</div>
            <div class="xgp20 nobgwhite" id="xgp020">20</div>
            <div class="xgp21 nobgwhite" id="xgp021">21</div>
            <div class="xgp22 nobgwhite" id="xgp022">22</div>
            <div class="xgp23 nobgwhite" id="xgp023">23</div>
            <div class="xgp24 nobgwhite" id="xgp024">24</div>
            <div class="xgp25 nobgwhite" id="xgp025">25</div>
            <div class="xgp26 nobgwhite" id="xgp026">26</div>
            <div class="xgp27 nobgwhite" id="xgp027">27</div>
            <div class="xgp28 nobgwhite" id="xgp028">28</div>
            <div class="xgp29 nobgwhite" id="xgp029">29</div>
            <div class="xgp30 nobgwhite" id="xgp030">30</div>
            <div class="xgp31 nobgwhite" id="xgp031">31</div>
            <div class="xgp32 nobgwhite" id="xgp032">32</div>
            <div class="xgp33 nobgwhite" id="xgp033">33</div>
            <div class="xgp34 nobgwhite" id="xgp034">34</div>
            <div class="xgp35 nobgwhite" id="xgp035">35</div>
            <div class="xgp36 nobgwhite" id="xgp036">36</div>
            <div class="xgp37 nobgwhite" id="xgp037">37</div>
            <div class="xgp38 nobgwhite" id="xgp038">38</div>
            <div class="xgp39 nobgwhite" id="xgp039">39</div>
            <div class="xgp40 nobgwhite" id="xgp040">40</div>
            <div class="xgp41 nobgwhite" id="xgp041">41</div>
            <div class="xgp42 nobgwhite" id="xgp042">42</div>
            <div class="xgp43 nobgwhite" id="xgp043">43</div>
            <div class="xgp44 nobgwhite" id="xgp044">44</div>
            <div class="xgp45 nobgwhite" id="xgp045">45</div>
            <div class="xgp46 nobgwhite" id="xgp046">46</div>

            <div class="bf xgal01">
                <div class="box02top"></div>
                <div class="box02mid" id="xga001">
                    <p class="whites" >此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>

            <div class="bf xgal02">
                <div class="box02top"></div>
                <div class="box02mid" id="xga002" >
                    <p class="whites" >此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal03">
                <div class="box02top"></div>
                <div class="box02mid" id="xga003">
                    <p class="whites"  >此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal04">
                <div class="box02top"></div>
                <div class="box02mid" id="xga004">
                    <p class="whites"  >此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal05">
                <div class="box02top"></div>
                <div class="box02mid" id="xga005">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal06">
                <div class="box02top"></div>
                <div class="box02mid" id="xga006">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal07">
                <div class="box02top"></div>
                <div class="box02mid" id="xga007">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal08">
                <div class="box02top"></div>
                <div class="box02mid" id="xga008">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal09">
                <div class="box02top"></div>
                <div class="box02mid" id="xga009">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal10">
                <div class="box02top"></div>
                <div class="box02mid" id="xga010">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal11">
                <div class="box02top"></div>
                <div class="box02mid" id="xga011">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal12">
                <div class="box02top"></div>
                <div class="box02mid" id="xga012">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal13">
                <div class="box02top"></div>
                <div class="box02mid" id="xga013">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal14">
                <div class="box02top"></div>
                <div class="box02mid" id="xga014">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal15">
                <div class="box02top"></div>
                <div class="box02mid" id="xga015">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal16">
                <div class="box02top"></div>
                <div class="box02mid" id="xga016">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal17">
                <div class="box02top"></div>
                <div class="box02mid" id="xga017">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal18">
                <div class="box02top"></div>
                <div class="box02mid" id="xga018">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal19">
                <div class="box02top"></div>
                <div class="box02mid" id="xga019">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal20">
                <div class="box02top"></div>
                <div class="box02mid" id="xga020">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal21">
                <div class="box02top"></div>
                <div class="box02mid" id="xga021">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal22">
                <div class="box02top"></div>
                <div class="box02mid" id="xga022">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal23">
                <div class="box02top"></div>
                <div class="box02mid" id="xga023">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal24">
                <div class="box02top"></div>
                <div class="box02mid" id="xga024">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal25">
                <div class="box02top"></div>
                <div class="box02mid" id="xga025">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal26">
                <div class="box02top"></div>
                <div class="box02mid" id="xga026">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal27">
                <div class="box02top"></div>
                <div class="box02mid" id="xga027">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal28">
                <div class="box02top"></div>
                <div class="box02mid" id="xga028">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal29">
                <div class="box02top"></div>
                <div class="box02mid" id="xga029">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal30">
                <div class="box02top"></div>
                <div class="box02mid" id="xga030">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal31">
                <div class="box02top"></div>
                <div class="box02mid" id="xga031">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal32">
                <div class="box02top"></div>
                <div class="box02mid" id="xga032">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal33">
                <div class="box02top"></div>
                <div class="box02mid" id="xga033">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal34">
                <div class="box02top"></div>
                <div class="box02mid" id="xga034">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal35">
                <div class="box02top"></div>
                <div class="box02mid" id="xga035">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal36">
                <div class="box02top"></div>
                <div class="box02mid" id="xga036">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal37">
                <div class="box02top"></div>
                <div class="box02mid" >
                    <p class="whites" id="xga037">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal38">
                <div class="box02top"></div>
                <div class="box02mid" >
                    <p class="whites" id="xga038">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal39">
                <div class="box02top"></div>
                <div class="box02mid" >
                    <p class="whites" id="xga039">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal40">
                <div class="box02top"></div>
                <div class="box02mid" >
                    <p class="whites" id="xga040">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal41">
                <div class="box02top"></div>
                <div class="box02mid" >
                    <p class="whites" id="xga041">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal42">
                <div class="box02top"></div>
                <div class="box02mid" id="xga042">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal43">
                <div class="box02top"></div>
                <div class="box02mid" id="xga043">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal44">
                <div class="box02top"></div>
                <div class="box02mid" id="xga044">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal45">
                <div class="box02top"></div>
                <div class="box02mid" id="xga045">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
            <div class="bf xgal46">
                <div class="box02top"></div>
                <div class="box02mid" id="xga046">
                    <p class="whites">此巡更点无巡更数据</p>
                </div>
                <div class="box02bot"></div>
                <div class="co01"></div>
            </div>
        </div>
    </div>
</div>
<!-----主体 结束------>
<div class="ttime"><p class="ttime01" id="sfm"></p><p class="ttime02" id="nyr"></p><p id="nongli"></p></div>
</body>
</html>

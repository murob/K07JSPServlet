<%@page import="homework.MembershipDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="homework.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
        *{margin:0px auto; font-family: 'Noto Sans KR', sans-serif;}
        .AllWrap{padding:50px;}
        .wrap_regiform{border: 1px solid red; width: 720px; padding:5px 10px;}
        .wrap_regiform>p{text-align: right;}
        .wrap_regiform table{border-top: 2px solid #000000; border-left:1px solid silver; border-right:1px solid silver; border-bottom:1px solid silver; width:100%;}
        .wrap_regiform tr td:nth-child(1){border: 0px solid blue; font-weight: bold; font-size: 0.9em; padding:5px 0 5px 40px;}
        .wrap_regiform tr td:nth-child(1) span.red{color:red;}
        .wrap_regiform tr td:nth-child(2){border: 0px solid blue; font-size: 0.8em; padding:5px 0 5px 5px;}
        .wrap_regiform tr td:nth-child(2) .comment{ color: #777777;}
        .wrap_regiform tr td:nth-child(2) img.pick{ position: relative; top:11px; left:-4px; margin-top:-5px; width:33px;}
        .wrap_regiform tr td:nth-child(2) button{background-color: #333333; color:#ffffff; font-size: 1em; padding:5px; width:100px; border:2px solid #333333;}
        .wrap_regiform tr td:nth-child(2) button:hover{background-color: #727272; cursor:pointer;}
        .wrap_regiform tr td:nth-child(2) label{position: relative; height:20px; top:-2px; left:10px;}
        .wrap_regiform td input{padding:6px; border: 1px solid #cccccc;}
        .wrap_regiform td select{padding:5px; border: 1px solid #cccccc;}
        .w01{width:320px;}
        .w02{width:200px;}
        .w03{width:100px;}
        .w04{width:230px;}
        .w05{width:150px;}
        .w06{width:80px;}
        .s01{width:140px;}
        .s02{width:70px;}
    </style>
   
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
    $( function() {
        //???????????? ?????????????????? ???????????? jQuery UI
        $("input[type=radio]").checkboxradio({
            icon: false
        });

        //??????????????? ???????????? - Date Picker
        $("#birthday").datepicker({
            dateFormat : "yy-mm-dd"
        });    
    } );

    
    //????????? ????????? ?????? ????????????
    var idObj;
    var idFlag;
    /*
    ???????????? ?????? ????????? ??????????????? ??? ????????? ??? ??? ?????? ?????? ?????????
    ?????? ???????????? ???????????? ?????? ???????????? ????????? html?????? ????????? ???????????? ????????????
    html????????? ????????? ?????? ?????? ??????????????? ???????????? ?????? ??????????????? ????????? ????????? ??? ????????????
    ?????? ???????????? ?????? ???????????????.
    ????????? ?????? ????????? ????????? ????????? user_id??? html ???????????? ????????? ??? ??????????????? ?????? 
    ???????????? ????????? ????????? ??? ????????? ???????????? ??????. 
    */
    window.onload = function(){
        idObj = document.loginFrm.user_id;//????????? ??????
    }
	function idCheck(fn){//??????????????? ???????????? ????????? ????????? ???????????? ?????????
		/*
		????????? ?????? ?????? ??????(???????????? ??????, ????????????, ?????? ??? ?????? ??????)
		????????? ????????? ?????? ????????? ?????? ???????????? ????????? ???????????? ?????? ????????? ?????? ????????? false?????? ??????
		?????? ????????? ????????? ??? ?????? ????????? ?????? ?????? ?????? false?????? ???????????? idObj??? ??????????????? ?????????
		????????? ??????????????? ???????????? ????????????.
		*/
		if(!idCapsule()){
			console.log(idCapsule());
            idObj.value="";
            idObj.focus();
            return;
        }
        if(fn.user_id.value==""){//?????? ????????? ???????????? ????????? ?????? ??????
            alert("???????????? ????????? ??????????????? ????????????.");
            fn.user_id.focus();		
        }	
        else{//????????? ????????? ????????? ????????? ?????? readOnly???????????? ???????????? ???????????? ????????????.
            fn.user_id.readOnly = true;
            window.open("./pages/id_overapping.jsp?user_id="+fn.user_id.value,
                    "idover", "width=300,height=200");
        }
    }
    function loginValdidate(fn){        
        //??????????????????
        if(fn.user_id.value==""){
            alert("???????????? ??????????????????");
			fn.user_id.readOnly = false;
			fn.user_id.focus();return false;
        } 
        if(!idCapsule()){
            idObj.value="";
            idObj.focus();
            return false;
        }
        var p1 = fn.pass1;
        var p2 = fn.pass2;
        if(p1.value==""){alert("??????????????? ??????????????????");p1.focus();return false;}
	    if(p2.value==""){alert("????????????????????? ??????????????????");p2.focus();return false;}
        if(isPassword(p1.value)==false){
            alert('??????????????? ????????? ??????????????? ???????????? ?????????????????????.');
			p1.value="";p2.value="";p1.focus();
            return false;
        }
        if(p1.value!=p2.value){
            alert("??????????????? ????????????. ?????? ??????????????????");
            p1.value="";p2.value="";p1.focus();
            return false;
        }        
        if(fn.name.value==""){
            alert("????????? ??????????????????");fn.name.focus();return false;
        } 
        return true;
    }
    function isPassword(param){
        //????????? ??????????????? ???????????? true??? ????????????.
        var isNum = false, isSpec = false;
        //????????? ?????????????????? ??????
        for(var i=0 ; i<param.length ; i++){
            if(param[i].charCodeAt(0)>=48 && param[i].charCodeAt(0)<=57){
                isNum = true;
                console.log("???????????????");
                break;
            }
        }
        for(var i=0 ; i<param.length ; i++){
            if((param[i].charCodeAt(0)>=33 && param[i].charCodeAt(0)<=47)
                || (param[i].charCodeAt(0)>=58 && param[i].charCodeAt(0)<=64)
                || (param[i].charCodeAt(0)>=91 && param[i].charCodeAt(0)<=96)){
                isSpec = true;
                console.log("?????????????????????");
                break;
            }
        }
        if(isNum==true && isSpec==true)
            return true;
        else
            return false;
    }
    //???????????? 3~15??? ????????? ????????? false??? ????????????.
    var idLength = function(param){	
        if(!(param.value.length>=3 && param.value.length<=15)){		
            return false;
        }
        return true;
    }
    //?????????????????? ???????????? ???????????? : ???????????? true??? ????????????.
    function isNumber(param){		
        for(var i=0 ; i<param.length ; i++){
            if(!(param[i].charCodeAt(0)>=48 && param[i].charCodeAt(0)<=57)){
                return false;
            }		
        }
        return true;
    }
    //???????????? ???????????? ????????? ???????????? ??????
    var idStartAlpha = function(param){	
        if(isNumber(param.value.substring(0,1))==true){	
            return false;
        }
        return true;
    }
    //?????????????????? ?????? or ??????????????? ??????. ????????? false??????
    function isAlphaNumber(param){
        for(var i=0 ; i<param.value.length ; i++){			
            if(!((param.value[i].charCodeAt(0)>=97 && param.value[i].charCodeAt(0)<=122) 
                    || (param.value[i].charCodeAt(0)>=65 && param.value[i].charCodeAt(0)<=90)
                    || (param.value[i].charCodeAt(0)>=48 && param.value[i].charCodeAt(0)<=57))){
                return false;	
            }
        }
        return true;
    }
    //??????????????? ????????? ????????? ?????????.
    function idCapsule(){
        //1.???????????? 8~12??? ???????????? ??????. ??? 7?????? ????????? 13?????? ?????? ????????? ???????????? ???????????? ???????????? ????????????.
        if(!idLength(idObj)){
            alert('???????????? 3~15?????? ???????????????.');
            return false;
        }        
        //2.???????????? ????????? ???????????? ???????????? ??????. ?????? ????????? ???????????? ????????? ???????????? ????????????.
        if(!idStartAlpha(idObj)){
            alert("???????????? ????????? ???????????? ????????????.");
            return false;
        }	
        //3.????????? ????????? ??????????????? ???????????? ??????. ??????????????? ??????????????? ????????? ????????? ?????? ????????? ???????????? ????????????.
        if(!isAlphaNumber(idObj)){
            alert("???????????? ????????? ????????? ???????????? ????????????.");
            return false;
        }        
        return true;
    }
	function inputEmail(frm){		
		if (frm.email_domain.value=='1') {
            /*
            select?????? ??????????????? ????????????
            readonly????????? ??????????????????, ????????? ????????? ????????????. 
            */
			frm.email2.readOnly = false;
			frm.email2.value = '';
			frm.email2.focus();
		}
		else {
            /*
            ?????? ???????????? ????????????
            ????????? ???????????? ????????????, readonly????????? ???????????????.
            */
			frm.email2.readOnly = true;
			frm.email2.value = frm.email_domain.value;
		}
	}
	function commonFocusMove(obj, mLength, next_obj){        
        var strLength = obj.value.length;        
        if(strLength>=mLength){
            eval("document.loginFrm."+next_obj+".focus()");
        }        
    } 
    </script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function zipcodeFind(){
        new daum.Postcode({
            oncomplete: function(data) {
                //DAUM ????????????API??? ??????????????? ?????? ????????? ??????
                console.log("zonecode", data.zonecode);
                console.log("address", data.address);
                //?????? ???????????? ??????
                var f = document.loginFrm;//<form>????????? DOM????????? ????????? ??????
                f.zipcode.value = data.zonecode;
                f.address1.value = data.address;
                f.address2.focus();
            }
        }).open();
    }
    </script>
</head>
<body>
<form action="registProcess.jsp" method="post" name="loginFrm" onsubmit="return loginValdidate(this)">
<div class="AllWrap">
    <div class="wrap_regiform">
        <p>*??????????????????</p>
        <table class="regi_table">
            <colgroup>
                <col width="180px">
                <col width="*">
            </colgroup>
            <tr>
                <td><span class="red">*</span> ?????????</td>
                <td>
                    <input type="text" class="w01" name="user_id" value="" />       
                    <button type="button" onclick="idCheck(this.form);">????????????</button>             
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <span class="comment">??? 3~15?????? ????????? ????????? ???????????????.</span>                
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> ????????????</td>
                <td>
                    <input type="text" class="w01" name="pass1" value="asdasd123!@" />                   
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <span class="comment">
                        ??? ??????/??????/???????????? ?????? 6~20??? ?????? ??????????????????. (?????????/???????????? ????????????)<br>
                        ??? 1234** ??????????????? ???????????? ????????? ???????????????.
                    </span>
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> ??????????????????</td>
                <td>
                    <input type="text" class="w01" name="pass2" value="asdasd123!@" />
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> ??????</td>
                <td>
                    <input type="text" class="w01" name="name" value="??????" />
                    
                    <label for="radio-1">???</label>
                    <input type="radio" name="gender" id="radio-1" value="???" checked>
                    <label for="radio-2">???</label>
                    <input type="radio" name="gender" id="radio-2" value="???">
                    
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> ????????????</td>
                <td style="padding: 0px 0 5px 5px;">
                    <input type="text" class="w02" name="birthday" id="birthday" value="1995-07-11" />
                    <img src="./images/pick.jpg" alt="" class="pick" />
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> ??????</td>
                <td>
                    <input type="text" class="w03" name="zipcode" value="06027" />
                    <button type="button" onclick="zipcodeFind();">??????????????????</button> 
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="text" class="w04" name="address1" value="?????? ????????? ???????????? 652" />                
                    <input type="text" class="w04" name="address2" value="???????????????" />
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> ?????????</td>
                <td>
                    <input type="text" class="w05" name="email1" value="asd123" />
                    @
                    <input type="text" class="w05" name="email2" value="naver.com" />
                    <select name="email_domain" class="s01" onchange="inputEmail(this.form);">
                        <option value="1">????????????</option>
                        <option value="naver.com">naver.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="gmail.com">gmail.com</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><span class="red">*</span> ???????????????</td>
                <td>
                    <select name="mobile1" class="s02" onchange="commonFocusMove(this, 3, 'mobile2');">
                        <option value=""></option>
						<option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                    </select>
                    -
                    <input type="text" class="w06" name="mobile2" maxlength="4" 
                        value="" onkeyup="commonFocusMove(this, 4, 'mobile3');" />
                    -
                    <input type="text" class="w06" name="mobile3" maxlength="4" 
                        value="" onkeyup="commonFocusMove(this, 4, 'tel1');" />
                </td>
            </tr>
            <tr>
                <td>????????????</td>
                <td>
                    <select name="tel1" class="s02" onchange="commonFocusMove(this, 3, 'tel2');">
                        <option value=""></option>
						<option value="02">02</option>                        
                        <option value="031">031</option>
						<option value="032">032</option>
						<option value="033">033</option>
                    </select>
                    -
                    <input type="text" class="w06" name="tel2" maxlength="4" value="" onkeyup="commonFocusMove(this, 4, 'tel3');" />
                    -
                    <input type="text" class="w06" name="tel3" maxlength="4" value="" />
                </td>
            </tr>
        </table>
        <div style="text-align: center; margin-top:10px;">
            <input type="submit" value="??????????????????">
            <input type="reset" value="??????????????????">
        </div>
    </div>
</div>
</form>
</body>
</html>
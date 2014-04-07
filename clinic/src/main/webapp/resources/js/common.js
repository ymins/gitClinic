/************************************
	2011-08-22 
	format으로 값 넣어주기 (js의 html코드 줄이기)
*************************************/
String.prototype.format = function() {
	if ( arguments.length < 1) {
		return this;
	}
	var text = this;
	for( var idx = 0; idx < arguments.length; idx++ ) {
		text = text.replace( new RegExp( "%s" ), arguments[ idx ] );
	}
	return text;
};

/************************************?
2011-11-08 3자리 문자찍기 
*************************************/
var comma = function(val){
	var	mark = ',';
	var num = val.toString();
	var len = num.length;
	var cnt = parseInt((len + 2)/3);
	var result = '';
	for(var i = 0; i < cnt; i++){
	    var start = parseInt(len) - (i + 1) * 3; 
	    var end = len - i * 3;
	    var str = num.substring(start, end);
	    result = str + result;
	    if(i != (cnt - 1))
	        result = mark + result;
	}
	return result;
};

var initJqgrid = function () {
	
};

var commonUtil= {
	/************************************************
		2011-08-22  
		공백자르기
	*************************************************/
	trim : function (val) {
	    if(val == null) {return null;}
	    return val.replace(/^\s*/, "").replace(/\s*$/, "").replace("	", "");
	},

	/************************************************
		2011-08-22 
		오늘날짜 가져오기
	*************************************************/
	getToday : function(){
		var today = new Date();
	
	    var y = today.getFullYear();
	    var mo = today.getMonth()+1;
	    var d = today.getDate();
	    var h = today.getHours();
	    var m = today.getMinutes();
	    var s = today.getSeconds();
	    
	    m = checkTime(m);
	    s = checkTime(s);
	},
	//10 미만의 숫자 앞에 0 찍어주기
	checkTime : function (d) {
	    if (d < 10) {
	        d = "0" + d;
	    }
	    return d;
	},
	
	/************************************************
	2011-10-05 
	날짜 시간 자르기
	*************************************************/
	cutTime : function (regDate) {
		var date = regDate.split(" ");
		var cutDate = "";
		if (regDate != "null") {
			cutDate = date[0];
		} else {
			cutDate = "-";
		}

	    return cutDate;
	},
		
	/************************************************
	2011-08-22 
	validation Check
	*************************************************/
	
	//obj는 문자, type은 해당항목(ex: id,pass..)
	onlyChar : function(obj,type,text_max) {
	
		if ( type == "notSpecial" ) {
			var ptn =   /[~!@\#$%^&*\()\-=+_'\"]/gi;
			if(obj.value.match(ptn) != null) {
				alert("Special character is not allowed.");
				obj.value = obj.value.replace(ptn,"");
				obj.focus();//
			}
		} else if ( type == "onlyNumber" ) {
			var ptn =  /[^0-9]/g;
			if(obj.value.match(ptn) != null) {
				alert("Numbers can be entered.");
				obj.value = obj.value.replace(ptn,"");
				obj.focus();//
			}
		} else if ( type == "notKorean" ) {
			var ptn = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/;
			if(obj.value.match(ptn) != null) {
				alert("Korean is not allowed.");
				obj.value = obj.value.replace(ptn,"");
				obj.focus();//
			}
		} else if (type == "limitMng") {
			var ptn = /[~!@\#$%^&*\()<>\-=+_'\"]/gi;
			if(obj.value.match(ptn) != null) {
				alert("Special character is not allowed.");
				obj.value = obj.value.replace(ptn,"");
				obj.focus();//
			}
		} else if (type == "address") {
			var ptn = /[`,.\/~!\\$%^&*\()<>\=+_'\"\|]/g;
			if(obj.value.match(ptn) != null) {
				alert("The special character is not allowed except \"@, #, -\".");
				obj.value = obj.value.replace(ptn,"");
				obj.focus();
			}
		}
		var ls_str = obj.value; 
		var li_str_len = ls_str.length; //전체길이
		
		//변수초기화
		var li_max = text_max; //제한할 글자수 크기
		var i = 0;
		var li_byte = 0;   //한글일경우 2, 그외글자는 1을 더함
		var li_len = 0;    // substring하기 위해 사용
		var ls_one_char = "";  //한글자씩 검사
		var ls_str2 = "";      //글자수를 초과하면 제한한 글자전까지만 보여줌.
		  
		for(i=0; i< li_str_len; i++) {
			ls_one_char = ls_str.charAt(i);   //한글자 추출
			
			if(escape(ls_one_char).length > 4){ 
				li_byte +=3;   //한글이면 2를 더한다
			} else {
				li_byte++;     //한글아니면 1을 다한다
			}
		      
			if(li_byte <= li_max){
				li_len = i + 1;
			}
		}
		
		if(li_byte > li_max) {
			ls_str2 = ls_str.substr(0, li_len);
			obj.value = ls_str2;
			alert(li_max + "Byte is over to input.");
		}
	   return false;
	},
	
	getNowScroll : function(){

		var de = document.documentElement;
		var b = document.body;
		var now = {};

		now.X = document.all ? (!de.scrollLeft ? b.scrollLeft : de.scrollLeft) : (window.pageXOffset ? window.pageXOffset : window.scrollX);
		now.Y = document.all ? (!de.scrollTop ? b.scrollTop : de.scrollTop) : (window.pageYOffset ? window.pageYOffset : window.scrollY);
		
		return now;


	},


	/************************************************
	2011-09-04
	ajax call 함수(공통으로 사용)
	*************************************************/
	// 서비스 호출
	call : function(url, data){
		var result;
		var option = {
				url: url,
				cache : false,
				async : false,
				contentType :"application/x-www-form-urlencoded;charset=utf-8",
		        success: function(resultData) {
					result = resultData;
					if (result.errorCode == "UC-0001") {
						alert("Not fount login information. Again login.");
						//window.location.href="/scloud-portal/account/loginForm.cloud";
						window.location.href = CONTEXT_PATH + "/account/loginForm.cloud";
						return false;
					} else if (result.errorCode == "UC-9000") {
						alert("Server error is occured.");
						return false;
					}
		        },
		        error : function(e,status, error) {
		           alert(error);
		           return;
		        },
		        data : (data?data:""),
		        dataType: "json"
			};
		$.ajax(option);
		return result;
	},
	
	
	/************************************************
	2011-09-04
	ajax call 함수(공통으로 사용)
	*************************************************/
	// 서비스 호출
	callPost : function(url, data){
		var result;
		var option = {
				url: url,
				type : "POST",
				cache : false,
				async : false,
				contentType :"application/x-www-form-urlencoded;charset=utf-8",
		        success: function(resultData) {
					result = resultData;
					if (result.errorCode == "UC-0001") {
						alert("Not Fount Login Information.");
						//window.location.href="/scloud-portal/account/loginForm.cloud";
						window.location.href = CONTEXT_PATH + "/account/loginForm.cloud";
						
						return false;
					} else if (result.errorCode == "UC-9000") {
						alert("Server error is occured.");
					}
		        },
		        error : function(e,status, error) {
		           alert(error);
		           return;
		        },
		        data : (data?data:""),
		        dataType: "json"
			};
		$.ajax(option);
		
		return result;
	},
	/************************************************
	2011-09-22
	비밀번호 문자 연속성 체크
	*************************************************/
	chkPw : function(paramObj){
		var SamePass_0 = 0; //동일문자 카운트
		var SamePass_1_str = 0; //연속성(+) 카운드(문자)
		var SamePass_2_str = 0; //연속성(-) 카운드(문자)
		var SamePass_1_num = 0; //연속성(+) 카운드(숫자)
		var SamePass_2_num = 0; //연속성(-) 카운드(숫자)

		var chr_pass_0;
		var chr_pass_1;
		var chr_pass_2;
		
		for(var i=0; i < paramObj.length; i++) {
			chr_pass_0 = paramObj.charAt(i);
			chr_pass_1 = paramObj.charAt(i+1);

			//동일문자 카운트
			if(chr_pass_0 == chr_pass_1){
				SamePass_0 = SamePass_0 + 1
			}


			chr_pass_2 = paramObj.charAt(i+2);
			
			if(chr_pass_0.charCodeAt(0) >= 48 && chr_pass_0.charCodeAt(0) <= 57) {
				//숫자
				//연속성(+) 카운드
				if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1) {
					SamePass_1_num = SamePass_1_num + 1
				}
				
				//연속성(-) 카운드
				if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1) {
					SamePass_2_num = SamePass_2_num + 1
				}
			} else {
				//문자
				//연속성(+) 카운드
				if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1) {
					SamePass_1_str = SamePass_1_str + 1
				}
				
				//연속성(-) 카운드
				if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1) {
					SamePass_2_str = SamePass_2_str + 1
				}
			}
		}
		
		if(SamePass_0 > 1) {
			commonUtil.props("error.password.secured");
			//commonUtil.cmMessagePopup("Check Password" ,"동일숫자 및 문자를 3번 이상 사용하면 비밀번호가 안전하지 못합니다.(ex : aaa, bbb, 111)");
			return false;
		}

		if(SamePass_1_str > 0 || SamePass_2_str > 0 || SamePass_1_num > 0 || SamePass_2_num > 0) {
			commonUtil.props("error.password.sequential");
			//commonUtil.cmMessagePopup("Check Password" ,"연속된 문자열(123 또는 321, abc, cba 등)을 3자 이상 사용 할 수 없습니다.");
			return false;
		}

		return true;
	},
	
	/************************************************
	2011-10-03
	popup 띄우기
	*************************************************/
	open_info : function (url,x,y) {
		window.open(url
					, 'popup'
					, 'width='+ x +',height='+ y +',scrollbars=no, toolbar=no, location=no, status=no, menubar=no, resizable=no, left=100, top=150, dialog=yes');
		//window.resizeTo(x,y);
	},
	
	/************************************************
	2011-10-03
	popup 한개만 띄우기
	*************************************************/
	open_info_pop : function (url,x,y, child) {
		if(!child || child.closed){
			var childObj = window.open(url
					, 'popup'
					, 'width='+ x +',height='+ y +',scrollbars=no, toolbar=no, location=no, status=no, menubar=no, resizable=0, left=100, top=150');
			//window.resizeTo(x,y);
		}else{
			alert("Already opened infomation popup window. Please close popup window properly and try again.");
			childObj = child;
			childObj.focus();
		}
		
		return childObj;
	},
    /************************************************
	2011-10-07
	알림창 공통 처리(properties)
	*************************************************/
    props : function (key, msg, msg_1) {
    	jQuery.i18n.properties({
    	    name:'message', 
    	    path:'/scloud-mgmt/resources/resourceBundle/', 
    	    mode:'map',
    	    language:'en', 
    	    callback: function() {
    	    	var prop = jQuery.i18n.prop;

    	        alert(prop(key, msg, msg_1));
    	    }
    	});
    },
    /****************************************************
	2011-11-29  
	유효성 체크(notnull_number_alphabet_korean_special[ _-])
	*****************************************************/
	validate: function(id, name, rule, maxbyte) {
		var obj = $("#"+id);
		if(rule.indexOf("notnull") != -1){
			if($.trim(obj.val()) == ""){
				commonUtil.props("error.validation.notnull", name);
				return false;
			}
		}
		
		var reg = "";
		var msg = "";
		if(rule.indexOf("number") != -1){
			reg += "0-9";
			msg += ", number";
		}
		if(rule.indexOf("alphabet") != -1){
			reg += "A-Za-z";
			msg += ", alphabet";
		}
		if(rule.indexOf("korean") != -1){
			reg += "ㄱ-ㅎ가-힣ㅏ-ㅣ";
			msg += ", korean";
		}
		if(rule.indexOf("special") != -1){
			msg += ", special(";
			var chars = rule.substring(rule.indexOf("special[")+8, rule.lastIndexOf("]"));
			var msgChars = "";
			for(var i=0; i < chars.length; i++){
				var char = chars.charAt(i);
				reg += "\\"+char;
				if(char == ' '){
					msgChars += " space";
				}else{
					msgChars += " "+char;
				}				
			}			
			if(msgChars != ""){
				msg += msgChars.substring(1);
			}
			msg += ")";
		}
		
		if(msg != ""){
			msg = msg.substring(1);
		}
		
		if(reg != ""){
			reg = eval("/^["+reg+"]*$/gi");
			if(!reg.test(obj.val())) {
				commonUtil.props("error.validation.validchars", name, msg);
				return false;
			}
		}
		
		if(this.calculateBytes(obj.val()) > maxbyte){
			commonUtil.props("error.validation.maxbyte", name, maxbyte);
			return false;
		}
		
		return true;
	},
    /************************************************
	2011-10-07
	문자열 bytes 계산
	*************************************************/
    calculateBytes : function (str) {
    	var tcount = 0;
    	var tmpStr = new String(str);
    	var temp = tmpStr.length;

    	var onechar;
    	for ( k=0; k<temp; k++ ){
    		onechar = tmpStr.charAt(k);
    		if (escape(onechar).length > 4)
    		{
    			tcount += 3;
    		}else{
    			tcount += 1;
    		}
    	}
    	return tcount;
    },
    encodeHtml: function(S) {
		return S.replace(/\&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/ /g,"&nbsp;");
	},
	 
	decodeHtml: function(S) {
		return S.replace(/&nbsp;/g," ").replace(/\&amp;/g, "&").replace(/\&lt;/g, "<").replace(/\&gt;/g, ">"); 
	},
	
	checkStr : function (strOriginal, strFind, strChange){ 
	    var position, strOri_Length; 
	    position = strOriginal.indexOf(strFind);
	    
	    while (position != -1){ 
	      strOriginal = strOriginal.replace(strFind, strChange); 
	      position    = strOriginal.indexOf(strFind); 
	    }
	  
	    strOri_Length = strOriginal.length; 
	    return strOri_Length; 
	}
};


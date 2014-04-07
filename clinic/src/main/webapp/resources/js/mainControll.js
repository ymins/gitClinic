var toggle_1 = "1";
var toggle_2 = "1";
var toggle_3 = "1";
var toggle_4 = "1";
var toggle_5 = "1";

var map={"CLINIC1":false, "CLINIC2":false, "CLINIC3":false, "CLINIC4":false, "CLINIC5":false, "CLINIC6":false};

function leftMenuOnOff() {
	$("#CLINIC1").unbind("click").bind("click", function () {
		if(toggle_1 == "1") {
			$("#SUB_MEM_1").hide();
			$("#TOGGLE1").removeClass().addClass('ui-icon').addClass('ui-icon-triangle-1-e');
			toggle_1 = "0";
		} else {
			$("#SUB_MEM_1").show();
			$("#TOGGLE1").removeClass().addClass('ui-icon').addClass('ui-icon-triangle-1-s');
			toggle_1 = "1";
		}
		/* 메뉴 확정 후 수정예정 (slide 기능)
			slide_menu ('CLINIC1', 'C_MENU');
		*/
	});
	$("#CLINIC2").unbind("click").bind("click", function () {
		if(toggle_2 == "1") {
			$("#SUB_MEM_2").hide();
			$("#TOGGLE2").removeClass().addClass('ui-icon').addClass('ui-icon-triangle-1-e');
			toggle_2 = "0";
		} else {
			$("#SUB_MEM_2").show();
			$("#TOGGLE2").removeClass().addClass('ui-icon').addClass('ui-icon-triangle-1-s');
			toggle_2 = "1";
		}
	});
	$("#CLINIC3").unbind("click").bind("click", function () {
		if(toggle_3 == "1") {
			$("#SUB_MEM_3").hide();
			$("#TOGGLE3").removeClass().addClass('ui-icon').addClass('ui-icon-triangle-1-e');
			toggle_3 = "0";
		} else {
			$("#SUB_MEM_3").show();
			$("#TOGGLE3").removeClass().addClass('ui-icon').addClass('ui-icon-triangle-1-s');
			toggle_3 = "1";
		}
	});
	$("#CLINIC4").unbind("click").bind("click", function () {
		if(toggle_4 == "1") {
			$("#SUB_MEM_4").hide();
			$("#TOGGLE4").removeClass().addClass('ui-icon').addClass('ui-icon-triangle-1-e');
			toggle_4 = "0";
		} else {
			$("#SUB_MEM_4").show();
			$("#TOGGLE4").removeClass().addClass('ui-icon').addClass('ui-icon-triangle-1-s');
			toggle_4 = "1";
		}
	});
	$("#CLINIC5").unbind("click").bind("click", function () {
		if(toggle_5 == "1") {
			$("#SUB_MEM_5").hide();
			$("#TOGGLE5").removeClass().addClass('ui-icon').addClass('ui-icon-triangle-1-e');
			toggle_5 = "0";
		} else {
			$("#SUB_MEM_5").show();
			$("#TOGGLE5").removeClass().addClass('ui-icon').addClass('ui-icon-triangle-1-s');
			toggle_5 = "1";
		}
	});
}; 
/*
function slide_menu (title_nm, menu_nm) {
	if(map[title_nm] == false) {
	 	$("#"+menu_nm).show("blind", { direction: "vertical" }, 500);
	 	$("#"+title_nm+" > a > span").removeClass().addClass("icon icon_arrow_open spread_btn");
	 	$("#"+title_nm).removeClass().addClass("lnb_menu current lineB");
	 	map[title_nm] = true;
	} else {
	    $("#"+menu_nm).hide("blind", { direction: "vertical" }, 500);
	    $("#"+title_nm+" > a > div").removeClass().addClass("icon icon_arrow_close spread_btn");
	    $("#"+title_nm).removeClass("current").addClass("borderB_0");
	    map[title_nm] = false;
	}
}
*/

function menuOnclick (main, sub) {
	window.location.href= main+"/"+sub+".do";
}

$(document).ready(function() {
	leftMenuOnOff();
	
	/*선택된 메뉴 표시처리*/
	$("#CLINIC1 > a").css('font-color','#FFF');
});

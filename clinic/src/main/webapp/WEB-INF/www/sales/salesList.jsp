<%@ page language="java" contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <!-- 타일즈태그삽입 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/WEB-INF/layouts/include.jsp"%>
<script type="text/javascript">
var Clinic = {
		page:1,
		rows:20,
		searchType:"",
		searchText:"",
		param : "",
		orderType:"",
		orderNm:"",
		getParam : function (){
			param = "page:" + Clinic.page;
			param += ",rows:" + Clinic.rows;
			param += ",searchType:" + Clinic.searchType;
			param += ",searchText:" + Clinic.searchText;
		},
		load_clinic : function (){
		    $.ajax({
				url : "/clinic/selClinicList.do",
				success : function(data){
					$("#selClinic").find("option").remove();
					$("#selClinic").append( "<option value=''>::지역::</option>" );
					var items = data.lstSelClinic;
					Clinic.clinic_list(items);
				}
			});
		},

		clinic_list : function(items) {
			for (var i = 0; i < items.length ; i++) {
				$("#selClinic").append( "<option value='" + items[i].selClinicCode +"'>" + items[i].selClinicNm + "</option>" );
			}
		}
};
$(document).ready(function () { 
	Clinic.load_clinic();
	
	$('#FROM_DATE').datepicker({
        dateFormat: 'yy-mm-dd',
        onSelect: function (dateText, inst) {
            var sEndDate = jQuery.trim($('#TO_DATE').val());
            if (sEndDate.length>0) {
                var iEndDate   = parseInt(sEndDate.replace(/-/g, ''));
                var iStartDate = parseInt(jQuery.trim(dateText).replace(/-/g, ''));
                
                var MSECONDS = 1000 * 60 * 60 * 24; // m-seconds in a day 
                var from_d = new Date($("#FROM_DATE").datepicker("getDate"));
                var to_d = new Date($("#TO_DATE").datepicker("getDate"));
                var days = Math.ceil(Math.abs(from_d - to_d) / MSECONDS); 
                
                if (iStartDate>iEndDate) {
                	commonUtil.props("project.choose.date");
                    $('#FROM_DATE').val('');
                } else if (days > 30) {
                	commonUtil.props("project.choose.date.max");
                 	$('#FROM_DATE').val('');
            	}
            }
        }
    });

    // 달력 - 종료일
    $('#TO_DATE').datepicker({
    	inline: true,
        dateFormat: 'yy-mm-dd',
        onSelect: function (dateText, inst) {
            var sStartDate = jQuery.trim($('#FROM_DATE').val());
            if (sStartDate.length>0) {
                var iStartDate = parseInt(sStartDate.replace(/-/g, ''));
                var iEndDate  = parseInt(jQuery.trim(dateText).replace(/-/g, ''));
                
                var MSECONDS = 1000 * 60 * 60 * 24; // m-seconds in a day 
                var from_d = new Date($("#FROM_DATE").datepicker("getDate"));
                var to_d = new Date($("#TO_DATE").datepicker("getDate"));
                var days = Math.ceil(Math.abs(from_d - to_d) / MSECONDS); 
                
                if (iStartDate>iEndDate) {
                	commonUtil.props("project.choose.date");
                    $('#TO_DATE').val('');
                } else if (days > 30) {
                	commonUtil.props("project.choose.date.max");
                 	$('#TO_DATE').val('');
            	}
            }
        }
    });

	 $("#clinicGrid").jqGrid({
		url:'../clinic/getClinicListJson.do',
		datatype: 'json',
		mtype: 'GET',
		colNames:['병원명', '지역', '전화번호', '원장명', '실무자명', '그룹'],
		colModel:[
				{name:'clinicNm',		index:'병원명', 	width:100, sorttable:true},
				{name:'clinicArea',	index:'지역', 		width:100, sorttable:true},
				{name:'clinicTel',	index:'전화번호',width:100, sorttable:true},
  			{name:'doctorNm',		index:'원장명', 	width:100, sorttable:true},
		  	{name:'mngNm',			index:'실무자명',width:100, sorttable:true},
		  	{name:'groupDesc',	index:'그룹', 		width:100, sorttable:true}
		 ],
	    rowNum:5,
	    rowList:[5,20,50,100],
	    width:800,
	    height:700,
	    pager: '#clinicPager',
	    sortname: 'clinicNm',
	    sortorder: "desc",
	    viewrecords: true,
	    multiselect:true,
	    loadonce:true,
	    caption:"병원 정보",
	    emptyrecords: "Empty records",
	    loadonce: true,
	    recordtext: 'View(s) {0} - {1} of {2}',
	    loadComplete: function() {},
	    jsonReader : {
	    	root: "rows",
				page: "page",
				total: "total",
				records: "records"
	    }
	});
  $("#clinicGrid").jqGrid('navGrid','#clinicPager', {edit:false,add:false,del:false,search:false},
    {},{},{reloadAfterSubmit:false}
  );
  /*
  $("#clinicGrid").jqGrid('setGridParam',{postData:{param}}).trigger("reloadGrid");
  	postData:{
  		page:Clinic.page,
		  rows:Clinic.rows,
		  searchType:Clinic.searchType,
		  searchText:Clinic.searchText } //이런식으로 코딩해야함.
  */
});

</script>
<body>
	<div id="contentwrap">
		<div id="content">
			<div class="conTitle">
		  	<span class="ui-icon ui-icon-circle-triangle-e"></span>매출정보
		  </div>
			<div>
				<c:if test="${sessionScope.sessionAuth == 'AUTH0001'}">
				<ul class="search_box_ul">
			    <li class="text-type"> 병원선택  :
			    	<select id="selClinic" name="selClinic">
			    	</select>
					</li>
				</ul>
				</c:if>
				<ul class="search_box_ul">
			    <li class="text-type"> 기간선택  :
			    	<input type="text" class="input_txt input_date" id="FROM_DATE"/> ~ 
					  <input type="text" class="input_txt input_date" id="TO_DATE"/>
					</li>
					<li class="text-type">진료유형별 
						<select id="SEARCH_SELECT">
							<option value="">선택</option>
							<option value="">충치치료</option>
			        <option value="">임플란트</option>
						</select> 
					</li>
					<li class="text-type">결제유형별
						<select id="SEARCH_SELECT">
							<option value="">선택</option>
							<option value="">카드</option>
			        <option value="">현금</option>
						</select>           
					</li>
				</ul>
			</div>
			<div id="jqgrid">
				<table id="clinicGrid"></table>
				<div id="clinicPager"></div>
			</div>
			<div id="dialog" title="Feature not supported" style="display:none">
				<p>That feature is not supported.</p>
			</div>
			<div id="dialogSelectRow" title="Warning" style="display:none">
				<p>Please select row</p>
			</div>
		</div>
	</div>
</body>
</html>

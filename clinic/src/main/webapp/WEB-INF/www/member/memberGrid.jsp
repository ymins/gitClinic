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
function simpleSelectBox(data) {
	if(typeof(data)=='string')
	 data = $.parseJSON(data);
	 var rtSlt = '<select name="deptid">';
	 for ( var idx = 0 ; idx < data.length ; idx ++) {
	 rtSlt +='<option value="'+data[idx].value+'">'+data[idx].label+'</option>';
	 }
	 rtSlt +='</select>';
	 return rtSlt;

}

$(document).ready(function () {   
		var selectClinic = $.ajax({
			url:'/clinic/selectClinic.do?component&menuCode=${menuCode}&type=selectClinic', async:false, success:function(data, result) {
				if(!result) alert('병원리스트 불러오기 실패.');
			}
		}).resultText;
	 $("#grid").jqGrid({
		url:'../member/getMemberListJson.do',
		datatype: 'json',
		mtype: 'GET',
		colNames:['병원명', '회원명', '아이디', '직급', '휴대폰', '이메일'],
		colModel:[
				{name:'memCompany',	index:'병원명', 	width:100,	editable:true,	edittype:'select', 
				editoptions:{dataUrl:"/member/selectClinic.do", 
						buildSelect: simpleSelectBox}, hidden:false},
				{name:'memNm',			index:'회원명', 	width:100,	editable:true, 	editrules:{required:true}, editoptions:{size:10}},
				{name:'memId',			index:'아이디',	width:100,	editable:false, editrules:{required:true}, editoptions:{size:10}},
  			{name:'memRank',		index:'직급', 		width:100,	editable:true, 	editrules:{required:true}, editoptions:{size:10}},
		  	{name:'memPhone',		index:'휴대폰', 	width:100,	editable:true, 	editrules:{required:true}, editoptions:{size:10}},
		  	{name:'memEmail',		index:'이메일', 	width:100,	editable:true, 	editrules:{required:true}, editoptions:{size:10}}
		 ],
			postData: {},
	    rowNum:10,
	    rowList:[10,20,30],
	    width:700,
	    //autowidth: true,
	    autoheight: true,
	    rownumbers: true,
	    pager: '#pager',
	    sortname: 'memId',
	    viewrecords: true,
	    multiselect:true,
	    sortorder: "asc",
	    caption:"회원 정보",
	    emptyrecords: "Empty records",
	    loadonce: false,
	    recordtext: 'View(s) {0} - {1} of {2}',
	    loadComplete: function() {},
	    jsonReader : {
	    	root: "rows",
	       page: "page",
	       total: "total",
	       records: "records",
	       repeatitems: false,
	       cell: "cell",
	       id: "memId"
	    }
	});
  $("#grid").jqGrid('navGrid','#pager', {edit:true,add:true,del:true,search:false},
    { sopt:['eq', 'ne', 'lt', 'gt', 'cn', 'bw', 'ew'],
			closeOnEscape: true, 
			multipleSearch: true, 
			closeAfterSearch: true,
			closeAfterAdd: true,
			closeAfterEdit: true
		}
  );
		   
  $("#grid").navButtonAdd('#pager',
    { caption:"Add", 
     	buttonicon:"ui-icon-plus", 
     	onClickButton: addRow,
     	position: "last", 
     	title:"", 
     	cursor: "pointer"
    } 
  );
		   
  $("#grid").navButtonAdd('#pager',
    {  caption:"Edit", 
     buttonicon:"ui-icon-pencil", 
     onClickButton: editRow,
     position: "last", 
     title:"", 
     cursor: "pointer"
    } 
  );
   
  $("#grid").navButtonAdd('#pager',
   {  caption:"Delete", 
    buttonicon:"ui-icon-trash", 
    onClickButton: deleteRow,
    position: "last", 
    title:"", 
    cursor: "pointer"
   } 
  );
 /*
  $("#btnFilter").click(function(){
   $("#grid").jqGrid('searchGrid',
     {multipleSearch: false, 
      sopt:['eq']}
   );
  });
 */
		  
		  
  /**
  $("#next").click(function(event) {
	  //event.preventDefault();


	  //$("#grid").jqgrid('setGridParam',{page:"2"}).trigger("reloadGrid");
	  $("#grid").jqgrid('setGridParam',{url:"boardListJson.do"}).trigger("reloadGrid");

  });
 **/
  // Toolbar Search
  //$("#grid").jqgrid('filterToolbar',{stringResult: true,searchOnEnter : true, defaultSearch:"cn"});
 
});
</script>
		   
<script type="text/javascript">
 
function addRow() {
	// Get the currently selected row
	$("#grid").jqGrid('editGridRow','new',
		{  url: "/member/insertMemberJson.do", 
   	editData: {},
    recreateForm: true,
    beforeShowForm: function(form) {},
    closeAfterAdd: true,
    reloadAfterSubmit:false,
    afterSubmit : function(response, postdata) 
    { 
    	var result = eval('(' + response.responseText + ')');
     	var errors = "";
      
     	if (result.success == false) {
      	for (var i = 0; i < result.message.length; i++) {
       		errors +=  result.message[i] + "";
      	}
      }  else {
      	$("#dialog").text('Entry has been added successfully');
      	$("#dialog").dialog( 
        	{ title: 'Success',
	         	modal: true,
	         	buttons: {"Ok": function()  {
	          $(this).dialog("close");} 
         }
      	});
     	}
      // only used for adding new records
      var new_id = null;
         
			return [result.success, errors, new_id];
		}
	});
}
 
function editRow() {
	// Get the currently selected row
	var row = $("#grid").jqGrid('getGridParam','selrow');
 
 	if( row != null ) 
  	$("#grid").jqGrid('editGridRow',row,
   		{ url: "../mybatis/bbsUpdate.do", 
    	editData: {bbsId:row},
      recreateForm: true,
      beforeShowForm: function(form) {},
    	closeAfterEdit: true,
    	reloadAfterSubmit:false,
    	afterSubmit : function(response, postdata) { 
      	var result = eval('(' + response.responseText + ')');
     		var errors = "";
      
      	if (result.success == false) {
      		for (var i = 0; i < result.message.length; i++) {
       			errors +=  result.message[i] + "";
      		}
       	}  else {
        	$("#dialog").text('Entry has been edited successfully');
      		$("#dialog").dialog({ 
      			title: 'Success',
         		modal: true,
         		buttons: {"Ok": function()  {
          		$(this).dialog("close");} 
         		}
        	});
       	}
            
     return [result.success, errors, null];
    }
	});
 	else $( "#dialogSelectRow" ).dialog();
}
 
function deleteRow() {
	// Get the currently selected row
	var row = $("#grid").jqGrid('getGridParam','selrow');
 
	// A pop-up dialog will appear to confirm the selected action
	if( row != null ) 
  	$("#grid").jqGrid( 'delGridRow', row, { 
  		url: '../mybatis/bbsDelete.do', 
			delData: { bbsId:row },
      recreateForm: true,
     	beforeShowForm: function(form) {
	      //change title
	      $(".delmsg").replaceWith('<span style="white-space: pre;">' +
	        'Delete selected record?' + '</span>');
                  
        //hide arrows
        $('#pData').hide();  
        $('#nData').hide();  
			},
      reloadAfterSubmit:false,
      closeAfterDelete: true,
      afterSubmit : function(response, postdata) { 
      	var result = eval('(' + response.responseText + ')');
       	var errors = "";
        
      	if (result.success == false) {
        	for (var i = 0; i < result.message.length; i++) {
         		errors +=  result.message[i] + "";
        	}
        }  else {
        	$("#dialog").text('Entry has been deleted successfully');
        	$("#dialog").dialog({ 
        		title: 'Success',
           	modal: true,
           	buttons: {"Ok": function()  {
            	$(this).dialog("close");} 
           	}
          });
       	}
        // only used for adding new records
        var new_id = null;
                    
       	return [result.success, errors, new_id];
			}
		});
  else $( "#dialogSelectRow" ).dialog();
};
</script>  
<body>
	<div id="contentwrap">
		<div id="content">
			<div class="conTitle">
		  	<span class="ui-icon ui-icon-circle-triangle-e"></span>회원정보
		  </div>
			<div id="jqgrid">
				<table id="grid"></table>
				<div id="pager"></div>
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

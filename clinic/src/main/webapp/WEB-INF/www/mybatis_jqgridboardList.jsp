<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 
<head>
<link href="<c:url value='/resources/css/custom-theme/jquery-ui-1.9.2.custom.min.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/ui.jqgrid.css' />" rel="stylesheet" type="text/css" />
 
 <script src="<c:url value='/resources/js/jquery/jquery-1.10.1.min.js' />" type="text/javascript" charset="utf-8"></script>
 <script type="text/javascript">
     var jq = jQuery.noConflict();
 </script>
<script src="<c:url value='/resources/js/jquery/jquery-ui-1.9.2.custom.min.js' />" type="text/javascript" charset="utf-8"></script>
<script src="<c:url value='/resources/js/jquery/grid.locale-kr.js' />" type="text/javascript" charset="utf-8"></script>
<script src="<c:url value='/resources/js/jquery/jquery.jqGrid.min.js' />" type="text/javascript" charset="utf-8"></script>
  
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <title>JqGrid - Spring 3 MVC Integration Tutorial</title>
  
</head>
 
<body >
 
<script type="text/javascript">
 $(function() {
  $("#grid").jqGrid({
      url:'../mybatis/boardListJson.do',
   datatype: 'json',
   mtype: 'GET',
      colNames:['bbsId', 'bbsTitle', 'bbsContent', 'bbsFile'],
      colModel:[
       {name:'bbsId',index:'bbsId', width:55,editable:false,editoptions:{readonly:true,size:10},hidden:false},
       {name:'bbsTitle',index:'bbsTitle', width:100,editable:true, editrules:{required:true}, editoptions:{size:10}},
       {name:'bbsContent',index:'bbsContent', width:100,editable:true, editrules:{required:true}, editoptions:{size:10}},
       {name:'bbsFile',index:'bbsFile', width:100,editable:true, editrules:{required:true}, editoptions:{size:10}}
      ],
      postData: { 
   },
      rowNum:10,
      rowList:[10,20,30],
      height: 200,
      autowidth: true,
      //autoheight: true,
      rownumbers: true,
      pager: '#pager',
      sortname: 'bbsId',
      viewrecords: true,
      sortorder: "asc",
      caption:"BBS List",
      emptyrecords: "Empty records",
      loadonce: false,
      recordtext: 'View(s) {0} - {1} of {2}',
      loadComplete: function() {
   },
      jsonReader : {
          root: "rows",
          page: "page",
          total: "total",
          records: "records",
          repeatitems: false,
          cell: "cell",
          id: "bbsId"
      }
  });
  $("#grid").jqGrid('navGrid','#pager',
    {edit:false,add:false,del:false,search:true},
    { },
          { },
          { }, 
    { 
        sopt:['eq', 'ne', 'lt', 'gt', 'cn', 'bw', 'ew'],
           closeOnEscape: true, 
            multipleSearch: true, 
             closeAfterSearch: true }
  );
 
 
   
  $("#grid").navButtonAdd('#pager',
    {  caption:"Add", 
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
 
  $("#btnFilter").click(function(){
   $("#grid").jqGrid('searchGrid',
     {multipleSearch: false, 
      sopt:['eq']}
   );
  });
  
  
  /**
  $("#next").click(function(event) {
	  //event.preventDefault();


	  //$("#grid").jqGrid('setGridParam',{page:"2"}).trigger("reloadGrid");
	  $("#grid").jqGrid('setGridParam',{url:"boardListJson.do"}).trigger("reloadGrid");










  });
 **/
  // Toolbar Search
  //$("#grid").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : true, defaultSearch:"cn"});
 
 });
</script>
   
 
<script type="text/javascript">
 
function addRow() {
 
 // Get the currently selected row
    $("#grid").jqGrid('editGridRow','new',
      {  url: "../mybatis/bbsAdd.do", 
     editData: {
       },
       recreateForm: true,
       beforeShowForm: function(form) {
       },
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
    editData: {
    	bbsId:row
          },
          recreateForm: true,
          beforeShowForm: function(form) {
          },
    closeAfterEdit: true,
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
               $("#dialog").text('Entry has been edited successfully');
      $("#dialog").dialog( 
        { title: 'Success',
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
  $("#grid").jqGrid( 'delGridRow', row,
           { url: '../mybatis/bbsDelete.do', 
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
              afterSubmit : function(response, postdata) 
      { 
                   var result = eval('(' + response.responseText + ')');
       var errors = "";
        
                   if (result.success == false) {
        for (var i = 0; i < result.message.length; i++) {
         errors +=  result.message[i] + "";
        }
                   }  else {
                    $("#dialog").text('Entry has been deleted successfully');
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
  else $( "#dialogSelectRow" ).dialog();
}
 
</script>  
   
<p>JqGrid - Spring MVC mybatis</p>
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
 
</body>
 
</html>


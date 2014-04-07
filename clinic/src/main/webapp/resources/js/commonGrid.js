var CommonGrid = {
/*******************************************************************************
 * 그리드 생성 공통모듈 정의 - 그리드를 구성하는 기본정보를 이용하여 화면을 구성하도록 정의한 공통모듈 작성자 : 박유민 작성일 :
 * 2014.03.24
 ******************************************************************************/
	showGrid : function (gridoption) {
		var grid = $("#" + gridoption.id);
		var pager = "#" + gridoption.pager;
	
		grid.jqGrid({
			url: gridoption.url,
			mtype:'get',
			datatype:'json', // json, local
			serializeGridData : function (jsonData) {  
				postData.formData = gridoption.formData;
		        return JSON.stringify(jsonData);
	
		    },  // 이렇게 데이타를 전달해야, jqgrid에서 자동으로 채워주는 파라미터도 전달된다.
	
		   	colNames:gridoption.colN,
		   	colModel:gridoption.colM,
		   	rowNum:20, // 한 화면에 표시할 row의 갯수
		   	rowList:[20,50,100], // rowNum을 선택할 수 있는 옵션
		   	pager: pager, // 도구 모음이 될 div 태그 지정
		   	viewrecords: true,
		   	sortname:gridoption.sortN, // 기본으로 정렬 시, 정렬 기준이 될 index 명
		    sortorder: "desc",
		    emptyrecords: "조회된 데이타가 없습니다.",
		    loadonce: false,
		    loadui: "enable",
		    width:"auto", // grid 넓이 설정
		   	height:"auto", // grid 높이 설정
		    jsonReader: {
		    	repeatitems:false
		    }
		});
	
		// 페이지 네비게이터  설정
	
		grid.jqGrid(
			'navGrid',
			pager,
			{view:true, //edit:false, add:false, del:false,
				searchtitle:"결과 내 검색", 
				refreshtitle:"조회된 결과 Refresh", refreshstate: "current"}, // optin(추가/수정/삭제/검색/리셋)
			{height:280,reloadAfterSubmit:false}, // edit options
			{closeAfterAdd:true, reloadAfterSubmit:false,closeOnEscape:true}, // add options
			{reloadAfterSubmit:false}, // del options
			{closeOnEscape: true, multipleSearch: true, closeAfterSearch: true} // search options
		);
		// 최초에는 navi의 버튼을 숨김.
		naviButton(grid, false);
	},
	
	naviButton : function (grid, opt) { // 네비게이터 버튼 제어
		var gid = $.jgrid.jqID(grid[0].id);
		if (opt) {
			$('#add_' + gid).show();
			$('#edit_' + gid).show();
			$('#view_' + gid).show();
			$('#del_' + gid).show();
			$('#search_' + gid).show();
			$('#refresh_' + gid).show();
		} else {
			$('#add_' + gid).hide();
			$('#edit_' + gid).hide();
			$('#view_' + gid).hide();
			$('#del_' + gid).hide();
			$('#search_' + gid).hide();
			$('#refresh_' + gid).hide();
		}
	},
	
	refresh : function (grid, formId) {
		grid.clearGridData();
		grid.setGridParam({
			serializeGridData : function (postData) {
				postData.formData = JSON.stringify(form2js(document.getElementById(formId)));; 
		        return JSON.stringify(postData);
		    },
			datatype:'json',
			loadonce:true  // 데이타 로딩 후, jqgrid의 로컬데이타 검색과 헤더 정렬 기능 사용을 위해 true로 설정.
		});
		naviButton(grid, true);// navigator 버튼 표시.
		grid.trigger('reloadGrid');
	}
};

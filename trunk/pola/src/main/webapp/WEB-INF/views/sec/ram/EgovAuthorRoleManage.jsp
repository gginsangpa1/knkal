<%--
  Class Name : EgovAuthorRoleManage.jsp
  Description : EgovAuthorRoleManage 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.02.01    lee.m.j              최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 lee.m.j
    since    : 2009.02.01
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >

<title>권한별 롤 목록</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncCheckAll() {
    var checkField = document.listForm.delYn;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

function fncManageChecked() {

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var checkRegYn = document.listForm.regYn;
    var returnValue = "";
    var returnRegYns = "";
    var checkedCount = 0;
    var returnBoolean = false;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedCount++;
                    checkField[i].value = checkId[i].value;
                
                    if(returnValue == "") {
                        returnValue = checkField[i].value;
                        returnRegYns = checkRegYn[i].value;
                    }
                    else { 
                        returnValue = returnValue + ";" + checkField[i].value;
                        returnRegYns = returnRegYns + ";" + checkRegYn[i].value;
                    }
                }
            }

            if(checkedCount > 0) 
                returnBoolean = true;
            else {
                alert("선택된  롤이 없습니다.");
                returnBoolean = false;
            }
        } else {
             if(document.listForm.delYn.checked == false) {
                alert("선택된 롤이 없습니다.");
                returnBoolean = false;
            }
            else {
                returnValue = checkId.value;
                returnRegYns = checkRegYn.value;

                returnBoolean = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    document.listForm.roleCodes.value = returnValue;
    document.listForm.regYns.value = returnRegYns;

    return returnBoolean;

}

function fncSelectAuthorRoleList() {
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = "1";
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorRoleList.do'/>";
    document.listForm.submit();
}

function fncSelectAuthorList(){
    document.listForm.searchKeyword.value = "";
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorList.do'/>";
    document.listForm.submit();
}

function fncSelectAuthorRole(roleCode) {
    document.listForm.roleCode.value = roleCode;
    document.listForm.action = "<c:url value='/sec/ram/EgovRole.do'/>";
    document.listForm.submit();     
}

function fncAddAuthorRoleInsert() {
    if(fncManageChecked()) {
        if(confirm("등록하시겠습니까?")) {
            document.listForm.action = "<c:url value='/sec/ram/EgovAuthorRoleInsert.do'/>";
            document.listForm.submit();
        }
    } else return;
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorRoleList.do'/>";
    document.listForm.submit();
}


function press() {

    if (event.keyCode==13) {
        fncSelectAuthorRoleList();
    }
}
//-->
</script>

</head>

<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>    
<!-- 전체 레이어 시작 -->
<div id="wrap">
    <!-- header 시작 -->
    <div id="header"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" /></div>
    <div id="topnavi"><c:import url="/sym/mms/EgovMainMenuHead.do" /></div>        
    <!-- //header 끝 --> 
    <!-- container 시작 -->
    <div id="container">
        <!-- 좌측메뉴 시작 -->
        <div id="leftmenu"><c:import url="/sym/mms/EgovMainMenuLeft.do" /></div>
        <!-- //좌측메뉴 끝 -->
            <!-- 현재위치 네비게이션 시작 -->
            <div id="content">
            <form:form name="listForm" action="<c:url value='/sec/ram/EgovAuthorRoleList.do'/>" method="post">
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li>내부시스템관리</li>
                            <li>&gt;</li>
                            <li>사용자권한관리</li>
                            <li>&gt;</li>
                            <li><strong>권한 관리</strong></li>
                        </ul>
                    </div>
                </div>
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">
                    <div id="search_field_loc"><h2><strong>권한 롤 관리</strong></h2></div>
                        
                        <fieldset><legend>조건정보 영역</legend>    
                        <div class="sf_start">
                            <ul id="search_first_ul">
                                <li>
                                    <label for="search_select">권한코드 : </label>
                                    <input name="searchKeyword" type="text" size="30" value="<c:out value='${authorRoleManageVO.searchKeyword}'/>" title="검색"  onkeypress="press();" readonly="readonly" />
                                <li>
                            </ul>
                            <ul id="search_second_ul">
                                <li>
                                    <div class="buttons" style="float:right;">
                                        <a href="#LINK" onclick="javascript:fncSelectAuthorList()" style="selector-dummy:expression(this.hideFocus=false);">권한목록</a>
                                        <a href="#LLINK" onclick="javascript:fncSelectAuthorRoleList()" style="selector-dummy:expression(this.hideFocus=false);">권한별 목록 재조회</a> 
                                        <a href="#LINK" onclick="javascript:fncAddAuthorRoleInsert()" style="selector-dummy:expression(this.hideFocus=false);">등록</a> 
                                    </div>                              
                                </li>
                            </ul>           
                        </div>          
                        </fieldset>
                </div>
                <!-- table add start -->
                <div class="default_tablestyle">
                    <table summary="권한 롤을 관리하는 테이블입니다.롤 ID,롤 명,롤 타입,롤 Sort,롤 설명,등록일자,등록여부의 내용을 담고 있습니다." cellpadding="0" cellspacing="0">
                    <caption></caption>
                    <colgroup>
                    <col width="3%" >
                    <col width="10%" >  
                    <col width="17%" >
                    <col width="10%" >
                    <col width="10%" >
                    <col width="30%" >
                    <col width="12%" >
                    <col width="8%" >
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" class="f_field" nowrap="nowrap"><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="전체선택"></th>
                        <th scope="col" nowrap="nowrap">롤 ID</th>
                        <th scope="col" nowrap="nowrap">롤 명</th>
                        <th scope="col" nowrap="nowrap">롤 타입</th>
                        <th scope="col" nowrap="nowrap">롤 Sort</th>
                        <th scope="col" nowrap="nowrap">롤 설명</th>
                        <th scope="col" nowrap="nowrap">등록일자</th>
                        <th scope="col" nowrap="nowrap">등록여부</th>
                    </tr>
                    </thead>
                    <tbody>                 

                    <c:forEach var="authorRole" items="${authorRoleList}" varStatus="status">
                    <!-- loop 시작 -->                                
                      <tr>
					    <td nowrap="nowrap"><input type="checkbox" name="delYn" class="check2" title="선택"><input type="hidden" name="checkId" value="<c:out value="${authorRole.roleCode}"/>" /></td>
					    <td nowrap="nowrap"><c:out value="${authorRole.roleCode}"/></td>
					    <td nowrap="nowrap"><c:out value="${authorRole.roleNm}"/></td>
					    <td nowrap="nowrap"><c:out value="${authorRole.roleTyp}"/></td>
					    <td nowrap="nowrap"><c:out value="${authorRole.roleSort}"/></td>
					    <td nowrap="nowrap"><c:out value="${authorRole.roleDc}"/></td>
					    <td nowrap="nowrap"><c:out value="${authorRole.creatDt}"/></td>
					    <td nowrap="nowrap">
					        <select name="regYn" title="등록여부">
					            <option value="Y" <c:if test="${authorRole.regYn == 'Y'}">selected</c:if> >등록</option>
					            <option value="N" <c:if test="${authorRole.regYn == 'N'}">selected</c:if> >미등록</option>
					        </select>
					    </td>
                      </tr>
                     </c:forEach>     
                    </tbody>
                    </table>
                </div>

                <!-- 페이지 네비게이션 시작 -->
                <c:if test="${!empty authorRoleManageVO.pageIndex }">
                    <div id="paging_div">
                        <ul class="paging_align">
					        <ui:pagination paginationInfo = "${paginationInfo}"
					            type="image"
					            jsFunction="linkPage"
					            />
                        </ul>
                    </div>                          
                <!-- //페이지 네비게이션 끝 -->  
				    <div align="right">
				        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/>
				    </div>     
                </c:if>
				<input type="hidden" name="roleCodes"/>
				<input type="hidden" name="regYns"/>
				<input type="hidden" name="pageIndex" value="<c:out value='${authorRoleManageVO.pageIndex}'/>"/>
				<input type="hidden" name="authorCode" value="<c:out value="${authorRoleManageVO.searchKeyword}"/>"/>
				<input type="hidden" name="searchCondition"/>
           </form:form>

            </div>
            <!-- //content 끝 -->    
        </div>  
        <!-- //container 끝 -->
        <!-- footer 시작 -->
        <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
        <!-- //footer 끝 -->
    </div>
    <!-- //전체 레이어 끝 -->
 </body>
</html>
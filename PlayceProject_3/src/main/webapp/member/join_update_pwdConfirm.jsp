<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:if test="${type==1 }">
  <c:choose>
	 <c:when test="${bCheck==true }">
	   <c:redirect url="../member/join_update.do"/>
	 </c:when>
	 <c:otherwise>
	   <script>
	     alert("��й�ȣ�� Ʋ���ϴ�!");
	     history.back();
	   </script>
	 </c:otherwise>
  </c:choose>	  
 </c:if>

  <c:if test="${type==2 }">
  <c:choose>
	 <c:when test="${bCheck==true }">
	   <c:redirect url="../member/join_delete.do"/>
	 </c:when>
	 <c:otherwise>
	   <script>
	     alert("��й�ȣ�� Ʋ���ϴ�!");
	     history.back();
	   </script>
	 </c:otherwise>
  </c:choose>	  
 </c:if>
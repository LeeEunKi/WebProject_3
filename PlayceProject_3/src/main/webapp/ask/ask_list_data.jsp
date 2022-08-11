<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="qvo" items="${qList }">
   	<c:choose>
   	<c:when test="${qvo.isReply==1 && qvo.place_img!=null}"> <!-- 답변달린 문의글 -->
   		<div style="margin-top:10px;">
   			<p class="de-qna-name" style="font-weight:bold;">${qvo.member_id }님</p><p class="de-text-date"> ${qvo.dbday }</p>
   			<p class="de-text-desc">${qvo.content }</p>
		</div>
	</c:when>
	<c:when test="${qvo.place_img==null}"> <!-- 답글 -->
		<div style="margin-top:20px;background-color: rgb(231, 234, 238);">
   			<img src="../images/reply.png" style="width:10px;height:10px;">
   			<p class="de-qna-name" style="font-weight:bold;">${qvo.member_id }님</p><p class="de-text-date"> ${qvo.dbday }</p>
   			<p class="de-text-desc" style="margin-left:10px;">${qvo.content }</p>
		</div>
	</c:when>
	<c:when test="${qvo.isReply==0 && qvo.place_img!=null }"> <!-- 답변없는 문의글 -->		    	
   		<div style="margin-top:10px; ">
   			<p class="de-qna-name" style="font-weight:bold;">${qvo.member_id }님</p><p class="de-text-date"> ${qvo.dbday }</p>
   			<p class="de-text-desc">${qvo.content }</p>
   			<div class="col-lg-8" style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
		</div>
   	</c:when>
	</c:choose> 
</c:forEach>

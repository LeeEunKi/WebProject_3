<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="vo" items="${list }">
	    <tr style="vertical-align:middle">
	      <td width="10%" class="text-center">${vo.id }</td>
	      <td width="10%" class="text-center">${vo.name }</td>
	      <td width="10%" class="text-center">${vo.sex }</td>
	      <td width="20%" class="text-center">${vo.email }</td>
	      <td width="30%" class="text-center">${vo.addr1 } &nbsp; ${vo.addr2 }</td>
		  <td width="10%" class="text-center">${vo.tel }</td>
	      <td width="10%" class="text-center"><a href="../admin/join_delete.do?id=${vo.id }" style="color:#2964D9; font-size: 14px;">Ε»Επ</a></td>
	    </tr>
</c:forEach>
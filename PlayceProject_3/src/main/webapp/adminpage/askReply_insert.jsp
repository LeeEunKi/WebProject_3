<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <td class="text-center" style="border-left-width: thick;">상세 내용</td>	      
  <td colspan="2" style="border-left-width: thin;">${askVO.content }</td>
  <td colspan="2">
    <textarea rows="5" cols="60" name="replyContent"></textarea>
  </td>
  <input type="hidden" name="ask_no" value="${askVO.no}">
  <input type="hidden" name="pno" value="${askVO.place_no}"> 
  <input type="hidden" name="member_id" value="${sessionScope.id }">
  <td>
    <button type="submit" class="bt_blue"> 답변 </button>
    <button type="button" class="bt_s_gray" onclick="location.href='../adminpage/askReply_delete.do?ask_no=${askVO.no}'"> 삭제 </button>
  </td>


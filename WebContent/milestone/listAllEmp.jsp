<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.milestone.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    MilestoneService milestoneSvc = new MilestoneService();
    List<MilestoneVO> list = milestoneSvc.getAll();
    pageContext.setAttribute("list",list);

%>

<html>
<head>
<title>�Ҧ����{�O��� - listAllMilestone.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� EL ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ����u��� - listAllMilestone.jsp</h3>
		<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>���{�O�s��</th>
		<th>���{�O�W��</th>
		<th>�ץ�s��</th>
		<th>���{�O���A</th>
		<th>�}�l�ɶ�</th>
		<th>�����ɶ�</th>
		<th>��ڵ����ɶ�</th>
		
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="milestoneVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle'>
			<td>${milestoneVO.milestoneNO}</td>
			<td>${milestoneVO.milestoneName}</td>
			<td>${milestoneVO.csNo}</td>
			<td>${milestoneVO.milestoneState}</td>
			<td>${milestoneVO.mileStartTime}</td>
			<td>${milestoneVO.mileEndTime}</td>
			<td>${milestoneVO.realEndTime}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="empno" value="${milestoneVO.milestoneNO}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="empno" value="${milestoneVO.milestoneNO}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>

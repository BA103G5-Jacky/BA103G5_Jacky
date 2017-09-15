<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.milestone.model.*"%>
<%
MilestoneService milestoneSvc = new MilestoneService();
//MilestoneVO milestoneVO = milestoneSvc.getOneMilestone("MSNO0000016"); //EmpServlet.java(Concroller), 存入req的empVO物件
MilestoneVO milestoneVO = (MilestoneVO)request.getAttribute("milestoneVO");


%>
<html>
<head>
<title>里程碑資料 - listOneEmp.jsp</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>里程碑資料 - ListOneEmp.jsp</h3>
		<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

    <FORM METHOD="post" ACTION="milestone.do" >
        <b>輸入里程碑編號 (如"MSNO0000021"):</b>
        <input type="text" name="milestoneName">
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>

<table border='1' bordercolor='#CCCCFF' width='600'>
	<tr>
		<th>里程碑編號</th>
		<th>里程碑名稱</th>
		<th>案件編號</th>
		<th>里程碑狀態</th>
		<th>開始時間</th>
		<th>結束時間</th>
		<th>實際結束時間</th>
	</tr>
	<tr align='center' valign='middle'>
		<td><%=milestoneVO.getMilestoneNO()%></td>
		<td><%=milestoneVO.getMilestoneName()%></td>
		<td><%=milestoneVO.getCsNo()%></td>
		<td><%=milestoneVO.getMilestoneState()%></td>
		<td><%=milestoneVO.getMileStartTime()%></td>
		<td><%=milestoneVO.getMileEndTime()%></td>
		<td><%=milestoneVO.getRealEndTime()%></td>
		
	</tr>
	<tr><td td colspan= "7">EL取直方法</td></tr>
	<tr align='center' valign='middle'>
		<td>${milestoneVO.milestoneNO}</td>
		<td>${milestoneVO.milestoneName}</td>
		<td>${milestoneVO.csNo}</td>
		<td>${milestoneVO.milestoneState}</td>
		<td>${milestoneVO.mileStartTime}</td>
		<td>${milestoneVO.mileEndTime}</td>
		<td>${milestoneVO.realEndTime}</td>
	</tr>
</table>

</body>
</html>

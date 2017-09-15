package com.milestone.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.milestone.model.MilestoneService;
import com.milestone.model.MilestoneVO;

import com.cs.model.CaseVO;

public class MilestoneServlet extends HttpServlet{

	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getCase_milestone".equals(action)) { // 來自select_page.jsp的請求

		

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("csNo");
				System.out.println(str);
				
				/***************************2.開始查詢資料*****************************************/
				MilestoneService empSvc = new MilestoneService();
				List<MilestoneVO> list = empSvc.getMileStoneByCs(str);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("mileStoneList", list); // 資料庫取出的empVO物件,存入req
				String url = "/milestone/milestone.jsp"; //
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				
				RequestDispatcher failureView = req.getRequestDispatcher("/milestone/milestone.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("agree-milestone".equals(action)){ //來自milestone.jsp的請求
			
			/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			String str1 = req.getParameter("milestoneState");
			String str2 = req.getParameter("milestoneNo");
			System.out.println("str1:"+str1);
			System.out.println("str2:"+str2);
			
			String milestoneState = null;
			String milestoneNo = null;
			
			milestoneState = new String(str1);
			milestoneNo = new String(str2);
		
			MilestoneService empSvc = new MilestoneService();
			MilestoneVO milestoneVO = empSvc.update_agreeMilestone(milestoneState, milestoneNo);
			
			System.out.println("milestoneState:"+milestoneVO.getMilestoneState());

			
			/***************************3.修改完成,準備轉交(Send the Success view)*************/
			req.setAttribute("milestoneVO", milestoneVO); // 資料庫update成功後,正確的的empVO物件,存入req
			String url = "/milestone/milestone.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
		}
		
		if ("disagree-milestone".equals(action)){ //來自milestone.jsp的請求
			
			/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			String str1 = req.getParameter("milestoneState");
			String str2 = req.getParameter("milestoneNo");
			System.out.println("str1:"+str1);
			System.out.println("str2:"+str2);
			
			String milestoneState = null;
			String milestoneNo = null;
			
			milestoneState = new String(str1);
			milestoneNo = new String(str2);
		
			MilestoneService empSvc = new MilestoneService();
			MilestoneVO milestoneVO = empSvc.update_agreeMilestone(milestoneState, milestoneNo);
			
			System.out.println("milestoneState:"+milestoneVO.getMilestoneState());

			
			/***************************3.修改完成,準備轉交(Send the Success view)*************/
			req.setAttribute("milestoneVO", milestoneVO); // 資料庫update成功後,正確的的empVO物件,存入req
			String url = "/milestone/milestone.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
		}
		
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("milestoneName");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("里程碑編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/milestone/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String milestoneName = null;
				try {
					milestoneName = new String(str);
				} catch (Exception e) {
					errorMsgs.add("員工編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/milestone/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				MilestoneService empSvc = new MilestoneService();
				MilestoneVO milestoneVO = empSvc.getOneMilestone(milestoneName);
				if (milestoneVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/milestone/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("milestoneVO", milestoneVO); // 資料庫取出的empVO物件,存入req
				String url = "/milestone/listOneEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/milestone/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		}
		
	}



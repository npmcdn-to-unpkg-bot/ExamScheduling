package iii.team05.Employee.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;


import iii.team05.Employee.model.EmployeeService;
import iii.team05.Employee.model.EmployeeVO;
import iii.team05.examinee.ecmodel.ECService;
import iii.team05.examinee.ecmodel.ESHibernateDAO;
import iii.team05.examinee.ecmodel.ESVO;
import iii.team05.examinee.ecmodel.ScoreService;
import iii.team05.examinee.ecmodel.ScoreVO;
import iii.team05.examinee.ecmodel.ScoreHibernateDAO;
import iii.team05.examinee.ecmodel.ECVO;
import iii.team05.examinee.ecmodel.ECHibernateDAO;
import iii.team05.section.model.SectionDAO;
import iii.team05.section.model.SectionVO;
import iii.team05.event.model.EventDAO;
import iii.team05.event.model.EventVO;

 @WebServlet("/employee/Score")
public class Score_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Score_servlet() {
        super();
         }
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		PrintWriter out = res.getWriter();
		String emp = String.valueOf(session.getAttribute("EmpNO"));
		//System.out.println(emp);
	 
		if ("getall".equals(action)) {
		
			RequestDispatcher rd = req.getRequestDispatcher("/employee/calender.jsp");
			rd.forward(req, res);
			
		
		}
		
		if ("get_Event".equals(action)) {
			//PrintWriter out = res.getWriter();
	    Integer id = new Integer(req.getParameter("id").trim());//取事件table id
	 	EventDAO eventDAO = new EventDAO();
		EventVO eventVO = eventDAO.findByPrimaryKey(id);//利用事件id 取得對應的table
		ECHibernateDAO echDAO = new ECHibernateDAO();
		List<ECVO> student_data = echDAO.SAM(eventVO.getEcno());//取得事件id裡面的ecno欄位 在利用ecno(主鍵)去呼叫學生的table
		//for (ECVO ecvo : student_data){
//			ecvo.getEcno();
//			ecvo.getEcname();
//			ecvo.getEcemail();
//			ecvo.getEcpsd();
//			ecvo.getEcstatus();
//			ecvo.getEcremark1();
//			ecvo.geteSVO();
//			ecvo.getScoreVO();
//			student_data.add(ecvo);
//			System.out.println();		
//			}
		
			
//		JSONArray jary= new JSONArray();
//		for (ECVO ecvo : student_data){
//			JSONObject obj = new JSONObject();
//			obj.put("ecno", ecvo.getEcno());
//			obj.put("ecname", ecvo.getEcname());
//			obj.put("ecemail", ecvo.getEcemail());
//			obj.put("ecpsd", ecvo.getEcemail());
//			obj.put("ecstatus", ecvo.getEcstatus());
//			obj.put("ecremark1", ecvo.getEcno());
//			obj.put("eSVO", ecvo.geteSVO());
//			obj.put("scoreVO", ecvo.getScoreVO());
//						
//			jary.put(obj);
//		}
//		 
//		out.print(jary);
		
		
		
		req.setAttribute("student_data", student_data); // 資料庫取出的empVO物件,存入req
	System.out.println(student_data);
//		String url = "/employee/listOneEmp.jsp"; 
	String url = "/employee/score_listAllEmp.jsp"; 
		RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
		successView.forward(req, res);
			
		
		
		}
		
			
		
		
	}
}
package com.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dealership.Car;


/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		List<Car> cars = (List<Car>) session.getAttribute("cars");
		
		Integer id = Integer.valueOf((String) request.getParameter("carId"));
		
		for(Car car: cars) {
			if(car.getId().equals(id)) {
				request.setAttribute("carDetail", car);
				break;
			}
		}
		
		RequestDispatcher rs = request.getRequestDispatcher("carinfo.jsp");
		rs.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);

		String selectedModel = request.getParameter("selectedModel");
		
		List<Car> searchResults = new ArrayList();
		List<Car> allCarsInSystem = (List<Car>) session.getAttribute("cars");
		
		for (Car currentCar: allCarsInSystem) {
			if(currentCar.getModel().equals(selectedModel) && currentCar.getAvailable().equals("Y")) {
				searchResults.add(currentCar);
			}
		}
		
		request.setAttribute("searchResults", searchResults);
		RequestDispatcher rs = request.getRequestDispatcher("search.jsp");
		rs.forward(request, response);
		
	}
	
	

}

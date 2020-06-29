package com.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dealership.Car;
import com.dealership.Person;

/**
 * Servlet implementation class User
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Person person = new Person();
		person.setUserName(request.getParameter("userName"));
		person.setPassword(request.getParameter("password"));

		HttpSession session = request.getSession(true);
		session.setAttribute("person", person);

		List<Car> cars = readSavedCarsFromFile();

		session.setAttribute("cars", cars);

		RequestDispatcher rs = request.getRequestDispatcher("search.jsp");
		rs.forward(request, response);
	}

	//C:\Training\weblab\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\CarDealership\WEB-INF/car-inventory.txt
	List<Car> readSavedCarsFromFile() throws IOException {
		List<Car> cars = new ArrayList<Car>();
		//String filePath = "C:\\Training\\weblab\\car-inventory.txt";// "/WEB-INF/car-inventory.txt";
		String filePath = getServletContext().getRealPath("/WEB-INF")+ "/car-inventory.txt";
		Scanner sc = new Scanner(new File(filePath));

		while (sc.hasNextLine()) {
			String line = sc.nextLine();
			String[] carData = line.split(",");
			Car car = new Car();
			car.setId(Integer.valueOf(carData[0]));
			car.setManufactureName(carData[1]);
			car.setModel(carData[2]);
			car.setMilesRan(carData[3]);
			car.setYearBuild(carData[4]);
			car.setPrice(Double.valueOf(carData[5]));
			int tempNumberOfDaysOnLot = Integer.parseInt(carData[6]);
			car.setAvailable(carData[7]);
			car.setNumberOfDaysOnLot(tempNumberOfDaysOnLot);
			car.setDescription("**ALL WHEEL DRIVE**, **SUNROOF/MOONROOF**, **HEATED LEATHER INTERIOR**");
			car.setBiddable(tempNumberOfDaysOnLot > 120);
			String imageName = "/Images/car" + carData[0] + ".jpg";
			car.setImage(imageName);
			cars.add(car);
		}
		sc.close();
		return cars;

	}

}

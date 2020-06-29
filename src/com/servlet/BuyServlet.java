package com.servlet;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Scanner;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dealership.Car;
import com.dealership.Person;
import com.dealership.Transaction;

/**
 * Servlet implementation class BuyServlet
 */
@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuyServlet() {
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
		

		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		Person person = (Person) session.getAttribute("person");
		person.setFirstName(request.getParameter("firstName"));
		person.setLastName(request.getParameter("lastName"));
		session.setAttribute("person", person);
		List<Car> cars = (List<Car>) session.getAttribute("cars");

		// Buy steps

		// Create txn Id
		String txnId = UUID.randomUUID().toString();
		// Get cardId, date and create Txn Object
		int carId = Integer.valueOf(request.getParameter("buyId"));
		Date date = new Date();
		Transaction transaction = new Transaction(carId, txnId, date, person.getUserName());
		// Write that Txn object into file called transactions.txt
		if(saveTransaction(transaction)) {
			updateAvailabilityToFile(cars, carId);
			request.setAttribute("transaction", transaction);
		} else {
			request.removeAttribute("transaction");
		}

		
		RequestDispatcher rs = request.getRequestDispatcher("buy.jsp");
		rs.forward(request, response);
	}

	private boolean saveTransaction(Transaction transaction) {
		String filePath = getServletContext().getRealPath("/WEB-INF/transaction.txt");
		//filePath = "C:\\Training\\weblab\\transaction.txt";

		try {
			
			//Read existing transactions from file
			Scanner sc = new Scanner(new File(filePath));
			// instantiating the StringBuffer class
			StringBuffer buffer = new StringBuffer();
			// Reading lines of the file and appending them to StringBuffer
			while (sc.hasNext()) {
				String line = sc.nextLine();
				buffer.append(line + System.lineSeparator());
			}
			buffer.append(transaction + System.lineSeparator());
			sc.close();
			FileWriter writer = new FileWriter(filePath, false);
			writer.write(buffer.toString());
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}

	public void updateAvailabilityToFile(List<Car> cars, int idOfCarToChange) {
		try {
			String filePath = getServletContext().getRealPath("/WEB-INF/car-inventory.txt");//"/WEB-INF/car-inventory.txt";
			Scanner sc = new Scanner(new File(filePath));
			// instantiating the StringBuffer class
			StringBuffer buffer = new StringBuffer();
			
			for(Car car: cars) {
				if(car.getId().equals(idOfCarToChange)) {
					car.setAvailable("N");
				}
				buffer.append(car+ System.lineSeparator());
			}
			
			String fileContents = buffer.toString();
			sc.close();
			// instantiating the FileWriter class
			FileWriter writer = new FileWriter(filePath);
			writer.write(fileContents);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			System.out.println("Error writing to file");

		}
	}

}

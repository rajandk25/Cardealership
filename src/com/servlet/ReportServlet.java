package com.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Scanner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dealership.Car;
import com.dealership.Report;
import com.dealership.Transaction;


/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);

		List<Report> reportData = new ArrayList<>();
		
		List<Transaction> transactions = readTransactionFile();
		
		List<Car> cars = (List<Car>) session.getAttribute("cars");
		
		for(Transaction txn: transactions) {
			int carIdInTransaction = txn.getCarId();
			Report report = null;
			
			for(Car car: cars) {
				if(car.getId().equals(carIdInTransaction)) {
					report = new Report(car, txn);
					break;
				}
			}
			
			reportData.add(report);
		}
		
		request.setAttribute("reportData", reportData);
		RequestDispatcher rs = request.getRequestDispatcher("report.jsp");
		rs.forward(request, response);
		
	}

	private List<Transaction> readTransactionFile() {
		String filePath = getServletContext().getRealPath("/WEB-INF/transaction.txt");
		List<Transaction> transactions = new ArrayList<>();

		try {
			//Read existing transactions from file
			Scanner sc = new Scanner(new File(filePath));
			// Reading lines of the file and appending them to StringBuffer
			while (sc.hasNext()) {
				String line = sc.nextLine();
				String[] txnData = line.split(",");
				Date date = new SimpleDateFormat(Transaction.DATE_FORMAT).parse(txnData[2]);
				Transaction txn = new Transaction(Integer.valueOf(txnData[0]), txnData[1], date, txnData[3]);
				transactions.add(txn);
			}
			sc.close();
			Collections.sort(transactions);
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
		
		return transactions;
	}
	
	

}

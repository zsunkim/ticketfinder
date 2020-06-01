<%@page import="ticket.finder.service.ShowXShowService"%>
<%@page import="ticket.finder.service.ShowXShowServiceImpl"%>
<%@page import="ticket.finder.dto.ShowXShow"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	/*
	if(request.getParameter("showNum")==null){
		throw new Exception();
	}

	ShowXShowService showService = new ShowXShowServiceImpl();

	ShowXShow showInfo = showService.getShowDetail(Integer.parseInt(request.getParameter("showNum")));
	
	if(showInfo==null){
		throw new Exception();
	}

	String seats=showInfo.getShowDetail().getShowSeat();
	*/
	String seats="111110011111\n111110011111\n111110011111\n111110011111\n111110011122";
	String[] seatArray=seats.split("\n");
	
	int sizeX = seatArray[1].length();
	int sizeY = seatArray.length;
	
	List<String[]> list=new ArrayList<String[]>();
	
	for(int i=0; i<sizeY; i++){
		String[] line = new String[sizeX];
		for(int j=0; j<sizeX; j++) {
			line[j]=seatArray[i].substring(j, j+1);
		}
		list.add(line);
	}
%>

[
	<%for(int i=0; i<list.size(); i++){ %>
		<%if(i>0){%>,<%} %> 
			[
				<%for(int j=0; j<list.get(i).length; j++) { %>
					<%if(j>0){%>,<%} %> 
					<%= list.get(i)[j]%>
				<%} %>
			]		
	<%} %>
]











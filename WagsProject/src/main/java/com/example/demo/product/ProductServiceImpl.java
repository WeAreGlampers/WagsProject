package com.example.demo.product;


import java.time.LocalDate;
import java.time.chrono.ChronoLocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.example.demo.dto.CartDto;
import com.example.demo.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.example.demo.dto.ProductDto;
import com.example.demo.dto.ReservationDto;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductMapper mapper;

	@Override

	public String productContent(HttpSession session, HttpServletRequest request, Model model) {
		
		return "/product/productContent";
	}

	@Override
	public String addCart(CartDto cdto, HttpServletRequest request, HttpSession session) {
		/*
		if(session.getAttribute("userid") == null) {
			return "/login/login";
		} else {
			// 값을 가져와서 CartDto 에 넣기
			String userid=session.getAttribute("userid").toString();
			cdto.setUserid(userid);
			
			int fireWood=Integer.parseInt(request.getParameter("fireWood"));
			cdto.setFireWood(fireWood);
			
			int grill=Integer.parseInt(request.getParameter("grill"));
			cdto.setGrill(grill);
			
			if(mapper.isCart(cdto))
				mapper.upCart(cdto);
			else
				mapper.addCart(cdto);
			
			return "1";
		}
		*/
		
		int fireWood=Integer.parseInt(request.getParameter("fireWood"));
		cdto.setFireWood(fireWood);
		
		int grill=Integer.parseInt(request.getParameter("grill"));
		cdto.setGrill(grill);
		
		if(mapper.isCart(cdto))
			mapper.upCart(cdto);
		else
			mapper.addCart(cdto);
		
		return "1";
	}

	public String productList(HttpServletRequest request,Model model) {
		ArrayList<ProductDto> plist;
		if(request.getParameter("date")!=null) {
			String date=request.getParameter("date");
			String[] dates=date.split("-");
			String inday=dates[0]+"-"+dates[1]+"-"+dates[2];
			String outday=dates[3].trim()+"-"+dates[4]+"-"+dates[5];
			int num=Integer.parseInt(request.getParameter("num"));
			model.addAttribute("date",date);
			model.addAttribute("num",num);
			ArrayList<ProductDto> plistOld=mapper.productList();
			plist=new ArrayList<ProductDto>();
			for(int i=0;i<plistOld.size();i++) {
				ProductDto pdto=plistOld.get(i);
				if(!mapper.isCheck(outday, pdto.getPcode())) {
					if(pdto.getMax()>=num) {
						plist.add(pdto);
					}
				}
			}
		}
		else if(request.getParameter("num")!=null) {
			int num=Integer.parseInt(request.getParameter("num"));
			model.addAttribute("num",num);
			plist=mapper.productList2(num);
		}
		else {
			plist=mapper.productList();
		}
		model.addAttribute("plist",plist);
		return "/product/productList";
	}

	@Override
	public String reservation(ReservationDto rdto, HttpSession session, Model model) {
		if(session.getAttribute("userid")==null) {
			return "redirect:/login/login";
		}
		else {
			String userid=session.getAttribute("userid").toString();
			MemberDto mdto=mapper.getMember(userid);
			model.addAttribute("mdto",mdto);
			rdto.setTitle("카라반1");
		    rdto.setGrill(1);
		    rdto.setFireWood(1);
		    rdto.setTotalPrice(240000);
		    rdto.setInday("2025-02-27");
		    rdto.setOutday("2025-03-01");
		    rdto.setPcode("p0101");
		    rdto.setFireWoodPrice(20000);
		    rdto.setGrillPrice(20000);
		    rdto.setRoomPrice(200000);
		    LocalDate inday=LocalDate.parse(rdto.getInday());
		    LocalDate outday=LocalDate.parse(rdto.getOutday());
		    model.addAttribute("day",ChronoUnit.DAYS.between(inday,outday));
			model.addAttribute("rdto",rdto);
			return "/product/reservation";
		}
	}

	@Override
	public String reservationOk(ReservationDto rdto, HttpSession session, Model model) {
		if(session.getAttribute("userid")==null) {
			return "redirect:/login/login";
		}
		else {
			String userid=session.getAttribute("userid").toString();
			rdto.setUserid(userid);
			String today=LocalDate.now().toString().replace("-","");
			String jumuncode="j"+today;
			int num=mapper.getNumber(jumuncode);
			jumuncode+=String.format("%03d", num);
			rdto.setJumuncode(jumuncode);
			mapper.reservationOk(rdto);
			model.addAttribute("rdto",rdto);
			return "/product/reservationOk";
		}
	}

}

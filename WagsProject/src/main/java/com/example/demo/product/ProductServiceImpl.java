package com.example.demo.product;

import java.sql.Date;
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
import com.example.demo.dto.QnaDto;
import com.example.demo.dto.ReservationDto;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper mapper;

	@Override

	public String productContent(HttpSession session, HttpServletRequest request, Model model) {
		String userid=session.getAttribute("userid").toString();
		String pcode = request.getParameter("pcode");
		ProductDto pdto = mapper.getRoom(pcode); // pcode에 해당하는 상품의 정보들
		
		int ok=0;
		if(session.getAttribute("userid") != null) {
			
			ok=mapper.isDibs(userid,pcode);
		}
		model.addAttribute("ok",ok);
		
		model.addAttribute("pdto", pdto);

		return "/product/productContent";
	}

	@Override
	public String addCart(CartDto cdto, HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("userid") == null) {
			return "redirect:/login/login";
		} else {

			// 값을 가져와서 CartDto 에 넣기
			String userid = session.getAttribute("userid").toString();
			cdto.setUserid(userid);
			
			String date = request.getParameter("date").trim().replace(" ", "");
			String[] dates = date.split("-");
			String inday = dates[0] + "-" + dates[1] + "-" + dates[2];
			cdto.setInday(inday);
			String outday = dates[3].trim() + "-" + dates[4] + "-" + dates[5];
			cdto.setOutday(outday);
			
			//System.out.println(date);
			
			// 옵션 가격
			int optionPrice = (cdto.getFireWoodPrice()) + (cdto.getGrillPrice());
			// 숙박 기간 계산
			LocalDate inday1=LocalDate.parse(cdto.getInday());
			LocalDate outday1=LocalDate.parse(cdto.getOutday());
			long stay=ChronoUnit.DAYS.between(inday1, outday1);
			//System.out.println(cdto.getInday());
			//System.out.println(cdto.getOutday());
			// 방 가격
			int roomPrice =  cdto.getRoomPrice() * (int)stay;
			
			cdto.setRoomPrice(roomPrice);
			//System.out.println(cdto.getRoomPrice());
			// 총가격
			int totalPrice = roomPrice + optionPrice;
			cdto.setTotalPrice(totalPrice);
			//System.out.println(cdto.getTotalPrice());
			
			if (mapper.isCart(cdto))

				mapper.upCart(cdto);

			else
				mapper.addCart(cdto);

			return "1";
		}

	}

	@Override
	public String dibsOk(HttpSession session,HttpServletRequest request) {
		if(session.getAttribute("userid") == null) {
			return "0";
		} else {
			String userid= session.getAttribute("userid").toString();
			String pcode= request.getParameter("pcode");
			
			mapper.dibsOk(userid,pcode);
			
			return "1";
		}
	}
	
	@Override
	public String dibsDel(HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("userid") == null) {
			return "0";
		} else {
			String userid=session.getAttribute("userid").toString();
			String pcode=request.getParameter("pcode");
			
			mapper.dibsDel(userid,pcode);
			
			return "1";
			
		}
		
	}
	
	
	
	public String productList(HttpServletRequest request, Model model) {
		ArrayList<ProductDto> plist;
		if (request.getParameter("date") != null) {
			String date = request.getParameter("date");
			String[] dates = date.split("-");
			String inday = dates[0] + "-" + dates[1] + "-" + dates[2];
			String outday = dates[3].trim() + "-" + dates[4] + "-" + dates[5];
			int num = Integer.parseInt(request.getParameter("num"));
			model.addAttribute("date", date);
			model.addAttribute("num", num);
			ArrayList<ProductDto> plistOld = mapper.productList();
			plist = new ArrayList<ProductDto>();
			for (int i = 0; i < plistOld.size(); i++) {
				ProductDto pdto = plistOld.get(i);
				if (!mapper.isCheck(outday, pdto.getPcode())) {
					if (pdto.getMax() >= num) {
						plist.add(pdto);
					}
				}
			}
		} else if (request.getParameter("num") != null) {
			int num = Integer.parseInt(request.getParameter("num"));
			model.addAttribute("num", num);
			plist = mapper.productList2(num);
		} else {
			plist = mapper.productList();
		}
		model.addAttribute("plist", plist);
		return "/product/productList";
	}

	@Override
	public String reservation(HttpSession session, Model model,HttpServletRequest request) {
		
		if(session.getAttribute("userid")==null) {
			return "redirect:/login/login";
		}
		else { 
			String userid=session.getAttribute("userid").toString();
			MemberDto mdto=mapper.getMember(userid);
			model.addAttribute("mdto",mdto);
			ArrayList<CartDto> clist=new ArrayList<CartDto>();

			String[] pcodes=request.getParameter("pcode").split(",");
			String[] titles=request.getParameter("title").split(",");
			String[] grills=request.getParameter("grill").split(",");
			String[] fireWoods=request.getParameter("fireWood").split(",");
			String[] grillPrices=request.getParameter("grillPrice").split(",");
			String[] fireWoodPrices=request.getParameter("fireWoodPrice").split(",");
			
			long[] days=new long[pcodes.length];
			int totalPriceAll=0;
			// chk가 없으면 장바구니에서
			if(request.getParameter("chk")==null){
					
				String[] roomPrices=request.getParameter("roomPrice").split(",");
				String[] totalPrices=request.getParameter("totalPrice").split(",");
				String[] indays=request.getParameter("inday").split(",");
				String[] outdays=request.getParameter("outday").split(",");
				
				for(int i=0;i<pcodes.length;i++) {
					CartDto cdto=new CartDto();
					cdto.setPcode(pcodes[i]);
					cdto.setTitle(titles[i]);
					cdto.setGrill(Integer.parseInt(grills[i]));
					cdto.setFireWood(Integer.parseInt(fireWoods[i]));
					cdto.setGrillPrice(Integer.parseInt(grillPrices[i]));
					cdto.setFireWoodPrice(Integer.parseInt(fireWoodPrices[i]));
					cdto.setRoomPrice(Integer.parseInt(roomPrices[i]));
					cdto.setTotalPrice(Integer.parseInt(totalPrices[i]));
					totalPriceAll+=cdto.getTotalPrice();
					cdto.setInday(indays[i]);
					cdto.setOutday(outdays[i]);
					LocalDate inday1=LocalDate.parse(cdto.getInday());
				    LocalDate outday1=LocalDate.parse(cdto.getOutday());
				    long day=ChronoUnit.DAYS.between(inday1,outday1);
				    days[i]=day;
					clist.add(cdto);
					
				}
				
			}
			else{
			
				int roomPrice=Integer.parseInt(request.getParameter("roomPrice"));
				String date=request.getParameter("inday");
				String[] dates=date.replace(" ", "").split("-");
				String inday=dates[0]+"-"+dates[1]+"-"+dates[2];
				String outday=dates[3].trim()+"-"+dates[4]+"-"+dates[5];
				LocalDate inday1=LocalDate.parse(inday);
			    LocalDate outday1=LocalDate.parse(outday);
			    long day=ChronoUnit.DAYS.between(inday1,outday1);
			    days[0]=day;
				roomPrice=roomPrice*(int)day;
			    totalPriceAll=roomPrice+Integer.parseInt(fireWoodPrices[0])+Integer.parseInt(grillPrices[0]); 
			    CartDto cdto=new CartDto();
				cdto.setPcode(pcodes[0]);
				cdto.setTitle(titles[0]);
				cdto.setGrill(Integer.parseInt(grills[0]));
				cdto.setFireWood(Integer.parseInt(fireWoods[0]));
				cdto.setGrillPrice(Integer.parseInt(grillPrices[0]));
				cdto.setFireWoodPrice(Integer.parseInt(fireWoodPrices[0]));
				cdto.setRoomPrice(roomPrice);
				cdto.setTotalPrice(totalPriceAll);
				cdto.setInday(inday);
				cdto.setOutday(outday);
				clist.add(cdto);
			}
			model.addAttribute("days",days);
			model.addAttribute("totalPriceAll",totalPriceAll);
			model.addAttribute("clist",clist);
			return "/product/reservation";
			
		}
	}

	@Override
	public String reservationOk(HttpSession session, Model model,HttpServletRequest request) {
		if(session.getAttribute("userid")==null) {
			return "redirect:/login/login";
		}
		else {
			String userid=session.getAttribute("userid").toString();
			
			String[] pcodes=request.getParameterValues("pcode");
			String[] titles=request.getParameterValues("title");
			String[] grills=request.getParameterValues("grill");
			String[] fireWoods=request.getParameterValues("fireWood");
			String[] grillPrices=request.getParameterValues("grillPrice");
			String[] fireWoodPrices=request.getParameterValues("fireWoodPrice");
			String[] roomPrices=request.getParameterValues("roomPrice");
			String[] totalPrices=request.getParameterValues("totalPrice");
			String[] indays=request.getParameterValues("inday");
			String[] outdays=request.getParameterValues("outday");
			String req=request.getParameter("req");
			String useSave=request.getParameter("useSave");
			String pay=request.getParameter("pay");
			String card1=request.getParameter("card1");
			String halbu=request.getParameter("halbu");
			String bank1=request.getParameter("bank1");
			String card2=request.getParameter("card2");
			String tel=request.getParameter("tel");
			String bank2=request.getParameter("bank2");
			
			String today=LocalDate.now().toString().replace("-","");
			String jumuncode="j"+today;
			int num=mapper.getNumber(jumuncode);
			jumuncode+=String.format("%03d", num);
			int addSave=0;
			for(int i=0;i<pcodes.length;i++) {
				ReservationDto rdto=new ReservationDto();
				rdto.setPcode(pcodes[i]);
				rdto.setTitle(titles[i]);
				rdto.setGrill(Integer.parseInt(grills[i]));
				rdto.setFireWood(Integer.parseInt(fireWoods[i]));
				rdto.setGrillPrice(Integer.parseInt(grillPrices[i]));
				rdto.setFireWoodPrice(Integer.parseInt(fireWoodPrices[i]));
				rdto.setRoomPrice(Integer.parseInt(roomPrices[i]));
				rdto.setTotalPrice(Integer.parseInt(totalPrices[i]));
				rdto.setInday(indays[i]);
				rdto.setOutday(outdays[i]);
				rdto.setUserid(userid);
				rdto.setJumuncode(jumuncode);
				rdto.setReq(req);
				rdto.setUseSave(Integer.parseInt(useSave));
				rdto.setPay(Integer.parseInt(pay));
				rdto.setCard1(Integer.parseInt(card1));
				rdto.setHalbu(Integer.parseInt(halbu));
				rdto.setBank1(Integer.parseInt(bank1));
				rdto.setCard2(Integer.parseInt(card2));
				rdto.setTel(Integer.parseInt(tel));
				rdto.setBank2(Integer.parseInt(bank2));
				addSave+=mapper.getSave(rdto.getPcode());
				mapper.reservationOk(rdto);
				mapper.reserveCartDel(rdto);
			}
			mapper.setSave(userid,Integer.parseInt(useSave),addSave);
			return "/product/reservationOk";
		}
	}

	@Override
	public String qnaWriteOk(QnaDto qdto, HttpSession session) {
		if (session.getAttribute("userid")==null) {
			return "redirect:/login/login";
		} else {
			String userid = session.getAttribute("userid").toString();
			qdto.setUserid(userid);
			mapper.qnaWriteOk(qdto);
			return "redirect:/product/productContent?pcode="+qdto.getPcode();
		}
	}


}

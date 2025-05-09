package com.example.demo.product;

import java.sql.Date;
import java.time.LocalDate;
import java.time.chrono.ChronoLocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.MyUtil;
import com.example.demo.dto.CartDto;
import com.example.demo.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.example.demo.dto.ProductDto;
import com.example.demo.dto.QnaDto;
import com.example.demo.dto.ReservationDto;
import com.example.demo.dto.ReviewDto;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper mapper;

	@Override

	public String productContent(HttpSession session, HttpServletRequest request, Model model) {
		
		String pcode = request.getParameter("pcode");
		ProductDto pdto = mapper.getRoom(pcode); // pcode에 해당하는 상품의 정보들

		int ok = 0;
		if (session.getAttribute("userid") != null) {
			String userid = session.getAttribute("userid").toString();
			ok = mapper.isDibs(userid, pcode);
		}
		model.addAttribute("ok", ok);

		// 별점 구해서 보내기
		MyUtil.getStar(pdto);
		
		// 상품평 내용
		ArrayList<ReviewDto> reviewList=mapper.getReview(pcode);
		for(int i=0; i<reviewList.size(); i++) {
			reviewList.get(i).setContent(reviewList.get(i).getContent().replace("/r/n", "<br>"));
		}
		
		model.addAttribute("reviewList",reviewList);

		// 상품문의를 가져와서 뷰에 전달
		ArrayList<QnaDto> qlist=mapper.getQna(pcode);
		for(int i=0; i<qlist.size(); i++) {
			qlist.get(i).setContent(qlist.get(i).getContent().replace("/r/n", "<br>"));
		}
		
		model.addAttribute("qlist",qlist);
		
		ArrayList<ReservationDto> reservationList = mapper.getReservation(request.getParameter("pcode")); 
		String test="";
		for(int i=0; i<reservationList.size(); i++) {
			test = test + "['" + reservationList.get(i).getInday() + "','" + reservationList.get(i).getOutday() + "'],";
		}
		
		model.addAttribute("test", test);
		
		model.addAttribute("pdto", pdto);
		
		if(request.getParameter("date")!="" && request.getParameter("date")!=null) {
			String date = request.getParameter("date").replace(" ", "");
			String[] dates = date.split("-");
			String inday = dates[0] + "-" + dates[1] + "-" + dates[2];
			String outday = dates[3].trim() + "-" + dates[4] + "-" + dates[5];
			model.addAttribute("inday",inday);
			model.addAttribute("outday",outday);
			
		}

		return "/product/productContent";
	}

	@Override
	public String addCart(CartDto cdto, HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("userid") == null) {
			return "2";
		} else {

			// 값을 가져와서 CartDto 에 넣기
			String userid = session.getAttribute("userid").toString();
			cdto.setUserid(userid);

			// date 를 inday와 outday 로 나눠서 저장
			String date = request.getParameter("date").trim().replace(" ", "");
			String[] dates = date.split("-");
			String inday = dates[0] + "-" + dates[1] + "-" + dates[2];
			cdto.setInday(inday);
			String outday = dates[3].trim() + "-" + dates[4] + "-" + dates[5];
			cdto.setOutday(outday);

			// 옵션 가격
			int optionPrice = (cdto.getFireWoodPrice()) + (cdto.getGrillPrice());

			// 숙박 기간 계산
			LocalDate inday1 = LocalDate.parse(cdto.getInday());
			LocalDate outday1 = LocalDate.parse(cdto.getOutday());
			long stay = ChronoUnit.DAYS.between(inday1, outday1);
			// System.out.println(cdto.getInday());
			// System.out.println(cdto.getOutday());

			// 방 가격
			int roomPrice = cdto.getRoomPrice() * (int) stay;
			cdto.setRoomPrice(roomPrice);

			// 총가격
			int totalPrice = roomPrice + optionPrice;
			cdto.setTotalPrice(totalPrice);

			if (mapper.isCart(cdto))

				mapper.upCart(cdto);

			else
				mapper.addCart(cdto);

			return "1";
		}

	}

	@Override
	public String dibsOk(HttpSession session, HttpServletRequest request) {
		if (session.getAttribute("userid") == null) {
			return "0";
		} else {
			String userid = session.getAttribute("userid").toString();
			String pcode = request.getParameter("pcode");

			mapper.dibsOk(userid, pcode);

			return "1";
		}
	}

	@Override
	public String dibsDel(HttpSession session, HttpServletRequest request) {
		if (session.getAttribute("userid") == null) {
			return "0";
		} else {
			String userid = session.getAttribute("userid").toString();
			String pcode = request.getParameter("pcode");

			mapper.dibsDel(userid, pcode);

			return "1";

		}

	}

	
	
	public String productList(HttpServletRequest request, Model model) {
		ArrayList<ProductDto> plist;
		if (request.getParameter("date") != null) {
			String date = request.getParameter("date").replace(" ", "");
			String[] dates = date.split("-");
			String inday1 = dates[0] + "-" + dates[1] + "-" + dates[2];
			String outday1 = dates[3].trim() + "-" + dates[4] + "-" + dates[5];
			LocalDate inday = LocalDate.parse(inday1);
			LocalDate outday = LocalDate.parse(outday1);
			long cnt = ChronoUnit.DAYS.between(inday, outday);
			int num = Integer.parseInt(request.getParameter("num"));
			model.addAttribute("date", date);
			model.addAttribute("num", num);
			ArrayList<ProductDto> plistOld = mapper.productList();
			plist = new ArrayList<ProductDto>();
			for (int i = 0; i < plistOld.size(); i++) {
				int chk=0;
				LocalDate day=inday;
				ProductDto pdto = plistOld.get(i);
				for(int j=0;j<cnt;j++) {
					if(mapper.isCheck(day.toString(), pdto.getPcode())) {
						chk=1;
					}
					day=day.plusDays(1);
				}
				if (chk==0 && pdto.getMax() >= num && pdto.getStandard() <= num) {
					plist.add(pdto);
				}
			}
		} 
		else if (request.getParameter("num") != null) {
			int num = Integer.parseInt(request.getParameter("num"));
			model.addAttribute("num", num);
			plist = mapper.productList2(num);
		} 
		else {
			plist = mapper.productList();
		}
		model.addAttribute("plist", plist);
		return "/product/productList";
	}

	@Override
	public String reservation(HttpSession session, Model model, HttpServletRequest request,CartDto cdto) {

		if (session.getAttribute("userid") == null) {
			String pcode = request.getParameter("pcode");
			return "redirect:/login/login?move=2&pcode="+pcode;
		}
		else { 
			String userid=session.getAttribute("userid").toString();
			MemberDto mdto=mapper.getMember(userid);
			model.addAttribute("mdto",mdto);
			ArrayList<CartDto> clist=new ArrayList<CartDto>();
			int totalPriceAll=0;
			// chk가 없으면 장바구니에서
			if(request.getParameter("chk")==null){
				
				String[] cid=request.getParameterValues("subChk");
				long[] days=new long[cid.length];
				for(int i=0;i<cid.length;i++) {
					cdto=mapper.getCart2(cid[i]);
					cdto.setTotalPrice(cdto.getTotalPrice()+cdto.getPeople()*15000);
					totalPriceAll+=cdto.getTotalPrice();
					LocalDate inday1 = LocalDate.parse(cdto.getInday());
					LocalDate outday1 = LocalDate.parse(cdto.getOutday());
					long day = ChronoUnit.DAYS.between(inday1, outday1);
					days[i] = day;
					clist.add(cdto);
				}
				model.addAttribute("days", days);
				
			}
			else{
				long[] days=new long[1];
				String date=cdto.getInday();
				String[] dates=date.replace(" ","").split("-");
				String inday=dates[0]+"-"+dates[1]+"-"+dates[2];
				String outday=dates[3].trim()+"-"+dates[4]+"-"+dates[5];
				cdto.setInday(inday);
				cdto.setOutday(outday);
				LocalDate inday1=LocalDate.parse(inday);
			    LocalDate outday1=LocalDate.parse(outday);
			    long day=ChronoUnit.DAYS.between(inday1,outday1);
			    days[0]=day;
			    cdto.setRoomPrice(cdto.getRoomPrice()*(int)day);
			    totalPriceAll=cdto.getRoomPrice()+cdto.getFireWoodPrice()+cdto.getGrillPrice()+cdto.getPeople()*15000;
			    cdto.setTotalPrice(totalPriceAll);
			    clist.add(cdto);
				model.addAttribute("days", days);
			    
			}
			
			model.addAttribute("totalPriceAll", totalPriceAll);
			model.addAttribute("clist", clist);
			return "/product/reservation";

		}
	}

	@Override
	public String reservationOk(HttpSession session, Model model, HttpServletRequest request) {
		if (session.getAttribute("userid") == null) {
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
			String[] peoples=request.getParameterValues("people");
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
				rdto.setPeople(Integer.parseInt(peoples[i]));
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
				addSave += mapper.getSave(rdto.getPcode());
				mapper.reservationOk(rdto);
				mapper.reserveCartDel(rdto);
			}
		
			mapper.setSave(userid, Integer.parseInt(useSave), addSave);
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

  @Override
	public ArrayList<ReservationDto> UnavailableDates(HttpServletRequest request) {
		
		ArrayList<ReservationDto> rlist = mapper.getReservation(request.getParameter("pcode")); 
		System.out.println(request.getParameter("pcode"));
		System.out.println(rlist.get(0).getInday());
		/*
		String inday = rdto.getInday(); // 입실
		String outday = rdto.getOutday(); // 퇴실
		
		// 숙박 기간 계산
		LocalDate inday1 = LocalDate.parse(inday);
		LocalDate outday1 = LocalDate.parse(outday);
		long stay = ChronoUnit.DAYS.between(inday1, outday1);
		
		
		List<String> totalStay = new ArrayList<>();
		// 숙박일수만큼 반복해서 하루씩 증가
		for(int i=0; i<stay; i++) {
			totalStay.add(inday1.toString());
			inday1 = inday1.plusDays(1);
		}
		*/
		return rlist; // 문자열로 보내기
	}

	@Override
	public String qnaDel(HttpServletRequest request) {
		String id=request.getParameter("id");
		String pcode=request.getParameter("pcode");
		int ref= Integer.parseInt(request.getParameter("ref"));
		
		if(ref == 0) {
			mapper.qnaDel1(id);
		} else {
			mapper.qnaDel2(ref);
		}
		
		return "redirect:/product/productContent?pcode=" + pcode;
	}


}

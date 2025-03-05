package com.example.demo.product;

import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.example.demo.dto.CartDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.example.demo.dto.ProductDto;

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
			
			String date = request.getParameter("date");
			String[] dates = date.split("-");
			String inday = dates[0] + "-" + dates[1] + "-" + dates[2];
			cdto.setInday(inday);
			String outday = dates[3].trim() + "-" + dates[4] + "-" + dates[5];
			cdto.setOutday(outday);
			
			// 옵션 가격
			int optionPrice = ( cdto.getFireWood() * cdto.getFireWoodPrice() ) + ( cdto.getGrill() * cdto.getGrillPrice() );
			
			// 숙박 기간 계산
			LocalDate inday1=LocalDate.parse(cdto.getInday());
			LocalDate outday1=LocalDate.parse(cdto.getOutday());
			long stay=ChronoUnit.DAYS.between(inday1, outday1);
			
			// 방 가격
			long roomPrice = cdto.getRoomPrice() * stay;
			
			// 총가격
			long totalPrice = roomPrice + optionPrice;
			
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

	

	



	

}

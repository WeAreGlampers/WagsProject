package com.example.demo.product;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.CartDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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

	

	

	

}

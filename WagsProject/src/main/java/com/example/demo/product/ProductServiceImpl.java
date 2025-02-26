package com.example.demo.product;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.ProductDto;

import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductMapper mapper;

	@Override
	public String productList(HttpServletRequest request,Model model) {
		ArrayList<ProductDto> plist;
		if(request.getParameter("inday")!=null) {
			String inday=request.getParameter("inday");
			String outday=request.getParameter("outday");
			int num=Integer.parseInt(request.getParameter("num"));
			model.addAttribute("inday",inday);
			model.addAttribute("outday",outday);
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

}

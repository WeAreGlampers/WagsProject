package com.example.demo.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.dto.ProductDto;
import com.example.demo.dto.QnaDto;

@Controller
public class AdminController {
	@Autowired
	@Qualifier("as")
	private AdminService service;
	
	@GetMapping("/admin/productList")
	public String productList(Model model) {
		return service.productList(model);
	}
	
	@GetMapping("/admin/productWrite")
	public String productWrite() {
		return service.productWrite();
	}
	
	@PostMapping("/admin/productWriteOk")
	public String productWriteOk(ProductDto pdto,MultipartHttpServletRequest multi)throws Exception {
		return service.productWriteOk(pdto,multi);
	}
	
	@GetMapping("/admin/productDelete")
	public String productDelete(String id)throws Exception{
		return service.productDelete(id);
	}
	
	@GetMapping("/admin/productUpdate")
	public String productUpdate(String id,Model model){
		return service.productUpdate(id,model);
	}
	
	@PostMapping("/admin/productUpdateOk")
	public String productUpdateOk(ProductDto pdto,MultipartHttpServletRequest multi)throws Exception {
		return service.productUpdateOk(pdto,multi);
	}
	
	@GetMapping("/admin/qnaList")
	public String qnaList(Model model) {
		return service.qnaList(model);
	}
	
	@PostMapping("/admin/qnaAnswer")
	public String qnaAnswer(QnaDto qdto) {
		return service.qnaAnswer(qdto);
	}
	
	@GetMapping("/admin/reservationList")
	public String reservationList(Model model) {
		return service.reservationList(model);
	}
	
	@GetMapping("/admin/chgState")
	public String chgState(String id) {
		return service.chgState(id);
	}
}

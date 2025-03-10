package com.example.demo.admin;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.dto.ProductDto;

public interface AdminService {
	public String productList(Model model);
	public String productWrite();
	public String productWriteOk(ProductDto pdto,MultipartHttpServletRequest multi)throws Exception;
	public String productDelete(String id);
	public String productUpdate(String id,Model model);
	public String productUpdateOk(ProductDto pdto,MultipartHttpServletRequest multi)throws Exception;
}

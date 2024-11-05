package com.ict.guestbook2.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.guestbook2.service.GuestBook2Service;
import com.ict.guestbook2.vo.GuestBook2VO;

@Controller
public class GuestBook2Controller {

	@Autowired
	private GuestBook2Service guestBook2Service;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/gb2_list")
	public ModelAndView guestBookList() {
		ModelAndView mv = new ModelAndView("guestbook2/list");
		List<GuestBook2VO> gb2_list = guestBook2Service.getGuestBook2List();
		mv.addObject("gb2_list", gb2_list);
		return mv;
	}
	
	@GetMapping("/gb2_write")
	public ModelAndView guestBookWrite() {

		return new ModelAndView("guestbook2/write");
	}
	
	@GetMapping("/gb2_detail")
	public ModelAndView guestBookDrtail(@RequestParam("gb_idx") String gb_idx) {
		ModelAndView mv = new ModelAndView("guestbook2/onlist");
		GuestBook2VO gb2vo = guestBook2Service.getGuestBook2Detail(gb_idx);
		if (gb2vo != null) {
			mv.addObject("gb2vo", gb2vo);
			return mv;
		}

		return new ModelAndView("guestbook2/error");
	}
	
	@PostMapping("/gb2_write_ok")
	public ModelAndView guestBook2WriteOk(GuestBook2VO gb2vo, HttpServletRequest request) {
		
		try {
			ModelAndView mv = new ModelAndView("redirect:/gb2_list");
			
			// 파일 정보 확인
			// System.out.println("파일 정보 : " + gb2vo.getGb_file_name().getOriginalFilename());
			// 썸머노트 정보 확인
			// System.out.println("썸머노트 정보 : " + gb2vo.getGb_content());
			
			// 저장 위치
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = gb2vo.getGb_file_name();
			
			if (file.isEmpty()) {
				gb2vo.setGb_f_name("");
			} else {
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString() + "_" + file.getOriginalFilename();
				gb2vo.setGb_f_name(f_name);
				
				// 업로드
				file.transferTo(new File(path, f_name));
			}
			
			// 비밀번호 암호화
			String pwd = passwordEncoder.encode(gb2vo.getGb_pw());
			gb2vo.setGb_pw(pwd);
			
			int result = guestBook2Service.getGuestBook2Insert(gb2vo);
			if (result > 0) {
				return mv;
			}
			
			return new ModelAndView("guestbook2/error");
			
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("guestbook2/error");
		}
		
	}
	
	@GetMapping("/guestbook2_down")
	public void guestBook2Down(HttpServletRequest request, HttpServletResponse response) {
		try {
			String f_name = request.getParameter("f_name");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/" + f_name);
			String r_path = URLEncoder.encode(f_name, "UTF-8");

			// 브라우저설정
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=" + r_path);
			
			File file = new File(new String(path.getBytes(), "utf-8"));
			FileInputStream in = new FileInputStream(file);
			
			OutputStream out = response.getOutputStream();
			
			FileCopyUtils.copy(in, out);
					
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	
	
}

package com.ict.edu03.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.edu03.vo.FileVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class FileController {
	
	@GetMapping("/f_up1")
	public ModelAndView fileup() {
		return new ModelAndView("day03/error");
	}
	
	// 업로드
	@PostMapping("/f_up1")
	public ModelAndView fileup(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			ModelAndView mv = new ModelAndView("day03/result");
			// 실전에서는 프로젝트가 아닌 다른 곳에 저장 할 수도 있다. (AWS의 S3나 서버의 특정위치)
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			
			// cos 라이브러리를 사용하면 request를 사용하는 것 아니다.
			MultipartRequest mr = new MultipartRequest(
					request,			// request 대신하기 위해서 request를 받는다. | mr로 받는다.
					path,				// 저장 위치
					500*1024*1024,		// 한번에 업로드할 수 있는 최대 크기
										// 500MB (1024(KB) * 1024(MB) * 1024(GB) * 1024(TB))
					"utf-8",			// 한글처리
					new DefaultFileRenamePolicy()); // 같은 이름의 파일이 있을 때 이름뒤에 숫자를 붙여 업로드 한다.
			
			// String name = request.getParameter("name");
			// System.out.println("name : " + name); // null 나옴
			
			String name = mr.getParameter("name");
			String f_name = mr.getFilesystemName("f_name"); // 저장 당시 이름
			String file_type = mr.getContentType("f_name");
			
			// 해당 파일 정보 추출
			File file = mr.getFile("f_name");
			// long size = file.length();			// 파일 크기를 byte로 나타냄
			long size = file.length() / 1024;			// 파일 크기를 KB로 나타냄
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss E");
			String lastday = sdf.format(file.lastModified());	// 최종 마지막 수정날짜
			
			mv.addObject("name", name);
			mv.addObject("f_name", f_name);
			mv.addObject("file_type", file_type);
			mv.addObject("size", size);
			mv.addObject("lastday", lastday);
			
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("day03/error");
		}
	}
	
	// 다운로드
	@GetMapping("/down")
	public void FileDown(HttpServletRequest request, HttpServletResponse response) {
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		
		try {
			String f_name = request.getParameter("f_name");
			
			// 저장할 때는 위치만 알면 되지만 저장한 때는 이름까지 알아야 한다. (추가 : "경로" + f_name)
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/" + f_name);
			
			String r_path = URLEncoder.encode(f_name, "utf-8");
			
			// 브라우저 설정
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=" + r_path);			
			
			// 실제 다운로드 하기
			File file = new File(new String(path.getBytes(),"utf-8"));
			int b;
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			bos = new BufferedOutputStream(response.getOutputStream());
			
			while ((b=bis.read()) != -1) {
				bos.write(b);
				bos.flush();
			}
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				bos.close();
				bis.close();
				fis.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
	}
	
	@GetMapping("/f_up2")
	public ModelAndView file2Getup() {
		return new ModelAndView("day03/error");
	}
	
	@PostMapping("/f_up2")
	public ModelAndView fileup2(
			// @RequestParam("name") String name,
			@RequestParam("f_name") MultipartFile f_name,
			HttpServletRequest request) {
		
		try {
			ModelAndView mv = new ModelAndView("day03/result");
			
			
			// 저장할 때는 위치만 알면 되지만 저장한 때는 이름까지 알아야 한다. (추가 : "경로" + f_name)
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			// f_name == @RequestParam("f_name") MultipartFile f_name,
			// 파일 업로드 할 때의 이름만 존재한다.
			// 즉 같은 이름의 파일을 업로드 하면 업로드가 되지 않는다. (단점)
			// 보통 해결책은 파일이름 뒤에 id와 업로드 날짜를 붙인다.
			// 아니면 UUID를 생성해서 붙인다.
			UUID uuid = UUID.randomUUID();
			String fname = uuid.toString()+"_"+f_name.getOriginalFilename();
			
			String age = request.getParameter("age");
			String file_type = f_name.getContentType();
			long size = f_name.getSize()/1024;
			
			// 실제 올리는 작업을 하자 
			// FileCopyUtils.copy(byte[] in, file out) : byte 타입배열을 지정한 파일에 복사한다.
			
			// 올린 파일을 byte[] 만듦
			byte[] in = f_name.getBytes();
			
			//  업로드할 장소와 저장이름 지정
			File out = new File(path, fname);
			
			// 파일 복사 (upload, download)
			FileCopyUtils.copy(in, out);
			
			String name = request.getParameter("name");
			
			mv.addObject("name", name);
			mv.addObject("f_name", fname);
			mv.addObject("file_type", file_type);
			mv.addObject("size", size);
			// mv.addObject("lastday", lastday);
			 
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("day03/error");
		}
		
	}
	
	// 다운로드
	@GetMapping("/down2")
	public void filedown2(HttpServletRequest request, HttpServletResponse response) {
		try {
			String f_name = request.getParameter("f_name");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/" + f_name);
			
			String r_path = URLEncoder.encode(path);
			
			// 브라우저 설정
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=" + r_path);
			
			File file = new File(new String(path.getBytes(), "utf-8"));
			FileInputStream in = new FileInputStream(file);
			
			// file out
			OutputStream out = response.getOutputStream();
			
			// in : byte[], out : 장소
			FileCopyUtils.copy(in, out);
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	

	
	

	@PostMapping("/f_up3")
	public ModelAndView fileup3(
			FileVO fvo,
			HttpServletRequest request) {
		
		try {
			ModelAndView mv = new ModelAndView("day03/result");
			
			// 저장할 때는 위치만 알면 되지만 저장한 때는 이름까지 알아야 한다. (추가 : "경로" + f_name)
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			// f_name == @RequestParam("f_name") MultipartFile f_name,
			// 파일 업로드 할 때의 이름만 존재한다.
			// 즉 같은 이름의 파일을 업로드 하면 업로드가 되지 않는다. (단점)
			// 보통 해결책은 파일이름 뒤에 id와 업로드 날짜를 붙인다.
			// 아니면 UUID를 생성해서 붙인다.
			UUID uuid = UUID.randomUUID();
			MultipartFile f_name = fvo.getF_name();
			String fname = uuid.toString()+"_"+f_name.getOriginalFilename();
			
			String age = request.getParameter("age");
			String file_type = f_name.getContentType();
			long size = f_name.getSize()/1024;
			
			// 실제 올리는 작업을 하자 
			// FileCopyUtils.copy(byte[] in, file out) : byte 타입배열을 지정한 파일에 복사한다.
			
			// 올린 파일을 byte[] 만듦
			byte[] in = f_name.getBytes();
			
			//  업로드할 장소와 저장이름 지정
			File out = new File(path, fname);
			
			// 파일 복사 (upload, download)
			FileCopyUtils.copy(in, out);
			
			String name = fvo.getName();
			
			// lastday 구하기
			long lastModified = out.lastModified(); // 마지막 수정 날짜 구하기
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss E");
			String lastday = sdf.format(lastModified);	// 최종 마지막 수정날짜
			
			mv.addObject("name", name);
			mv.addObject("f_name", fname);
			mv.addObject("file_type", file_type);
			mv.addObject("size", size);
			mv.addObject("lastday", lastday);
			 
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("day03/error");
		}
		
	}

}

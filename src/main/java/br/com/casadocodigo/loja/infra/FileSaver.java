package br.com.casadocodigo.loja.infra;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {
	
	@Autowired
	private HttpServletRequest request;
	
	public String write(String basePath, MultipartFile arquivo){
		try {
			String realPath = request.getServletContext().getRealPath("/" + basePath);
			File file = new File(realPath + "/" + arquivo.getOriginalFilename());
			file.getParentFile().mkdirs();
			
			System.out.println(file.getParent());
			if(!file.exists()){
				arquivo.transferTo(file);
			}
			
			return basePath + "/" + arquivo.getOriginalFilename();
		} catch (IllegalStateException | IOException e) {
			throw new RuntimeException(e);
		}
	}
}

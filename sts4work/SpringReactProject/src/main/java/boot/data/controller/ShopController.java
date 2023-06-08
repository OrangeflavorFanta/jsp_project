package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import boot.data.dto.ShopDto;
import boot.data.service.ShopService;

@RestController
@CrossOrigin
@RequestMapping("/shop")
public class ShopController {

   @Autowired
   private ShopService shopService;

   // 폼의 이미지만 업로드 되게
   // 여기서 String은 포워드가 아닌 photo에 대한 String
   // react에서 업도르한 이미지명( = 변경된 이미지명)
   String photoName;

   @PostMapping("/upload")
   public String fileUpload(@RequestParam MultipartFile uploadFile, HttpSession session) {
      // 파일명
      String fileName = uploadFile.getOriginalFilename();

      // 업로드할 폴더 위치
      String path = session.getServletContext().getRealPath("/save");

      // 직전 이미지 삭제 후 업로드
      File file = new File(path + "/" + photoName);
      if (file.exists()) {
         file.delete();
      }
      // 파일명 변경
      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
      photoName = "f_" + sdf.format(new Date()) + uploadFile.getOriginalFilename();

      System.out.println("fileName:" + fileName + "==>" + photoName);

      // save에 업로드
      try {
         uploadFile.transferTo(new File(path + "/" + photoName));
      } catch (IllegalStateException | IOException e) {
         // TODO
         // Auto-generated
         // catch block
         e.printStackTrace();
      }

      return photoName;

   }
   
   //insert
   @PostMapping("/insert")
   public void insertShop(@RequestBody ShopDto dto) { // json으로 보낸걸 자바클래스로 변경해야하므로 requestbody
      // 업로드할 사진명
      dto.setPhoto(photoName);
      shopService.insertShop(dto);
   }

}
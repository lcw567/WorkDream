package com.cs.workdream.common.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@CrossOrigin
@Controller
public class BusinessRegistrationApiClient {
	/*
	  	[국세청 사업자등록정보 상태조회 서비스 API]
	  	- Ver 1.1.0
	  	- Method는 POST만 지원됩니다.
	  	
	  	[ajax 요청 방법]
	  	url: "numberCheck.api",
        type: "POST",
		contentType: "application/json",
		data: JSON.stringify({ checkNumber: number }),
		
		*** success의 result값은 true(조회 성공) 또는 false(조회 실패)
	 */
	
	// 서비스키
	private final String ServiceKey = "gOn%2FFXCdwGgJ1DcdEYhnW%2BZ%2BNfxmcUslrsWA3MYlh4FLh2aUVeHUWn8y%2BUm07ed43SjDtsNA0xNV5ry2lbN0FQ%3D%3D";

	@RequestMapping("/numberCheck.api")
	@ResponseBody
    public boolean checkBusinessNumber(@RequestBody BusinessNumberRequest request) {
        // URL 설정
        String url = "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=" + ServiceKey;
        System.out.println("requestUrl : " + url);
        
        try {
            // HttpURLConnection 객체 생성
            URL requestUrl = new URL(url);
            HttpURLConnection conn = (HttpURLConnection) requestUrl.openConnection();

            // 요청 방식 설정 (POST)
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Accept", "application/json");
            conn.setDoOutput(true);

            // JSON 요청 데이터 생성
            String data = "{\"b_no\": [\"" + request.getCheckNumber() + "\"]}";

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = data.getBytes("UTF-8");
                os.write(input, 0, input.length);
            }

            // 응답 코드 확인
            int responseCode = conn.getResponseCode();
            System.out.println("Response Code: " + responseCode);

            if(responseCode != HttpURLConnection.HTTP_OK) {
                System.out.println("Error: Response Code " + responseCode);
                return false;
            }

            // 응답 데이터 읽기
            StringBuilder response = new StringBuilder();
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"))) {
                String inputLine;
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
            }

            // 응답 결과 판별
            String responseString = response.toString();
            JsonObject jsonResponse = JsonParser.parseString(responseString).getAsJsonObject();
            JsonArray dataArray = jsonResponse.getAsJsonArray("data");

            if (dataArray != null && dataArray.size() > 0) {
                JsonObject firstRecord = dataArray.get(0).getAsJsonObject();
                String taxType = firstRecord.get("tax_type").getAsString();

                // tax_type의 값이 "국세청에 등록되지 않은 사업자등록번호입니다." 면 false 반환 > 아니면 true 반환
                return !taxType.equals("국세청에 등록되지 않은 사업자등록번호입니다.");
            }

            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
	
	// 요청 Body를 처리할 클래스
	public static class BusinessNumberRequest {
		private String checkNumber;
		
		public String getCheckNumber() {
			return checkNumber;
		}
		
		public void setCheckNumber(String checkNumber) {
			this.checkNumber = checkNumber;
		}
	}
}

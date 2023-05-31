package com.earthball.member.store.template;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.io.IOException;

public class GeocodingApi {
    private static final String REST_API_KEY = "83a4476c8819ab502b4056fe5534f388";

    public static void main(String[] args) {
        String address = "서울특별시 사당4동";
        GeocodingApi geocodingApi = new GeocodingApi();
        geocodingApi.getGeocode(address);
    }

    public double[] getGeocode(String address) {
        try {
            String encodedAddress = java.net.URLEncoder.encode(address, "UTF-8");
            String apiUrl = "https://dapi.kakao.com/v2/local/search/address.json?query=" + encodedAddress;
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "KakaoAK " + REST_API_KEY);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            StringBuilder sb = new StringBuilder();
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();

            JSONParser parser = new JSONParser();
            JSONObject jsonObject = (JSONObject) parser.parse(sb.toString());
            JSONArray documents = (JSONArray) jsonObject.get("documents");
            if (documents.size() > 0) {
                JSONObject firstDocument = (JSONObject) documents.get(0);
                JSONObject addressInfo = (JSONObject) firstDocument.get("address");
                String latitudeStr = (String) addressInfo.get("y");
                double latitude = Double.parseDouble(latitudeStr);
                String longitudeStr = (String) addressInfo.get("x");
                double longitude = Double.parseDouble(longitudeStr);
                System.out.println("위도: " + latitude);
                System.out.println("경도: " + longitude);
                return new double[]{latitude, longitude};
            } else {
                System.out.println("검색 결과가 없습니다.");
                return new double[] {0.0, 0.0};
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
		return null;
    }
}